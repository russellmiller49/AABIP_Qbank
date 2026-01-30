package com.russellmiller.iprep.shared.models

import kotlinx.serialization.Serializable

@Serializable
data class DuelQuestion(
    // Already prefixed "pearl-diver-XXX" - collision-safe
    val id: String,
    val topic: String,
    val statement: String,
    val answer: Boolean,
    val explanation: String,
    val source: String,
    // For HINT lifeline
    val hint: String
)

// Enemy is defined in EnemyDefinitions and not persisted directly.
// DuelState stores enemyId only; UI resolves via EnemyDefinitions.enemy(id).
class Enemy internal constructor(
    val id: String,
    val name: String,
    val title: String,
    val description: String,
    val iconName: String,
    val themeColor: String,
    val maxHP: Int = 100,
    val topicBiases: List<String>,
    // Unlock logic stays internal - exposed via methods only
    internal val unlockType: UnlockType = UnlockType.NONE,
    internal val unlockValue: Int = 0,
    internal val unlockEnemyId: String? = null
) {
    val displayName: String get() = "$name, $title"

    fun isUnlocked(profile: PlayerProfile): Boolean = when (unlockType) {
        UnlockType.NONE -> true
        UnlockType.DUELS_WON -> profile.duelsWon >= unlockValue
        UnlockType.ENEMY_DEFEATED -> unlockEnemyId in profile.defeatedEnemies
        UnlockType.LEVEL -> profile.level >= unlockValue
    }

    fun lockReason(profile: PlayerProfile): String? = when {
        isUnlocked(profile) -> null
        unlockType == UnlockType.DUELS_WON -> "Win ${unlockValue - profile.duelsWon} more duels"
        unlockType == UnlockType.ENEMY_DEFEATED -> "Defeat ${unlockEnemyId ?: "required enemy"} first"
        unlockType == UnlockType.LEVEL -> "Reach level $unlockValue"
        else -> null
    }
}

internal enum class UnlockType { NONE, DUELS_WON, ENEMY_DEFEATED, LEVEL }

@Serializable
enum class Lifeline {
    // Shows question.hint (replaces 50/50)
    HINT,
    // Next wrong = 50% damage taken
    SHIELD,
    // Next correct = +50% damage dealt
    DOUBLE_TAP
}

@Serializable
data class LifelineState(
    val hintUsed: Boolean = false,
    // Shield: used = consumed for duel, active = armed for next answer
    val shieldUsed: Boolean = false,
    val shieldActive: Boolean = false,
    // DoubleTap: used = consumed for duel, active = armed for next answer
    val doubleTapUsed: Boolean = false,
    val doubleTapActive: Boolean = false
) {
    val remainingCount: Int get() = listOf(!hintUsed, !shieldUsed, !doubleTapUsed).count { it }
}

@Serializable
data class PlayerProfile(
    val id: String,
    val xp: Long = 0,
    val level: Int = 1,
    val duelsWon: Int = 0,
    val duelsLost: Int = 0,
    val totalCorrect: Int = 0,
    val totalAnswered: Int = 0,
    val longestStreak: Int = 0,
    val defeatedEnemies: Set<String> = emptySet(),
    val topicMastery: Map<String, Float> = emptyMap()
) {
    companion object {
        // Level curve: 200 + 75*(level-1)
        // Level 2: 200 XP, Level 3: 275 XP, Level 5: 500 XP, Level 10: 875 XP
        fun xpForLevel(level: Int): Long = if (level <= 1) 0L else (200 + 75 * (level - 1)).toLong()

        fun levelForXP(xp: Long): Int {
            var lvl = 1
            while (xpForLevel(lvl + 1) <= xp) lvl++
            return lvl
        }
    }

    val xpToNextLevel: Long get() = xpForLevel(level + 1) - xp
    val levelProgress: Float
        get() {
            val currentLevelXP = xpForLevel(level)
            val nextLevelXP = xpForLevel(level + 1)
            val range = nextLevelXP - currentLevelXP
            return if (range > 0) (xp - currentLevelXP).toFloat() / range else 1f
        }
}

// Simplified phases - RESOLVING is UI-only
@Serializable
enum class DuelPhase {
    // Show enemy introduction
    INTRO,
    // Display question, awaiting answer
    QUESTION,
    // Show explanation (UI animates damage before this)
    FEEDBACK,
    // Duel complete
    END
}

@Serializable
data class DuelState(
    val id: String,
    // Store ID only, resolve via EnemyDefinitions.enemy(id)
    val enemyId: String,
    // Captured at start from enemy.maxHP
    val enemyMaxHP: Int,
    val playerHP: Int = 100,
    // Initialized from enemyMaxHP in startDuel()
    val enemyHP: Int,
    val currentStreak: Int = 0,
    val maxStreak: Int = 0,
    val questionsAsked: List<String> = emptyList(),
    val currentQuestion: DuelQuestion? = null,
    val phase: DuelPhase = DuelPhase.INTRO,
    val lifelines: LifelineState = LifelineState(),
    val lastAnswer: AnswerResult? = null,
    val showingHint: Boolean = false,
    val startTime: Long = 0L,
    val xpEarned: Long = 0L,
    val correctCount: Int = 0,
    val incorrectCount: Int = 0
) {
    val isPlayerVictory: Boolean get() = enemyHP <= 0
    val isPlayerDefeated: Boolean get() = playerHP <= 0
    val isEnded: Boolean get() = isPlayerVictory || isPlayerDefeated
    val totalAnswered: Int get() = correctCount + incorrectCount

    // Convenience: resolve full enemy from definitions
    val enemy: Enemy? get() = EnemyDefinitions.enemy(enemyId)
}

@Serializable
data class AnswerResult(
    val questionId: String,
    val playerAnswer: Boolean,
    val correctAnswer: Boolean,
    val isCorrect: Boolean,
    val damageDealt: Int,
    val damageTaken: Int,
    val wasCrit: Boolean,
    val streakMultiplier: Float
)

@Serializable
data class CompletedDuel(
    val id: String,
    val enemyId: String,
    val won: Boolean,
    val xpEarned: Long,
    val correctCount: Int,
    val totalQuestions: Int,
    val maxStreak: Int,
    val completedAt: Long,
    val durationSeconds: Long
)
