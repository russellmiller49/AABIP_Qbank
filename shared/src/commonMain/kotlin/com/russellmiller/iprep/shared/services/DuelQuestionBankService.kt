package com.russellmiller.iprep.shared.services

import com.russellmiller.iprep.shared.models.DuelQuestion
import com.russellmiller.iprep.shared.models.Enemy
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json
import kotlin.random.Random

class DuelQuestionBankService(
    private val rng: Random = Random.Default // Injectable for tests
) {
    private var questions: List<DuelQuestion> = emptyList()
    private var questionsByTopic: Map<String, List<DuelQuestion>> = emptyMap()

    companion object {
        // Selection weights
        const val ENEMY_BIAS_WEIGHT = 0.30f
        const val WEAKNESS_WEIGHT = 0.25f
        const val MISSED_WEIGHT = 0.25f
        // Novelty enforced via filtering, not scoring

        const val GLOBAL_RECENT_BAN = 20 // Soft ban recently seen
        const val RELAXED_BAN = 10 // Fallback if pool too small
    }

    fun loadQuestions(jsonString: String) {
        val json = Json { ignoreUnknownKeys = true }
        questions = json.decodeFromString<List<DuelQuestion>>(jsonString)
        questionsByTopic = questions.groupBy { it.topic }
    }

    fun selectQuestion(
        enemy: Enemy,
        alreadySeen: List<String>, // Questions asked THIS duel (hard ban)
        recentlySeen: List<String>, // Last N across all duels (soft ban)
        recentlyMissed: List<String>, // Questions gotten wrong recently
        weakTopics: List<String>
    ): DuelQuestion? {
        if (questions.isEmpty()) return null

        // Hard constraint: never repeat in same duel
        var candidates = questions.filter { it.id !in alreadySeen }
        if (candidates.isEmpty()) return questions.random(rng)

        // Soft constraint: try to avoid recently seen globally
        val freshCandidates = candidates.filter { it.id !in recentlySeen.take(GLOBAL_RECENT_BAN) }
        if (freshCandidates.size >= 5) {
            candidates = freshCandidates
        } else {
            // Relax to smaller ban
            val relaxedCandidates = candidates.filter { it.id !in recentlySeen.take(RELAXED_BAN) }
            if (relaxedCandidates.size >= 3) {
                candidates = relaxedCandidates
            }
            // If still too small, use all non-duel-seen candidates
        }

        // Score remaining candidates
        val scored = candidates.map { question ->
            var score = 0f

            // Enemy topic bias
            if (enemy.topicBiases.any { bias ->
                    question.topic.contains(bias, ignoreCase = true)
                }) {
                score += ENEMY_BIAS_WEIGHT
            }

            // Player weakness
            if (weakTopics.any { weak ->
                    question.topic.contains(weak, ignoreCase = true)
                }) {
                score += WEAKNESS_WEIGHT
            }

            // Recently missed boost
            if (question.id in recentlyMissed) {
                score += MISSED_WEIGHT
            }

            // Small random factor
            score += rng.nextFloat() * 0.1f

            question to score
        }

        // Weighted random selection
        val totalScore = scored.sumOf { it.second.toDouble() }.toFloat()
        if (totalScore <= 0f) return candidates.random(rng)

        var pick = rng.nextFloat() * totalScore
        for ((question, weight) in scored) {
            pick -= weight
            if (pick <= 0f) return question
        }

        return scored.maxByOrNull { it.second }?.first ?: candidates.random(rng)
    }

    fun allQuestions(): List<DuelQuestion> = questions
    fun topics(): Set<String> = questionsByTopic.keys

    private fun <T> List<T>.random(rng: Random): T = this[rng.nextInt(this.size)]
}

