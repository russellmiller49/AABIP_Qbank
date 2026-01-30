package com.russellmiller.iprep.duel

import android.content.Context
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import com.russellmiller.iprep.shared.models.CompletedDuel
import com.russellmiller.iprep.shared.models.DuelPersistenceData
import com.russellmiller.iprep.shared.models.PlayerProfile

class DuelStore(context: Context) {
    private val key = "AABIPIPREP.duelData"
    private val prefs = context.getSharedPreferences("iprep_duel", Context.MODE_PRIVATE)

    var data: DuelPersistenceData by mutableStateOf(load())
        private set

    private fun load(): DuelPersistenceData {
        val blob = prefs.getString(key, null) ?: return DuelPersistenceData.empty
        return DuelPersistenceData.decode(blob)
    }

    private fun persist() {
        prefs.edit().putString(key, DuelPersistenceData.encode(data)).apply()
    }

    fun updateProfile(profile: PlayerProfile) {
        data = data.copy(playerProfile = profile)
        persist()
    }

    fun updateRecentQuestionIds(seen: List<String>, missed: List<String>) {
        data = data.copy(
            recentlySeenQuestionIds = seen,
            recentlyMissedQuestionIds = missed
        )
        persist()
    }

    fun addCompletedDuel(duel: CompletedDuel) {
        val updated = (listOf(duel) + data.recentDuels).take(20)
        data = data.copy(recentDuels = updated)
        persist()
    }

    fun weakTopics(limit: Int = 3): List<String> {
        return data.playerProfile.topicMastery
            .entries
            .sortedBy { it.value }
            .take(limit)
            .map { it.key }
    }
}

