package com.russellmiller.iprep.shared.services

import com.russellmiller.iprep.shared.models.Enemy
import com.russellmiller.iprep.shared.models.PlayerProfile
import com.russellmiller.iprep.shared.models.UnlockType
import com.russellmiller.iprep.shared.models.updateMastery
import com.russellmiller.iprep.shared.models.DuelPersistenceData
import com.russellmiller.iprep.shared.models.EnemyDefinitions
import kotlin.random.Random
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNotNull
import kotlin.test.assertNotSame
import kotlin.test.assertTrue

class DuelEngineServiceTest {
    private fun sampleQuestionsJson(count: Int = 12): String {
        val items = (1..count).joinToString(separator = ",") { i ->
            """{"id":"q$i","topic":"Topic $i","statement":"S$i","answer":true,"explanation":"E$i","source":"src","hint":"H$i"}"""
        }
        return "[$items]"
    }

    private fun sampleEnemy(): Enemy = Enemy(
        id = "test-enemy",
        name = "Test",
        title = "Dummy",
        description = "Test enemy",
        iconName = "bolt.fill",
        themeColor = "#000000",
        maxHP = 100,
        topicBiases = listOf("Topic"),
        unlockType = UnlockType.NONE
    )

    private fun definedEnemy(id: String = "airway-assassin"): Enemy =
        requireNotNull(EnemyDefinitions.enemy(id)) { "Missing enemy definition: $id" }

    @Test
    fun streakMultiplierUsesNewStreak() {
        val qb = DuelQuestionBankService(Random(1)).apply { loadQuestions(sampleQuestionsJson(count = 5)) }
        val engine = DuelEngineService(qb, Random(2))
        engine.setPlayerContext(recentSeen = emptyList(), recentMissed = emptyList(), weakTopics = emptyList())
        engine.startDuel(definedEnemy())
        engine.proceedToQuestion()

        // 1st correct -> streak 1 -> 1.0
        val r1 = engine.submitAnswer(true)
        assertNotNull(r1)
        assertEquals(1.0f, r1.streakMultiplier)
        engine.showFeedback()
        engine.proceedToNextQuestion()

        // 2nd correct -> streak 2 -> 1.0
        val r2 = engine.submitAnswer(true)
        assertNotNull(r2)
        assertEquals(1.0f, r2.streakMultiplier)
        engine.showFeedback()
        engine.proceedToNextQuestion()

        // 3rd correct -> streak 3 -> 1.25
        val r3 = engine.submitAnswer(true)
        assertNotNull(r3)
        assertEquals(1.25f, r3.streakMultiplier)
    }

    @Test
    fun critChanceDeterministicWithSeededRng() {
        val qb1 = DuelQuestionBankService(Random(42)).apply { loadQuestions(sampleQuestionsJson(count = 3)) }
        val qb2 = DuelQuestionBankService(Random(42)).apply { loadQuestions(sampleQuestionsJson(count = 3)) }

        val engine1 = DuelEngineService(qb1, Random(123))
        val engine2 = DuelEngineService(qb2, Random(123))

        engine1.setPlayerContext(emptyList(), emptyList(), emptyList())
        engine2.setPlayerContext(emptyList(), emptyList(), emptyList())

        engine1.startDuel(definedEnemy()); engine1.proceedToQuestion()
        engine2.startDuel(definedEnemy()); engine2.proceedToQuestion()

        val r1 = engine1.submitAnswer(true)
        val r2 = engine2.submitAnswer(true)
        assertNotNull(r1)
        assertNotNull(r2)
        assertEquals(r1.wasCrit, r2.wasCrit)
    }

    @Test
    fun lifelineOneUseEnforced() {
        val qb = DuelQuestionBankService(Random(1)).apply { loadQuestions(sampleQuestionsJson(count = 1)) }
        val engine = DuelEngineService(qb, Random(2))
        engine.setPlayerContext(emptyList(), emptyList(), emptyList())
        engine.startDuel(definedEnemy())
        engine.proceedToQuestion()

        assertTrue(engine.useShield())
        assertFalse(engine.useShield())
        assertTrue(engine.useDoubleTap())
        assertFalse(engine.useDoubleTap())
    }

    @Test
    fun lifelineActiveClearedAfterAnswer() {
        val qb = DuelQuestionBankService(Random(1)).apply { loadQuestions(sampleQuestionsJson(count = 1)) }
        val engine = DuelEngineService(qb, Random(2))
        engine.setPlayerContext(emptyList(), emptyList(), emptyList())
        engine.startDuel(definedEnemy())
        engine.proceedToQuestion()

        assertTrue(engine.useShield())
        val before = engine.currentDuel.value
        assertNotNull(before)
        assertTrue(before.lifelines.shieldUsed)
        assertTrue(before.lifelines.shieldActive)

        // Force wrong answer to consume shield
        val result = engine.submitAnswer(false)
        assertNotNull(result)

        val after = engine.currentDuel.value
        assertNotNull(after)
        assertTrue(after.lifelines.shieldUsed)
        assertFalse(after.lifelines.shieldActive)
    }

    @Test
    fun shieldReducesDamageByHalf() {
        val qb = DuelQuestionBankService(Random(1)).apply { loadQuestions(sampleQuestionsJson(count = 1)) }
        val engine = DuelEngineService(qb, Random(2))
        engine.setPlayerContext(emptyList(), emptyList(), emptyList())
        engine.startDuel(definedEnemy())
        engine.proceedToQuestion()

        assertTrue(engine.useShield())
        val result = engine.submitAnswer(false)
        assertNotNull(result)
        assertEquals(6, result.damageTaken)
    }

