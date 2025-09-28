package com.russellmiller.iprep.shared.models

import kotlinx.serialization.Serializable

@Serializable
sealed class AppRoute {
    @Serializable
    object Dashboard : AppRoute()
    
    @Serializable
    data class Quiz(val mode: QuizMode) : AppRoute()
    
    @Serializable
    object ProgressReport : AppRoute()
    
    @Serializable
    object Review : AppRoute()
    
    @Serializable
    object Analytics : AppRoute()
    
    @Serializable
    object Settings : AppRoute()
    
    @Serializable
    object QuestionExplorer : AppRoute()
    
    @Serializable
    object Leaderboard : AppRoute()
}
