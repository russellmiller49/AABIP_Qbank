package com.russellmiller.iprep.shared.models

import kotlinx.serialization.Serializable

@Serializable
data class Module(
    val id: String,
    val title: String,
    val description: String,
    val questionCount: Int,
    val estimatedTimeMinutes: Int,
    val difficulty: Difficulty
) {
    @Serializable
    enum class Difficulty(val value: String) {
        EASY("easy"),
        MODERATE("moderate"),
        HARD("hard")
    }
    
    companion object {
        val placeholder = listOf(
            Module(
                id = "advanced-bronchoscopy",
                title = "Advanced Therapeutic Bronchoscopy",
                description = "Latest interventional techniques and peri-procedural care.",
                questionCount = 42,
                estimatedTimeMinutes = 35,
                difficulty = Difficulty.HARD
            ),
            Module(
                id = "airway-disease",
                title = "Airway Disease",
                description = "Diagnosis and management pathways for airway disorders.",
                questionCount = 38,
                estimatedTimeMinutes = 30,
                difficulty = Difficulty.MODERATE
            ),
            Module(
                id = "pleural-disease",
                title = "Pleural Disease",
                description = "Evidence-based approaches to pleural pathology.",
                questionCount = 24,
                estimatedTimeMinutes = 20,
                difficulty = Difficulty.MODERATE
            )
        )
    }
}
