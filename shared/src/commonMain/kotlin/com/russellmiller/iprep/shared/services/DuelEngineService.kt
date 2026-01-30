package com.russellmiller.iprep.shared.services

import com.russellmiller.iprep.shared.models.AnswerResult
import com.russellmiller.iprep.shared.models.CompletedDuel
import com.russellmiller.iprep.shared.models.DuelPhase
import com.russellmiller.iprep.shared.models.DuelState
import com.russellmiller.iprep.shared.models.Enemy
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlin.math.max
import kotlin.random.Random
import com.russellmiller.iprep.shared.util.currentTimeMillis

class DuelEngineService(
    private val questionBankService: DuelQuestionBankService,
    private val rng: Random = Random.Default // Injectable for tests
) {
    companion object {
        const val BASE_DAMAGE = 12
        const val PLAYER_MAX_HP = 100

        const val BASE_CRIT_CHANCE = 0.05f
        const val CRIT_CHANCE_PER_STREAK = 0.01f
        const val MAX_CRIT_CHANCE = 0.20f
        const val CRIT_MULTIPLIER = 2.0f

        const val DOUBLE_TAP_BONUS = 0.50f
        const val SHIELD_REDUCTION = 0.50f

        const val XP_PER_CORRECT = 10L
        const val XP_STREAK_BONUS = 5L
        const val XP_WIN_BONUS = 50L
    }

    private val _currentDuel = MutableStateFlow<DuelState?>(null)
    val currentDuel: StateFlow<DuelState?> = _currentDuel.asStateFlow()

    // Track recent questions globally (persisted separately)
    private var recentlySeenIds = mutableListOf<String>()
    private var recentlyMissedIds = mutableListOf<String>()
    private var weakTopics = listOf<String>()

    fun setPlayerContext(recentSeen: List<String>, recentMissed: List<String>, weakTopics: List<String>) {
        this.recentlySeenIds = recentSeen.toMutableList()
        this.recentlyMissedIds = recentMissed.toMutableList()
        this.weakTopics = weakTopics
    }

    fun recentlySeenQuestionIds(): List<String> = recentlySeenIds.toList()

    fun recentlyMissedQuestionIds(): List<String> = recentlyMissedIds.toList()

    fun startDuel(enemy: Enemy): DuelState {
        val question = questionBankService.selectQuestion(
            enemy = enemy,
            alreadySeen = emptyList(),
            recentlySeen = recentlySeenIds,
            recentlyMissed = recentlyMissedIds,
            weakTopics = weakTopics
        )

        val state = DuelState(
            id = "duel-${currentTimeMillis()}",
            enemyId = enemy.id,
            enemyMaxHP = enemy.maxHP,
            playerHP = PLAYER_MAX_HP,
            enemyHP = enemy.maxHP,
            currentQuestion = question,
            phase = DuelPhase.INTRO,
            startTime = currentTimeMillis()
        )
        _currentDuel.value = state
        return state
    }

    fun proceedToQuestion() {
        val current = _currentDuel.value ?: return
        _currentDuel.value = current.copy(
            phase = DuelPhase.QUESTION,
            showingHint = false
        )
    }

    fun submitAnswer(playerAnswer: Boolean): AnswerResult? {
        val current = _currentDuel.value ?: return null
        val question = current.currentQuestion ?: return null
        if (current.phase != DuelPhase.QUESTION) return null

        val isCorrect = playerAnswer == question.answer
        val newStreak = if (isCorrect) current.currentStreak + 1 else 0
        val maxStreak = max(current.maxStreak, newStreak)
        // Use newStreak for damage/crit so 3rd correct gets streak=3 bonus
        val multiplier = streakMultiplier(newStreak)
        val isCrit = isCorrect && rollCrit(newStreak)

        var damageDealt = 0
        var damageTaken = 0

        if (isCorrect) {
            var damage = (BASE_DAMAGE * multiplier).toInt()
            if (current.lifelines.doubleTapActive) {
                damage = (damage * (1 + DOUBLE_TAP_BONUS)).toInt()
            }
            if (isCrit) {
                damage = (damage * CRIT_MULTIPLIER).toInt()
            }
            damageDealt = damage
        } else {
            var damage = BASE_DAMAGE
            if (current.lifelines.shieldActive) {
                damage = (damage * SHIELD_REDUCTION).toInt()
            }
            damageTaken = damage

            // Track missed question
            if (question.id !in recentlyMissedIds) {
                recentlyMissedIds.add(0, question.id)
                if (recentlyMissedIds.size > 50) recentlyMissedIds.removeLast()
            }
        }

        // Track seen question
        if (question.id !in recentlySeenIds) {
            recentlySeenIds.add(0, question.id)
            if (recentlySeenIds.size > 30) recentlySeenIds.removeLast()
        }

        val xpGained = if (isCorrect) XP_PER_CORRECT + (newStreak * XP_STREAK_BONUS) else 0L

        val result = AnswerResult(
            questionId = question.id,
            playerAnswer = playerAnswer,
            correctAnswer = question.answer,
            isCorrect = isCorrect,
            damageDealt = damageDealt,
            damageTaken = damageTaken,
            wasCrit = isCrit,
            streakMultiplier = multiplier
        )

        val newPlayerHP = max(0, current.playerHP - damageTaken)
        val newEnemyHP = max(0, current.enemyHP - damageDealt)

        // Clear active lifelines after use
        val newLifelines = current.lifelines.copy(
            shieldActive = false,
            doubleTapActive = false
        )

        _currentDuel.value = current.copy(
            playerHP = newPlayerHP,
            enemyHP = newEnemyHP,
            currentStreak = newStreak,
            maxStreak = maxStreak,
            questionsAsked = current.questionsAsked + question.id,
            lastAnswer = result,
            lifelines = newLifelines,
            xpEarned = current.xpEarned + xpGained,
            correctCount = if (isCorrect) current.correctCount + 1 else current.correctCount,
            incorrectCount = if (!isCorrect) current.incorrectCount + 1 else current.incorrectCount
            // Note: phase stays QUESTION - UI handles "resolving" animation
        )

        return result
    }

    fun showFeedback() {
        val current = _currentDuel.value ?: return

        if (current.isEnded) {
            val winBonus = if (current.isPlayerVictory) XP_WIN_BONUS else 0L
            _currentDuel.value = current.copy(
                phase = DuelPhase.END,
                xpEarned = current.xpEarned + winBonus
            )
        } else {
            _currentDuel.value = current.copy(phase = DuelPhase.FEEDBACK)
        }
    }

    fun proceedToNextQuestion() {
        val current = _currentDuel.value ?: return
        if (current.phase != DuelPhase.FEEDBACK) return
        val enemy = current.enemy ?: return

        val nextQuestion = questionBankService.selectQuestion(
            enemy = enemy,
            alreadySeen = current.questionsAsked,
            recentlySeen = recentlySeenIds,
            recentlyMissed = recentlyMissedIds,
            weakTopics = weakTopics
        )

        _currentDuel.value = current.copy(
            currentQuestion = nextQuestion,
            phase = DuelPhase.QUESTION,
            lastAnswer = null,
            showingHint = false
        )
    }

    fun useHint(): String? {
        val current = _currentDuel.value ?: return null
        if (current.lifelines.hintUsed) return null

        val hint = current.currentQuestion?.hint
        _currentDuel.value = current.copy(
            lifelines = current.lifelines.copy(hintUsed = true),
            showingHint = true
        )
        return hint
    }

    fun useShield(): Boolean {
        val current = _currentDuel.value ?: return false
        if (current.lifelines.shieldUsed) return false

        _currentDuel.value = current.copy(
            lifelines = current.lifelines.copy(
                shieldUsed = true,
                shieldActive = true
            )
        )
        return true
    }

    fun useDoubleTap(): Boolean {
        val current = _currentDuel.value ?: return false
        if (current.lifelines.doubleTapUsed) return false

        _currentDuel.value = current.copy(
            lifelines = current.lifelines.copy(
                doubleTapUsed = true,
                doubleTapActive = true
            )
        )
        return true
    }

    fun getCompletedDuel(): CompletedDuel? {
        val current = _currentDuel.value ?: return null
        if (current.phase != DuelPhase.END) return null
        val enemy = current.enemy ?: return null

        val now = currentTimeMillis()
        return CompletedDuel(
            id = current.id,
            enemyId = enemy.id,
            won = current.isPlayerVictory,
            xpEarned = current.xpEarned,
            correctCount = current.correctCount,
            totalQuestions = current.totalAnswered,
            maxStreak = current.maxStreak,
            completedAt = now,
            durationSeconds = (now - current.startTime) / 1000
        )
    }

    fun endDuel() {
        _currentDuel.value = null
    }

    private fun streakMultiplier(streak: Int): Float = when {
        streak < 3 -> 1.0f
        streak < 6 -> 1.25f
        streak < 10 -> 1.5f
        else -> 1.75f
    }

    private fun rollCrit(streak: Int): Boolean {
        val chance = kotlin.math.min(MAX_CRIT_CHANCE, BASE_CRIT_CHANCE + streak * CRIT_CHANCE_PER_STREAK)
        return rng.nextFloat() < chance
    }
}

