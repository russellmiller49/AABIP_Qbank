package com.russellmiller.iprep.shared.models

import com.russellmiller.iprep.shared.util.currentTimeMillis
import kotlinx.serialization.Serializable
import kotlin.random.Random

@Serializable
data class QuizSessionConfiguration(
    val mode: QuizMode,
    val questionLimit: Int? = null,
    val timeLimitMinutes: Int? = null,
    val shuffleQuestions: Boolean = true,
    val showExplanations: Boolean = true
)

@Serializable
sealed class QuizMode {
    @Serializable
    data class QuickStart(val resume: Boolean) : QuizMode()

    @Serializable
    data class Module(val id: String, val title: String) : QuizMode()

    @Serializable
    object IncorrectOnly : QuizMode()
}

@Serializable
data class QuizSessionState(
    val configuration: QuizSessionConfiguration,
    val questions: List<QuizSessionQuestion>,
    val sessionId: String = generateSessionId(),
    val sessionStartedAt: Long = currentTimeMillis(),
    val currentQuestionIndex: Int = 0,
    val answers: Map<String, String> = emptyMap(),
    val completedAt: Long? = null,
    val isCompleted: Boolean = false
) {
    val currentQuestion: QuizSessionQuestion?
        get() = questions.getOrNull(currentQuestionIndex)

    val progress: Float
        get() = if (questions.isEmpty()) 0f else (currentQuestionIndex.toFloat() / questions.size).coerceIn(0f, 1f)

    val isLastQuestion: Boolean
        get() = currentQuestionIndex >= questions.size - 1

    val score: Int
        get() = answers.count { (questionId, answerId) ->
            questions.find { it.question.id == questionId }
                ?.question
                ?.correctOptionId == answerId
        }

    val totalQuestions: Int
        get() = questions.size

    val answeredQuestionCount: Int
        get() = answers.size

    val accuracy: Float
        get() = if (totalQuestions == 0) 0f else score.toFloat() / totalQuestions

    val durationMillis: Long
        get() = (completedAt ?: currentTimeMillis()) - sessionStartedAt

    fun questionReferences(): List<QuizSessionQuestionReference> {
        return questions.map { question ->
            QuizSessionQuestionReference(
                moduleID = question.module.summary.id,
                questionID = question.question.id
            )
        }
    }

    fun complete(at: Long = currentTimeMillis()): QuizSessionState {
        return copy(completedAt = at, isCompleted = true)
    }

    companion object {
        private fun generateSessionId(): String {
            return buildString {
                append("session-")
                append(currentTimeMillis())
                append('-')
                append(Random.nextInt(0, Int.MAX_VALUE))
            }
        }
    }
}

@Serializable
data class QuizSessionQuestionReference(
    val moduleID: String,
    val questionID: String
)

@Serializable
data class CompletedQuizSession(
    val sessionId: String,
    val startedAt: Long,
    val completedAt: Long,
    val totalQuestions: Int,
    val correctCount: Int,
    val questionReferences: List<QuizSessionQuestionReference>,
    val selections: Map<String, String>,
    val configuration: QuizSessionConfiguration
) {
    val durationMillis: Long
        get() = completedAt - startedAt

    val accuracy: Float
        get() = if (totalQuestions == 0) 0f else correctCount.toFloat() / totalQuestions
}

@Serializable
data class QuizSessionResults(
    val session: QuizSessionState,
    val score: Int,
    val totalQuestions: Int,
    val accuracy: Float,
    val timeSpent: Long,
    val questionsAnswered: Int
)
