package com.russellmiller.iprep.shared.models

import kotlinx.serialization.Serializable

@Serializable
data class QuestionStudyState(
    val questionId: String,
    val moduleId: String,
    val isCorrect: Boolean,
    val isAnswered: Boolean,
    val timesAnswered: Int = 0,
    val timesCorrect: Int = 0,
    val lastAnsweredAt: Long? = null,
    val difficulty: StudyDifficulty = StudyDifficulty.UNKNOWN
) {
    val accuracy: Float
        get() = if (timesAnswered == 0) 0f else timesCorrect.toFloat() / timesAnswered
    
    val needsReview: Boolean
        get() = isAnswered && (!isCorrect || accuracy < 0.7f)
}

@Serializable
enum class StudyDifficulty {
    UNKNOWN,
    EASY,
    MEDIUM,
    HARD
}

@Serializable
data class StudyProgress(
    val moduleId: String,
    val totalQuestions: Int,
    val answeredQuestions: Int,
    val correctAnswers: Int,
    val studyStates: Map<String, QuestionStudyState>
) {
    val completionPercentage: Float
        get() = if (totalQuestions == 0) 0f else answeredQuestions.toFloat() / totalQuestions
    
    val accuracy: Float
        get() = if (answeredQuestions == 0) 0f else correctAnswers.toFloat() / answeredQuestions
    
    val needsReviewCount: Int
        get() = studyStates.values.count { it.needsReview }
}
