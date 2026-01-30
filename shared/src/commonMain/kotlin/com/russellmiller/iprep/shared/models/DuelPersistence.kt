package com.russellmiller.iprep.shared.models

import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import kotlinx.serialization.decodeFromString

@Serializable
data class DuelPersistenceData(
    // topicMastery lives here (single source)
    val playerProfile: PlayerProfile,
    // Keep last 20
    val recentDuels: List<CompletedDuel> = emptyList(),
    val recentlySeenQuestionIds: List<String> = emptyList(),
    val recentlyMissedQuestionIds: List<String> = emptyList()
    // NO topicMastery here - it's in PlayerProfile
) {
    companion object {
        val empty = DuelPersistenceData(
            playerProfile = PlayerProfile(id = "local")
        )

        private val json = Json { ignoreUnknownKeys = true; encodeDefaults = true }

        // Cross-platform helpers: iOS/Android store a string blob
        fun encode(data: DuelPersistenceData): String = json.encodeToString(DuelPersistenceData.serializer(), data)
        fun decode(jsonString: String): DuelPersistenceData = runCatching {
            json.decodeFromString(DuelPersistenceData.serializer(), jsonString)
        }.getOrElse {
            empty
        }
    }
}

// Mastery update rule: +0.04 for correct, -0.02 for wrong (clamped 0..1)
fun updateMastery(profile: PlayerProfile, topic: String, isCorrect: Boolean): PlayerProfile {
    val current = profile.topicMastery[topic] ?: 0.5f
    val delta = if (isCorrect) 0.04f else -0.02f
    val newMastery = (current + delta).coerceIn(0f, 1f)
    return profile.copy(
        topicMastery = profile.topicMastery + (topic to newMastery)
    )
}
