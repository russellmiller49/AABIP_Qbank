package com.russellmiller.iprep.ui.screens

import androidx.compose.animation.core.Animatable
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.Spring
import androidx.compose.animation.core.animateDpAsState
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.spring
import androidx.compose.animation.core.tween
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.russellmiller.iprep.duel.DuelStore
import com.russellmiller.iprep.shared.AppEnvironment
import com.russellmiller.iprep.shared.models.DuelPhase
import com.russellmiller.iprep.shared.models.Enemy
import com.russellmiller.iprep.shared.models.EnemyDefinitions
import com.russellmiller.iprep.shared.models.PlayerProfile
import com.russellmiller.iprep.shared.models.updateMastery
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlin.math.max
import kotlin.math.sin

sealed class BattleEvent {
    data object PlayerAttack : BattleEvent()
    data object EnemyAttack : BattleEvent()
    data class EnemyHit(val damage: Int, val isCrit: Boolean) : BattleEvent()
    data class PlayerHit(val damage: Int) : BattleEvent()
    data object None : BattleEvent()
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DuelScreen(
    enemyId: String,
    duelStore: DuelStore,
    appEnvironment: AppEnvironment,
    onNavigateBack: () -> Unit
) {
    val engine = appEnvironment.duelEngineService
    val duelState by engine.currentDuel.collectAsState(initial = null)

    var isResolving by remember { mutableStateOf(false) }
    var battleEvent by remember { mutableStateOf<BattleEvent>(BattleEvent.None) }
    var recordedDuelId by remember { mutableStateOf<String?>(null) }
    val scope = rememberCoroutineScope()

    LaunchedEffect(enemyId) {
        val enemy = EnemyDefinitions.enemy(enemyId) ?: return@LaunchedEffect
        engine.setPlayerContext(
            recentSeen = duelStore.data.recentlySeenQuestionIds,
            recentMissed = duelStore.data.recentlyMissedQuestionIds,
            weakTopics = duelStore.weakTopics()
        )
        recordedDuelId = null
        engine.startDuel(enemy)
    }

    DisposableEffect(enemyId) {
        onDispose {
            engine.endDuel()
        }
    }

    // Persist duel completion once.
    LaunchedEffect(duelState?.phase) {
        val duel = duelState ?: return@LaunchedEffect
        if (duel.phase != DuelPhase.END) return@LaunchedEffect
        val completed = engine.getCompletedDuel() ?: return@LaunchedEffect
        if (recordedDuelId == completed.id) return@LaunchedEffect
        recordedDuelId = completed.id

        val base = duelStore.data.playerProfile
        val updated = applyCompletedDuelToProfile(base, completed.enemyId, completed.won, completed.xpEarned, completed.maxStreak)
        duelStore.updateProfile(updated)
        duelStore.addCompletedDuel(completed)
        duelStore.updateRecentQuestionIds(engine.recentlySeenQuestionIds(), engine.recentlyMissedQuestionIds())
    }

    LaunchedEffect(duelState?.lastAnswer) {
        val duel = duelState ?: run {
            battleEvent = BattleEvent.None
            return@LaunchedEffect
        }

        val result = duel.lastAnswer ?: run {
            battleEvent = BattleEvent.None
            return@LaunchedEffect
        }

        if (result.questionId != duel.currentQuestion?.id) return@LaunchedEffect

        if (result.isCorrect) {
            battleEvent = BattleEvent.PlayerAttack
            delay(400)
            battleEvent = BattleEvent.EnemyHit(damage = result.damageDealt, isCrit = result.wasCrit)
        } else {
            battleEvent = BattleEvent.EnemyAttack
            delay(400)
            battleEvent = BattleEvent.PlayerHit(damage = result.damageTaken)
        }

        delay(1000)
        battleEvent = BattleEvent.None
    }

    val enemy = duelState?.enemy ?: EnemyDefinitions.enemy(enemyId)

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(enemy?.displayName ?: "Clinical Duel") },
                navigationIcon = {
                    TextButton(onClick = onNavigateBack) { Text("Back") }
                }
            )
        }
    ) { padding ->
        val duel = duelState
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            if (duel != null && enemy != null) {
                DuelArena(duel = duel, enemy = enemy, battleEvent = battleEvent)
            }

            val contentModifier = Modifier
                .fillMaxWidth()
                .weight(1f)
                .padding(16.dp)

            when (duel?.phase) {
                null -> {
                    Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                        CircularProgressIndicator()
                    }
                }

                DuelPhase.INTRO -> {
                    IntroPanel(
                        modifier = contentModifier,
                        enemyName = enemy?.displayName ?: enemyId,
                        enemyDescription = enemy?.description ?: "",
                        onStart = { engine.proceedToQuestion() }
                    )
                }

                DuelPhase.QUESTION -> {
                    QuestionPanel(
                        modifier = contentModifier,
                        duel = duel,
                        isResolving = isResolving,
                        onHint = { engine.useHint() },
                        onShield = { engine.useShield() },
                        onDoubleTap = { engine.useDoubleTap() },
                        onAnswer = { answer ->
                            val current = duelState ?: return@QuestionPanel
                            val q = current.currentQuestion ?: return@QuestionPanel
                            val topic = q.topic

                            val priorStreak = current.currentStreak
                            val newStreak = if (answer == q.answer) priorStreak + 1 else 0

                            val result = engine.submitAnswer(answer) ?: return@QuestionPanel
                            val updatedProfile = applyAnswerToProfile(duelStore.data.playerProfile, topic, result.isCorrect, newStreak)
                            duelStore.updateProfile(updatedProfile)
                            duelStore.updateRecentQuestionIds(engine.recentlySeenQuestionIds(), engine.recentlyMissedQuestionIds())

                            isResolving = true
                            scope.launch {
                                delay(1500)
                                engine.showFeedback()
                                isResolving = false
                            }
                        }
                    )
                }

                DuelPhase.FEEDBACK -> {
                    FeedbackPanel(
                        modifier = contentModifier,
                        duel = duel,
                        onNext = { engine.proceedToNextQuestion() }
                    )
                }

                DuelPhase.END -> {
                    EndPanel(
                        modifier = contentModifier,
                        duel = duel,
                        onDone = {
                            engine.endDuel()
                            onNavigateBack()
                        }
                    )
                }
            }
        }
    }
}

