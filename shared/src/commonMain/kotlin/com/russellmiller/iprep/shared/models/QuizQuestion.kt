package com.russellmiller.iprep.shared.models

import kotlinx.serialization.Serializable

@Serializable
data class QuizOption(
    val id: String,
    val text: String,
    val imageURL: String? = null
)

@Serializable
data class QuizQuestion(
    val id: String,
    val number: Int,
    val prompt: String,
    val options: List<QuizOption>,
    val correctOptionId: String,
    val explanation: String,
    val references: List<String>,
    val imageURLs: List<String>,
    val explanationImageURLs: List<String>
) {
    fun option(withId: String): QuizOption? {
        return options.firstOrNull { it.id == withId }
    }
}

@Serializable
data class QuizModule(
    val summary: Module,
    val questions: List<QuizQuestion>
) {
    val id: String get() = summary.id
}

@Serializable
data class QuizSessionQuestion(
    val module: QuizModule,
    val question: QuizQuestion
) {
    val id: String get() = question.id
}
