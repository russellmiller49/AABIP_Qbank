package com.russellmiller.iprep.shared.services

import com.russellmiller.iprep.shared.models.FeatureFlag
import com.russellmiller.iprep.shared.models.FeatureFlagKey
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

class FeatureFlagsService {
    private val _featureFlags = MutableStateFlow<Map<FeatureFlagKey, FeatureFlag>>(emptyMap())
    val featureFlags: StateFlow<Map<FeatureFlagKey, FeatureFlag>> = _featureFlags.asStateFlow()
    
    init {
        // Initialize with default feature flags
        val defaultFlags = mapOf(
            FeatureFlagKey.ENABLE_ANALYTICS to FeatureFlag(
                key = FeatureFlagKey.ENABLE_ANALYTICS,
                enabled = true,
                description = "Enable analytics and progress tracking",
                defaultValue = true
            ),
            FeatureFlagKey.ENABLE_LEADERBOARD to FeatureFlag(
                key = FeatureFlagKey.ENABLE_LEADERBOARD,
                enabled = true,
                description = "Enable leaderboard functionality",
                defaultValue = true
            ),
            FeatureFlagKey.ENABLE_OFFLINE_MODE to FeatureFlag(
                key = FeatureFlagKey.ENABLE_OFFLINE_MODE,
                enabled = true,
                description = "Enable offline mode for studying",
                defaultValue = true
            ),
            FeatureFlagKey.ENABLE_DARK_MODE to FeatureFlag(
                key = FeatureFlagKey.ENABLE_DARK_MODE,
                enabled = true,
                description = "Enable dark mode theme",
                defaultValue = true
            ),
            FeatureFlagKey.ENABLE_NOTIFICATIONS to FeatureFlag(
                key = FeatureFlagKey.ENABLE_NOTIFICATIONS,
                enabled = false,
                description = "Enable push notifications",
                defaultValue = false
            ),
            FeatureFlagKey.ENABLE_SOCIAL_FEATURES to FeatureFlag(
                key = FeatureFlagKey.ENABLE_SOCIAL_FEATURES,
                enabled = false,
                description = "Enable social features and sharing",
                defaultValue = false
            ),
            FeatureFlagKey.ENABLE_ADVANCED_QUIZ_MODES to FeatureFlag(
                key = FeatureFlagKey.ENABLE_ADVANCED_QUIZ_MODES,
                enabled = true,
                description = "Enable advanced quiz modes and configurations",
                defaultValue = true
            ),
            FeatureFlagKey.ENABLE_PROGRESS_TRACKING to FeatureFlag(
                key = FeatureFlagKey.ENABLE_PROGRESS_TRACKING,
                enabled = true,
                description = "Enable detailed progress tracking",
                defaultValue = true
            ),
            FeatureFlagKey.ENABLE_QUESTION_EXPLORER to FeatureFlag(
                key = FeatureFlagKey.ENABLE_QUESTION_EXPLORER,
                enabled = true,
                description = "Enable question explorer functionality",
                defaultValue = true
            ),
            FeatureFlagKey.ENABLE_STUDY_PLANNER to FeatureFlag(
                key = FeatureFlagKey.ENABLE_STUDY_PLANNER,
                enabled = true,
                description = "Enable study planner and scheduling",
                defaultValue = true
            )
        )
        
        _featureFlags.value = defaultFlags
    }
    
    fun isFeatureEnabled(key: FeatureFlagKey): Boolean {
        return _featureFlags.value[key]?.enabled ?: false
    }
    
    fun getFeatureFlag(key: FeatureFlagKey): FeatureFlag? {
        return _featureFlags.value[key]
    }
    
    fun updateFeatureFlag(key: FeatureFlagKey, enabled: Boolean) {
        val currentFlags = _featureFlags.value.toMutableMap()
        currentFlags[key]?.let { flag ->
            currentFlags[key] = flag.copy(enabled = enabled)
            _featureFlags.value = currentFlags
        }
    }
    
    fun updateFeatureFlags(flags: Map<FeatureFlagKey, FeatureFlag>) {
        _featureFlags.value = flags
    }
    
    suspend fun refreshFromRemote() {
        // TODO: Implement remote config fetching
        // For now, keeping local defaults
    }
}