    @Test
    fun doubleTapBoostsDamage() {
        val qb = DuelQuestionBankService(Random(1)).apply { loadQuestions(sampleQuestionsJson(count = 1)) }
        val engine = DuelEngineService(qb, Random(2))
        engine.setPlayerContext(emptyList(), emptyList(), emptyList())
        engine.startDuel(definedEnemy())
        engine.proceedToQuestion()

        assertTrue(engine.useDoubleTap())
        val result = engine.submitAnswer(true)
        assertNotNull(result)
        assertTrue(result.damageDealt >= 18) // 12 * 1.5, possibly higher with crit
    }

    @Test
    fun questionHardBanNoRepeatsInSingleDuel() {
        val qb = DuelQuestionBankService(Random(99)).apply { loadQuestions(sampleQuestionsJson(count = 5)) }
        val engine = DuelEngineService(qb, Random(1))
        engine.setPlayerContext(emptyList(), emptyList(), emptyList())
        engine.startDuel(definedEnemy())
        engine.proceedToQuestion()

        val asked = mutableSetOf<String>()
        repeat(3) {
            val stateBefore = engine.currentDuel.value
            assertNotNull(stateBefore)
            val q = stateBefore.currentQuestion
            assertNotNull(q)
            assertFalse(asked.contains(q.id))
            asked.add(q.id)

            engine.submitAnswer(true)
            engine.showFeedback()
            engine.proceedToNextQuestion()
        }
    }

    @Test
    fun questionSoftBanAvoidsRecentWhenPoolLargeEnough() {
        val qb = DuelQuestionBankService(Random(1)).apply { loadQuestions(sampleQuestionsJson(count = 10)) }
        val enemy = sampleEnemy()
        val recentlySeen = listOf("q1", "q2", "q3", "q4", "q5")
        val picked = qb.selectQuestion(
            enemy = enemy,
            alreadySeen = emptyList(),
            recentlySeen = recentlySeen,
            recentlyMissed = emptyList(),
            weakTopics = emptyList()
        )
        assertNotNull(picked)
        assertFalse(picked.id in recentlySeen)
    }

    @Test
    fun levelCurveMatchesSpec() {
        assertEquals(275L, PlayerProfile.xpForLevel(2))
        assertEquals(350L, PlayerProfile.xpForLevel(3))
        assertEquals(500L, PlayerProfile.xpForLevel(5))
        assertEquals(875L, PlayerProfile.xpForLevel(10))
        assertEquals(1, PlayerProfile.levelForXP(0))
        assertEquals(1, PlayerProfile.levelForXP(200))
        assertEquals(2, PlayerProfile.levelForXP(275))
    }

    @Test
    fun enemyUnlockLogicWorks() {
        val base = PlayerProfile(id = "p")
        val pleural = EnemyDefinitions.enemy("pleural-phantom")
        assertNotNull(pleural)
        assertFalse(pleural.isUnlocked(base))
        assertNotNull(pleural.lockReason(base))

        val leveled = base.copy(duelsWon = 2)
        assertTrue(pleural.isUnlocked(leveled))
        assertEquals(null, pleural.lockReason(leveled))
    }

    @Test
    fun startDuelInitializesEnemyHpFromMaxHp() {
        val qb = DuelQuestionBankService(Random(1)).apply { loadQuestions(sampleQuestionsJson(count = 1)) }
        val engine = DuelEngineService(qb, Random(1))
        val enemy = sampleEnemy().let {
            Enemy(
                id = it.id,
                name = it.name,
                title = it.title,
                description = it.description,
                iconName = it.iconName,
                themeColor = it.themeColor,
                maxHP = 77,
                topicBiases = it.topicBiases,
                unlockType = UnlockType.NONE
            )
        }
        val state = engine.startDuel(enemy)
        assertEquals(77, state.enemyMaxHP)
        assertEquals(77, state.enemyHP)
    }

    @Test
    fun masteryUpdateRuleAppliesAndClamps() {
        val profile = PlayerProfile(id = "p")
        val p1 = updateMastery(profile, topic = "Airway", isCorrect = true)
        assertEquals(0.54f, p1.topicMastery["Airway"] ?: 0f, 0.0001f)

        val p2 = updateMastery(p1, topic = "Airway", isCorrect = false)
        assertEquals(0.52f, p2.topicMastery["Airway"] ?: 0f, 0.0001f)

        val high = profile.copy(topicMastery = mapOf("X" to 0.99f))
        val high2 = updateMastery(high, topic = "X", isCorrect = true)
        assertEquals(1.0f, high2.topicMastery["X"] ?: 0f, 0.0001f)
    }

    @Test
    fun persistenceRoundTrip() {
        val data = DuelPersistenceData(
            playerProfile = PlayerProfile(id = "p", xp = 123, level = 2),
            recentDuels = emptyList(),
            recentlySeenQuestionIds = listOf("q1", "q2"),
            recentlyMissedQuestionIds = listOf("q3")
        )
        val encoded = DuelPersistenceData.encode(data)
        val decoded = DuelPersistenceData.decode(encoded)
        assertEquals(data, decoded)
        assertNotSame(data, decoded)
    }
}
