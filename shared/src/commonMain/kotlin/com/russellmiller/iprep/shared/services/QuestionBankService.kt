package com.russellmiller.iprep.shared.services

import com.russellmiller.iprep.shared.models.*
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import kotlinx.serialization.decodeFromString

@Serializable
data class QuestionBankDTO(
    val modules: List<ModuleDTO>
)

@Serializable
data class ModuleDTO(
    val id: String,
    val title: String,
    val description: String,
    val estimatedTimeMinutes: Int,
    val difficulty: String,
    val questionCount: Int,
    val questions: List<QuestionDTO>
)

@Serializable
data class QuestionDTO(
    val id: String,
    val number: Int,
    val prompt: String,
    val options: List<OptionDTO>,
    val correctOptionId: String,
    val explanation: String,
    val references: List<String>,
    val imageURLs: List<String>
)

@Serializable
data class OptionDTO(
    val id: String,
    val text: String
)

class QuestionBankService {
    private val modules: List<QuizModule>
    private val modulesById: Map<String, QuizModule>
    val totalQuestionCount: Int
    
    init {
        val (loadedModules, loadedModulesById, loadedTotalCount) = try {
            val jsonString = loadQuestionBankJson()
                ?: error("QuestionBank.json not found in resources")

            val json = Json { ignoreUnknownKeys = true }
            val dto = json.decodeFromString<QuestionBankDTO>(jsonString)

            val quizModules = dto.modules.map { moduleDTO ->
                val difficulty = Module.Difficulty.values().find { it.value == moduleDTO.difficulty }
                    ?: Module.Difficulty.MODERATE

                val summary = Module(
                    id = moduleDTO.id,
                    title = moduleDTO.title,
                    description = moduleDTO.description,
                    questionCount = moduleDTO.questionCount.takeIf { it > 0 } ?: moduleDTO.questions.size,
                    estimatedTimeMinutes = moduleDTO.estimatedTimeMinutes,
                    difficulty = difficulty
                )

                val questions = moduleDTO.questions.map { questionDTO ->
                    var promptText = questionDTO.prompt

                    var options = questionDTO.options.map { optionDTO ->
                        QuizOption(
                            id = optionDTO.id.lowercase(),
                            text = optionDTO.text,
                            imageURL = null
                        )
                    }

                    if (options.isEmpty()) {
                        val parsed = parseEmbeddedOptions(promptText)
                        if (parsed != null) {
                            promptText = parsed.prompt
                            options = parsed.options
                        }
                    }

                    QuizQuestion(
                        id = questionDTO.id,
                        number = questionDTO.number,
                        prompt = promptText,
                        options = options,
                        correctOptionId = questionDTO.correctOptionId.lowercase(),
                        explanation = questionDTO.explanation,
                        references = questionDTO.references,
                        imageURLs = questionDTO.imageURLs,
                        explanationImageURLs = emptyList()
                    )
                }

                QuizModule(summary = summary, questions = questions)
            }

            Triple(
                quizModules,
                quizModules.associateBy { it.id },
                quizModules.sumOf { it.questions.size }
            )
        } catch (e: Exception) {
            // Fallback to placeholder data when parsing fails
            val placeholderModules = Module.placeholder.map { module ->
                QuizModule(
                    summary = module,
                    questions = emptyList()
                )
            }

            Triple(
                placeholderModules,
                placeholderModules.associateBy { it.id },
                placeholderModules.sumOf { it.questions.size }
            )
        }

        this.modules = loadedModules
        this.modulesById = loadedModulesById
        this.totalQuestionCount = loadedTotalCount
    }

    private fun parseEmbeddedOptions(prompt: String): ParsedOptions? {
        val regex = Regex(" ([a-zA-Z])\\)")
        val matches = regex.findAll(prompt).toList()
        if (matches.isEmpty()) return null

        val options = mutableListOf<QuizOption>()
        for ((index, match) in matches.withIndex()) {
            val label = match.groupValues.getOrNull(1)?.lowercase() ?: continue
            val start = match.range.last + 1
            val end = if (index + 1 < matches.size) {
                matches[index + 1].range.first
            } else {
                prompt.length
            }
            var optionText = prompt.substring(start, end).trim()
            if (optionText.isEmpty()) {
                optionText = "Option ${label.uppercase()}"
            }
            options.add(QuizOption(id = label, text = optionText, imageURL = null))
        }

        if (options.isEmpty()) return null
        val questionText = prompt.substring(0, matches.first().range.first).trim()
        if (questionText.isEmpty()) return null
        return ParsedOptions(prompt = questionText, options = options)
    }

    private data class ParsedOptions(
        val prompt: String,
        val options: List<QuizOption>
    )

    private fun loadQuestionBankJson(): String? {
        val registered = QuestionBankDataRegistry.load()
        if (registered != null) return registered

        return platformLoadQuestionBankJson()
    }
    
    fun moduleSummaries(): List<Module> {
        return modules.map { it.summary }
    }
    
    fun quizModule(id: String): QuizModule? {
        return modulesById[id]
    }
    
    fun questions(moduleId: String): List<QuizQuestion> {
        return modulesById[moduleId]?.questions ?: emptyList()
    }
    
    fun quickStartQuestions(limit: Int = 10, excluding: Set<String> = emptySet()): List<QuizSessionQuestion> {
        if (modules.isEmpty()) return emptyList()
        
        val allQuestions = modules.flatMap { module ->
            module.questions.map { QuizSessionQuestion(module = module, question = it) }
        }
        
        val filtered = allQuestions.filter { !excluding.contains(it.question.id) }
        if (filtered.isEmpty()) return emptyList()
        
        return filtered.shuffled().take(maxOf(1, minOf(limit, filtered.size)))
    }
    
    fun allSessionQuestions(): List<QuizSessionQuestion> {
        return modules.flatMap { module ->
            module.questions.map { QuizSessionQuestion(module = module, question = it) }
        }
    }
    
    fun sessionQuestions(forModule: String): List<QuizSessionQuestion> {
        val module = modulesById[forModule] ?: return emptyList()
        return module.questions.map { QuizSessionQuestion(module = module, question = it) }
    }
    
    fun sessionQuestions(forModule: String, excluding: Set<String>): List<QuizSessionQuestion> {
        val base = sessionQuestions(forModule = forModule)
        if (base.isEmpty()) return emptyList()
        
        val filtered = base.filter { !excluding.contains(it.question.id) }
        return if (filtered.isEmpty()) emptyList() else filtered
    }
    
    fun sessionQuestion(reference: QuizSessionQuestionReference): QuizSessionQuestion? {
        val module = modulesById[reference.moduleID] ?: return null
        val question = module.questions.find { it.id == reference.questionID } ?: return null
        return QuizSessionQuestion(module = module, question = question)
    }
    
    fun moduleCount(): Int {
        return modules.size
    }
    
    fun sessionQuestions(from: List<QuizSessionQuestionReference>): List<QuizSessionQuestion> {
        return from.mapNotNull { reference ->
            sessionQuestion(reference)
        }
    }
}

internal expect fun platformLoadQuestionBankJson(): String?