private fun applyAnswerToProfile(profile: PlayerProfile, topic: String, isCorrect: Boolean, newStreak: Int): PlayerProfile {
    val mastered = updateMastery(profile, topic, isCorrect)
    val answered = mastered.totalAnswered + 1
    val correct = mastered.totalCorrect + if (isCorrect) 1 else 0
    val longest = max(mastered.longestStreak, newStreak)
    return mastered.copy(
        totalAnswered = answered,
        totalCorrect = correct,
        longestStreak = longest
    )
}

private fun applyCompletedDuelToProfile(
    profile: PlayerProfile,
    enemyId: String,
    won: Boolean,
    xpEarned: Long,
    maxStreak: Int
): PlayerProfile {
    val newXP = profile.xp + xpEarned
    val newLevel = PlayerProfile.levelForXP(newXP)
    val duelsWon = profile.duelsWon + if (won) 1 else 0
    val duelsLost = profile.duelsLost + if (won) 0 else 1
    val defeated = if (won) profile.defeatedEnemies + enemyId else profile.defeatedEnemies
    val longest = max(profile.longestStreak, maxStreak)
    return profile.copy(
        xp = newXP,
        level = newLevel,
        duelsWon = duelsWon,
        duelsLost = duelsLost,
        defeatedEnemies = defeated,
        longestStreak = longest
    )
}

@Composable
private fun IntroPanel(
    modifier: Modifier,
    enemyName: String,
    enemyDescription: String,
    onStart: () -> Unit
) {
    Column(
        modifier = modifier,
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        Text(enemyName, style = MaterialTheme.typography.headlineMedium, fontWeight = FontWeight.Bold)
        if (enemyDescription.isNotEmpty()) {
            Text(enemyDescription, style = MaterialTheme.typography.bodyMedium, color = MaterialTheme.colorScheme.onSurfaceVariant)
        }
        Spacer(modifier = Modifier.weight(1f))
        Button(onClick = onStart, modifier = Modifier.fillMaxWidth()) {
            Text("Begin Duel")
        }
    }
}

