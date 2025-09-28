package com.russellmiller.iprep.shared.models

import kotlinx.serialization.Serializable

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
    val currentQuestionIndex: Int = 0,
    val answers: Map<String, String> = emptyMap(),
    val startTime: Long = 0L,
    val isCompleted: Boolean = false
) {
    val currentQuestion: QuizSessionQuestion?
        get() = questions.getOrNull(currentQuestionIndex)
    
    val progress: Float
        get() = if (questions.isEmpty()) 0f else currentQuestionIndex.toFloat() / questions.size
    
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
}

@Serializable
data class QuizSessionQuestionReference(
    val moduleID: String,
    val questionID: String
)
