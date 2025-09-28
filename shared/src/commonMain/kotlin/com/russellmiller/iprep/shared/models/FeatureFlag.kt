package com.russellmiller.iprep.shared.models

import kotlinx.serialization.Serializable

@Serializable
enum class FeatureFlagKey {
    ENABLE_ANALYTICS,
    ENABLE_LEADERBOARD,
    ENABLE_OFFLINE_MODE,
    ENABLE_DARK_MODE,
    ENABLE_NOTIFICATIONS,
    ENABLE_SOCIAL_FEATURES,
    ENABLE_ADVANCED_QUIZ_MODES,
    ENABLE_PROGRESS_TRACKING,
    ENABLE_QUESTION_EXPLORER,
    ENABLE_STUDY_PLANNER
}

@Serializable
data class FeatureFlag(
    val key: FeatureFlagKey,
    val enabled: Boolean,
    val description: String? = null,
    val defaultValue: Boolean = false
)