@Composable
private fun QuestionPanel(
    modifier: Modifier,
    duel: com.russellmiller.iprep.shared.models.DuelState?,
    isResolving: Boolean,
    onHint: () -> Unit,
    onShield: () -> Unit,
    onDoubleTap: () -> Unit,
    onAnswer: (Boolean) -> Unit
) {
    val q = duel?.currentQuestion
    if (duel == null || q == null) {
        Box(modifier = modifier, contentAlignment = Alignment.Center) {
            Text("No questions available")
        }
        return
    }

    Column(modifier = modifier, verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
            Text("Streak: ${duel.currentStreak}", style = MaterialTheme.typography.labelLarge)
            Text("XP: ${duel.xpEarned}", style = MaterialTheme.typography.labelLarge)
        }

        Card(modifier = Modifier.fillMaxWidth()) {
            Column(modifier = Modifier.padding(16.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text(q.topic, style = MaterialTheme.typography.labelMedium, color = MaterialTheme.colorScheme.onSurfaceVariant)
                Text(q.statement, style = MaterialTheme.typography.titleLarge)
                if (duel.showingHint) {
                    Text(q.hint, style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
                }
            }
        }

        Row(horizontalArrangement = Arrangement.spacedBy(10.dp), modifier = Modifier.fillMaxWidth()) {
            OutlinedButton(
                onClick = onHint,
                enabled = !duel.lifelines.hintUsed,
                modifier = Modifier.weight(1f)
            ) { Text("Hint") }

            OutlinedButton(
                onClick = onShield,
                enabled = !duel.lifelines.shieldUsed,
                modifier = Modifier.weight(1f)
            ) { Text(if (duel.lifelines.shieldActive) "Shield (Armed)" else "Shield") }

            OutlinedButton(
                onClick = onDoubleTap,
                enabled = !duel.lifelines.doubleTapUsed,
                modifier = Modifier.weight(1f)
            ) { Text(if (duel.lifelines.doubleTapActive) "Double (Armed)" else "Double") }
        }

        Row(horizontalArrangement = Arrangement.spacedBy(12.dp), modifier = Modifier.fillMaxWidth()) {
            Button(
                onClick = { onAnswer(true) },
                enabled = !isResolving,
                modifier = Modifier.weight(1f)
            ) { Text("TRUE") }
            Button(
                onClick = { onAnswer(false) },
                enabled = !isResolving,
                modifier = Modifier.weight(1f)
            ) { Text("FALSE") }
        }

        if (isResolving) {
            LinearProgressIndicator(modifier = Modifier.fillMaxWidth())
        }
    }
}

@Composable
private fun FeedbackPanel(
    modifier: Modifier,
    duel: com.russellmiller.iprep.shared.models.DuelState?,
    onNext: () -> Unit
) {
    val q = duel?.currentQuestion
    val last = duel?.lastAnswer
    if (duel == null || q == null || last == null) {
        Box(modifier = modifier, contentAlignment = Alignment.Center) {
            Text("Loading…")
        }
        return
    }

    Column(modifier = modifier, verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Text(if (last.isCorrect) "Correct" else "Incorrect", style = MaterialTheme.typography.headlineSmall, fontWeight = FontWeight.Bold)
        Text(q.explanation, style = MaterialTheme.typography.bodyMedium)
        Spacer(modifier = Modifier.weight(1f))
        Button(onClick = onNext, modifier = Modifier.fillMaxWidth()) {
            Text("Next Question")
        }
    }
}

@Composable
private fun EndPanel(
    modifier: Modifier,
    duel: com.russellmiller.iprep.shared.models.DuelState?,
    onDone: () -> Unit
) {
    if (duel == null) {
        Box(modifier = modifier, contentAlignment = Alignment.Center) {
            Text("Duel complete")
        }
        return
    }

    Column(modifier = modifier, verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Text(
            if (duel.isPlayerVictory) "Victory!" else "Defeat",
            style = MaterialTheme.typography.headlineMedium,
            fontWeight = FontWeight.Bold
        )
        Text("XP Earned: ${duel.xpEarned}", style = MaterialTheme.typography.bodyMedium)
        Text("Correct: ${duel.correctCount} • Incorrect: ${duel.incorrectCount}", style = MaterialTheme.typography.bodyMedium)
        Text("Max Streak: ${duel.maxStreak}", style = MaterialTheme.typography.bodyMedium)
        Spacer(modifier = Modifier.weight(1f))
        Button(onClick = onDone, modifier = Modifier.fillMaxWidth()) {
            Text("Done")
        }
    }
}

@Composable
private fun DuelArena(
    duel: com.russellmiller.iprep.shared.models.DuelState,
    enemy: Enemy,
    battleEvent: BattleEvent
) {
    val infiniteTransition = rememberInfiniteTransition(label = "idle")
    val bobOffset by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 10f,
        animationSpec = infiniteRepeatable(
            animation = tween(600, easing = LinearEasing),
            repeatMode = RepeatMode.Reverse
        ),
        label = "bob"
    )

    val attackOffset by animateDpAsState(
        targetValue = if (battleEvent is BattleEvent.PlayerAttack || battleEvent is BattleEvent.EnemyAttack) 60.dp else 0.dp,
        animationSpec = spring(dampingRatio = Spring.DampingRatioMediumBouncy, stiffness = Spring.StiffnessLow),
        label = "attack"
    )

    val shakePhase = remember { Animatable(0f) }
    var shakeAmount by remember { mutableStateOf(0f) }
    LaunchedEffect(battleEvent) {
        if (battleEvent is BattleEvent.EnemyHit || battleEvent is BattleEvent.PlayerHit) {
            shakeAmount = 15f
            shakePhase.snapTo(0f)
            shakePhase.animateTo(1f, animationSpec = tween(400, easing = LinearEasing))
        }
    }
    val shakeX = (sin(shakePhase.value.toDouble() * Math.PI * 4.0) * shakeAmount).toFloat()

    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(300.dp)
            .graphicsLayer { translationX = shakeX }
    ) {
        RetroDojoBackground()

        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.Top
        ) {
            RetroHealthBar(
                current = duel.playerHP,
                max = 100,
                label = "YOU"
            )

            RetroHealthBar(
                current = duel.enemyHP,
                max = duel.enemyMaxHP,
                label = enemy.name.take(8)
            )
        }

        Box(
            modifier = Modifier
                .align(Alignment.CenterEnd)
                .padding(end = 40.dp, bottom = 40.dp)
                .offset(
                    x = if (battleEvent is BattleEvent.EnemyAttack) -attackOffset else 0.dp,
                    y = (-bobOffset).dp
                )
        ) {
            RetroVirus(
                modifier = Modifier.size(140.dp),
                isHit = battleEvent is BattleEvent.EnemyHit,
                primaryColor = try {
                    Color(android.graphics.Color.parseColor(enemy.themeColor))
                } catch (e: Exception) {
                    RetroColors.VirusGreen
                }
            )
        }

        Box(
            modifier = Modifier
                .align(Alignment.BottomStart)
                .padding(start = 40.dp, bottom = 20.dp)
                .offset(
                    x = if (battleEvent is BattleEvent.PlayerAttack) attackOffset else 0.dp,
                    y = bobOffset.dp
                )
        ) {
            RetroMedic(
                modifier = Modifier.size(160.dp),
                isHit = battleEvent is BattleEvent.PlayerHit
            )
        }

        if (battleEvent is BattleEvent.EnemyHit) {
            Text(
                text = "-${battleEvent.damage}",
                fontSize = 32.sp,
                fontWeight = FontWeight.Black,
                fontFamily = FontFamily.Monospace,
                color = if (battleEvent.isCrit) Color.Yellow else Color.White,
                modifier = Modifier
                    .align(Alignment.CenterEnd)
                    .padding(end = 80.dp, bottom = 100.dp)
            )
        }

        if (battleEvent is BattleEvent.PlayerHit) {
            Text(
                text = "-${battleEvent.damage}",
                fontSize = 32.sp,
                fontWeight = FontWeight.Black,
                fontFamily = FontFamily.Monospace,
                color = RetroColors.HPRed,
                modifier = Modifier
                    .align(Alignment.BottomStart)
                    .padding(start = 80.dp, bottom = 120.dp)
            )
        }
    }
}
