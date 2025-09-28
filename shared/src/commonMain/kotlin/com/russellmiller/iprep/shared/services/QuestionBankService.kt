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
            // Load from resources
            // For now, use placeholder data since resource loading is complex in KMP
            val jsonString = """
                {
                    "modules": []
                }
            """.trimIndent()
            
            val json = Json { ignoreUnknownKeys = true }
            val dto = json.decodeFromString<QuestionBankDTO>(jsonString)
            
            val quizModules = dto.modules.map { moduleDTO ->
                val difficulty = Module.Difficulty.values().find { it.value == moduleDTO.difficulty } ?: Module.Difficulty.MODERATE
                val summary = Module(
                    id = moduleDTO.id,
                    title = moduleDTO.title,
                    description = moduleDTO.description,
                    questionCount = moduleDTO.questions.size,
                    estimatedTimeMinutes = moduleDTO.estimatedTimeMinutes,
                    difficulty = difficulty
                )
                
                val questions = moduleDTO.questions.map { questionDTO ->
                    val options = questionDTO.options.map { optionDTO ->
                        QuizOption(
                            id = optionDTO.id.lowercase(),
                            text = optionDTO.text,
                            imageURL = null
                        )
                    }
                    
                    QuizQuestion(
                        id = questionDTO.id,
                        number = questionDTO.number,
                        prompt = questionDTO.prompt,
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
            
            Triple(quizModules, quizModules.associateBy { it.id }, quizModules.sumOf { it.questions.size })
        } catch (e: Exception) {
            // Fallback to placeholder data
            val placeholderModules = Module.placeholder.map { module ->
                QuizModule(
                    summary = module,
                    questions = emptyList()
                )
            }
            
            Triple(placeholderModules, placeholderModules.associateBy { it.id }, 0)
        }
        
        this.modules = loadedModules
        this.modulesById = loadedModulesById
        this.totalQuestionCount = loadedTotalCount
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
