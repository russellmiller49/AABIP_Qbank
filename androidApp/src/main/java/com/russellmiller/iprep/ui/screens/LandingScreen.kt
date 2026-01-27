package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.Category
import androidx.compose.material.icons.outlined.Insights
import androidx.compose.material.icons.outlined.Leaderboard
import androidx.compose.material.icons.outlined.Replay
import androidx.compose.material.icons.outlined.Search
import androidx.compose.material.icons.outlined.Settings
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.SnackbarHost
import androidx.compose.material3.SnackbarHostState
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.StrokeCap
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.russellmiller.iprep.shared.models.Module
import com.russellmiller.iprep.shared.models.StudyProgress
import com.russellmiller.iprep.ui.IprepAppViewModel
import com.russellmiller.iprep.ui.theme.AtlanticBlue
import com.russellmiller.iprep.ui.theme.CoralAccent
import com.russellmiller.iprep.ui.theme.DeepOcean
import com.russellmiller.iprep.ui.theme.HorizonTeal
import com.russellmiller.iprep.ui.theme.MistBlue
import kotlinx.coroutines.launch
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import kotlin.math.roundToInt

@OptIn(ExperimentalMaterial3Api::class, ExperimentalLayoutApi::class)
@Composable
fun LandingScreen(
    appViewModel: IprepAppViewModel,
    onNavigateToQuiz: () -> Unit,
    onNavigateToDashboard: () -> Unit,
    onNavigateToAnalytics: () -> Unit,
    onNavigateToLeaderboard: () -> Unit,
    onNavigateToReview: () -> Unit,
    onNavigateToExplorer: () -> Unit,
    onNavigateToSettings: () -> Unit
) {
    val snackbarHostState = remember { SnackbarHostState() }
    val coroutineScope = rememberCoroutineScope()

    val currentSession by appViewModel.currentSession.collectAsState()
    val completedSessions by appViewModel.completedSessions.collectAsState()
    val moduleProgress by appViewModel.moduleProgress.collectAsState()
    val studyStates by appViewModel.questionStudyStates.collectAsState()

    val modules = appViewModel.moduleSummaries
    val overallProgress = remember(studyStates) { appViewModel.getOverallProgress() }
    val lastSession = remember(completedSessions) { completedSessions.maxByOrNull { it.completedAt } }

    var showModuleSheet by remember { mutableStateOf(false) }

    val hasActiveSession = currentSession?.let { !it.isCompleted && it.questions.isNotEmpty() } == true
    val accuracyPercent = (overallProgress.accuracy * 100).roundToInt()
    val answeredPercent = (overallProgress.completionPercentage * 100).roundToInt()

    val dateFormatter = remember { SimpleDateFormat("MMM d, yyyy", Locale.getDefault()) }

    fun showMessage(message: String) {
        coroutineScope.launch {
            snackbarHostState.showSnackbar(message)
        }
    }

    fun startQuickStart() {
        val session = appViewModel.startQuickStart()
        if (session != null) {
            onNavigateToQuiz()
        } else {
            showMessage("You're all caught up! Reset progress in Settings to practice again.")
        }
    }

    fun resumeSession() {
        if (hasActiveSession) {
            onNavigateToQuiz()
        } else {
            showMessage("No active session to resume yet.")
        }
    }

    fun startModule(module: Module) {
        val session = appViewModel.startModule(module)
        if (session != null) {
            onNavigateToQuiz()
        } else {
            showMessage("All questions in ${module.title} are complete. Reset progress to study it again.")
        }
    }

    fun startIncorrect() {
        val session = appViewModel.startIncorrectOnly()
        if (session != null) {
            onNavigateToQuiz()
        } else {
            showMessage("No incorrect answers yet. Complete a quiz first.")
        }
    }

    Scaffold(
        containerColor = Color.Transparent,
        snackbarHost = { SnackbarHost(hostState = snackbarHostState) }
    ) { paddingValues ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            LandingBackground()
            LazyColumn(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(horizontal = 24.dp, vertical = 24.dp),
                verticalArrangement = Arrangement.spacedBy(24.dp),
                contentPadding = PaddingValues(bottom = 48.dp)
            ) {
                item {
                    LandingHeroCard(
                        totalAnswered = overallProgress.answeredQuestions,
                        totalQuestions = overallProgress.totalQuestions,
                        accuracyPercent = accuracyPercent,
                        answeredPercent = answeredPercent,
                        lastSessionScore = lastSession?.let { "${it.correctCount}/${it.totalQuestions}" } ?: "--",
                        lastSessionDate = lastSession?.let { dateFormatter.format(Date(it.completedAt)) },
                        canResume = hasActiveSession,
                        onStartPractice = { startQuickStart() },
                        onContinueSession = { resumeSession() },
                        onOpenDashboard = onNavigateToDashboard,
                        onOpenReview = onNavigateToReview
                    )
                }

                item {
                    QuickActionsGrid(
                        onStudyByCategory = { showModuleSheet = true },
                        onAdaptiveReview = { startIncorrect() },
                        onQuestionExplorer = onNavigateToExplorer,
                        onAnalytics = onNavigateToAnalytics,
                        onLeaderboard = onNavigateToLeaderboard,
                        onSettings = onNavigateToSettings
                    )
                }

                item {
                    Text(
                        text = "Study Modules",
                        style = MaterialTheme.typography.titleMedium.copy(color = Color.White)
                    )
                }

                item {
                    LazyRow(
                        horizontalArrangement = Arrangement.spacedBy(16.dp)
                    ) {
                        items(modules) { module ->
                            val progress = moduleProgress[module.id]
                                ?: appViewModel.getModuleProgress(module.id)
                            ModuleProgressCard(
                                module = module,
                                progress = progress,
                                onStart = { startModule(module) }
                            )
                        }
                    }
                }

                if (completedSessions.isNotEmpty()) {
                    item {
                        SessionHistoryPeek(
                            lastSession = lastSession,
                            onViewHistory = onNavigateToReview,
                            dateFormatter = dateFormatter
                        )
                    }
                }
            }
        }
    }

    if (showModuleSheet) {
        ModalBottomSheet(
            onDismissRequest = { showModuleSheet = false },
            containerColor = MaterialTheme.colorScheme.surface.copy(alpha = 0.98f),
            tonalElevation = 8.dp
        ) {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 24.dp, vertical = 16.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                Text(
                    text = "Study by Category",
                    style = MaterialTheme.typography.titleLarge,
                    color = MaterialTheme.colorScheme.onSurface
                )
                modules.forEach { module ->
                    val progress = moduleProgress[module.id]
                        ?: appViewModel.getModuleProgress(module.id)
                    ModuleSheetRow(
                        module = module,
                        progress = progress,
                        onStart = {
                            showModuleSheet = false
                            startModule(module)
                        }
                    )
                }
            }
        }
    }
}

@Composable
private fun LandingBackground(modifier: Modifier = Modifier) {
    Box(
        modifier = modifier
            .fillMaxSize()
            .background(
                brush = Brush.linearGradient(
                    colors = listOf(DeepOcean, AtlanticBlue)
                )
            )
    ) {
        Canvas(modifier = Modifier.fillMaxSize()) {
            val radius = size.minDimension * 0.6f
            drawCircle(
                brush = Brush.radialGradient(
                    colors = listOf(MistBlue.copy(alpha = 0.35f), Color.Transparent),
                    center = Offset(x = size.width * 0.15f, y = size.height * 0.15f),
                    radius = radius
                )
            )
            drawCircle(
                brush = Brush.radialGradient(
                    colors = listOf(HorizonTeal.copy(alpha = 0.25f), Color.Transparent),
                    center = Offset(x = size.width * 0.85f, y = size.height * 0.25f),
                    radius = radius * 0.8f
                )
            )
        }
    }
}

@Composable
private fun LandingHeroCard(
    totalAnswered: Int,
    totalQuestions: Int,
    accuracyPercent: Int,
    answeredPercent: Int,
    lastSessionScore: String,
    lastSessionDate: String?,
    canResume: Boolean,
    onStartPractice: () -> Unit,
    onContinueSession: () -> Unit,
    onOpenDashboard: () -> Unit,
    onOpenReview: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(28.dp),
        colors = CardDefaults.cardColors(
            containerColor = Color.White.copy(alpha = 0.08f)
        ),
        border = androidx.compose.foundation.BorderStroke(1.dp, Color.White.copy(alpha = 0.22f))
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 24.dp, vertical = 28.dp),
            verticalArrangement = Arrangement.spacedBy(20.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                Text(
                    text = "AABIP-IPREP",
                    style = MaterialTheme.typography.headlineMedium.copy(
                        fontWeight = FontWeight.Bold,
                        color = Color.White
                    )
                )
                Text(
                    text = "Interventional Pulmonary Exam Prep",
                    style = MaterialTheme.typography.bodyLarge.copy(color = Color.White.copy(alpha = 0.85f))
                )
            }

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                HeroMetric(title = "Answered", value = "$totalAnswered/$totalQuestions")
                HeroMetric(title = "Accuracy", value = "$accuracyPercent%")
                HeroMetric(title = "Completed", value = "$answeredPercent%")
            }

            Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                Button(
                    onClick = onStartPractice,
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(22.dp)
                ) {
                    Text("Start Practice Session")
                }
                OutlinedButton(
                    onClick = onContinueSession,
                    enabled = canResume,
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(22.dp)
                ) {
                    Text("Continue Last Session")
                }
            }

            Surface(
                modifier = Modifier
                    .fillMaxWidth()
                    .clickable(onClick = onOpenDashboard),
                color = Color.White.copy(alpha = 0.08f),
                shape = RoundedCornerShape(18.dp)
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 18.dp, vertical = 14.dp),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Column {
                        Text(
                            text = "Last session",
                            style = MaterialTheme.typography.labelMedium.copy(color = Color.White.copy(alpha = 0.7f))
                        )
                        Text(
                            text = if (lastSessionDate != null) "$lastSessionScore • $lastSessionDate" else "No sessions completed yet",
                            style = MaterialTheme.typography.bodyMedium.copy(color = Color.White)
                        )
                    }
                    TextButton(onClick = onOpenReview) {
                        Text("Review", color = CoralAccent)
                    }
                }
            }
        }
    }
}

@Composable
private fun HeroMetric(title: String, value: String) {
    Column(horizontalAlignment = Alignment.CenterHorizontally) {
        Text(
            text = value,
            style = MaterialTheme.typography.titleLarge.copy(
                color = Color.White,
                fontWeight = FontWeight.SemiBold
            )
        )
        Text(
            text = title,
            style = MaterialTheme.typography.labelMedium.copy(color = Color.White.copy(alpha = 0.7f))
        )
    }
}

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun QuickActionsGrid(
    onStudyByCategory: () -> Unit,
    onAdaptiveReview: () -> Unit,
    onQuestionExplorer: () -> Unit,
    onAnalytics: () -> Unit,
    onLeaderboard: () -> Unit,
    onSettings: () -> Unit
) {
    FlowRow(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.spacedBy(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        LandingQuickAction(
            label = "Study by Category",
            description = "Choose a focused module",
            icon = Icons.Outlined.Category,
            onClick = onStudyByCategory
        )
        LandingQuickAction(
            label = "Adaptive Review",
            description = "Retry missed questions",
            icon = Icons.Outlined.Replay,
            onClick = onAdaptiveReview
        )
        LandingQuickAction(
            label = "Question Explorer",
            description = "Search the full bank",
            icon = Icons.Outlined.Search,
            onClick = onQuestionExplorer
        )
        LandingQuickAction(
            label = "Analytics",
            description = "See performance trends",
            icon = Icons.Outlined.Insights,
            onClick = onAnalytics
        )
        LandingQuickAction(
            label = "Leaderboards",
            description = "Compare with peers",
            icon = Icons.Outlined.Leaderboard,
            onClick = onLeaderboard
        )
        LandingQuickAction(
            label = "Settings",
            description = "Reset and preferences",
            icon = Icons.Outlined.Settings,
            onClick = onSettings
        )
    }
}

@Composable
private fun LandingQuickAction(
    label: String,
    description: String,
    icon: ImageVector,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth(fraction = 0.5f)
            .clip(RoundedCornerShape(20.dp))
            .clickable(onClick = onClick),
        color = Color.White.copy(alpha = 0.12f)
    ) {
        Row(
            modifier = Modifier
                .padding(horizontal = 18.dp, vertical = 16.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Box(
                modifier = Modifier
                    .size(44.dp)
                    .clip(CircleShape)
                    .background(Color.White.copy(alpha = 0.18f)),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    imageVector = icon,
                    contentDescription = label,
                    tint = Color.White
                )
            }
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = label,
                    style = MaterialTheme.typography.titleSmall.copy(
                        color = Color.White,
                        fontWeight = FontWeight.SemiBold
                    ),
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Text(
                    text = description,
                    style = MaterialTheme.typography.bodySmall.copy(color = Color.White.copy(alpha = 0.7f))
                )
            }
        }
    }
}

@Composable
private fun ModuleProgressCard(
    module: Module,
    progress: StudyProgress?,
    onStart: () -> Unit
) {
    Card(
        modifier = Modifier
            .width(260.dp)
            .height(180.dp),
        shape = RoundedCornerShape(24.dp),
        colors = CardDefaults.cardColors(containerColor = Color.White.copy(alpha = 0.12f)),
        border = androidx.compose.foundation.BorderStroke(1.dp, Color.White.copy(alpha = 0.2f))
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(18.dp),
            verticalArrangement = Arrangement.SpaceBetween
        ) {
            Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                Text(
                    text = module.title,
                    style = MaterialTheme.typography.titleSmall.copy(color = Color.White, fontWeight = FontWeight.SemiBold),
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                Text(
                    text = module.description,
                    style = MaterialTheme.typography.bodySmall.copy(color = Color.White.copy(alpha = 0.7f)),
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
            }
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                LinearProgressIndicator(
                    progress = progress?.completionPercentage ?: 0f,
                    modifier = Modifier.fillMaxWidth(),
                    color = HorizonTeal,
                    trackColor = Color.White.copy(alpha = 0.2f),
                    strokeCap = StrokeCap.Round
                )
                Text(
                    text = "${progress?.answeredQuestions ?: 0}/${progress?.totalQuestions ?: module.questionCount} answered",
                    style = MaterialTheme.typography.labelMedium.copy(color = Color.White.copy(alpha = 0.75f))
                )
                Button(
                    onClick = onStart,
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(20.dp)
                ) {
                    Text("Study module")
                }
            }
        }
    }
}

@Composable
private fun ModuleSheetRow(
    module: Module,
    progress: StudyProgress?,
    onStart: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(18.dp))
            .clickable(onClick = onStart),
        color = MaterialTheme.colorScheme.surfaceVariant
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 18.dp, vertical = 16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Text(
                text = module.title,
                style = MaterialTheme.typography.titleMedium
            )
            Text(
                text = module.description,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis
            )
            LinearProgressIndicator(
                progress = progress?.completionPercentage ?: 0f,
                modifier = Modifier.fillMaxWidth(),
                color = HorizonTeal,
                trackColor = MaterialTheme.colorScheme.surface
            )
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text(
                    text = "${progress?.answeredQuestions ?: 0}/${progress?.totalQuestions ?: module.questionCount} answered",
                    style = MaterialTheme.typography.labelMedium
                )
                Text(
                    text = module.difficulty.value.replaceFirstChar { if (it.isLowerCase()) it.titlecase(Locale.getDefault()) else it.toString() },
                    style = MaterialTheme.typography.labelMedium,
                    color = MaterialTheme.colorScheme.primary
                )
            }
        }
    }
}

@Composable
private fun SessionHistoryPeek(
    lastSession: com.russellmiller.iprep.shared.models.CompletedQuizSession?,
    onViewHistory: () -> Unit,
    dateFormatter: SimpleDateFormat
) {
    if (lastSession == null) return

    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onViewHistory),
        color = Color.White.copy(alpha = 0.1f),
        shape = RoundedCornerShape(20.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 20.dp, vertical = 16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column {
                Text(
                    text = "Recent Session",
                    style = MaterialTheme.typography.titleSmall.copy(color = Color.White, fontWeight = FontWeight.SemiBold)
                )
                Text(
                    text = "${lastSession.correctCount}/${lastSession.totalQuestions} • ${"%.0f".format(lastSession.accuracy * 100)}% accuracy",
                    style = MaterialTheme.typography.bodySmall.copy(color = Color.White.copy(alpha = 0.75f))
                )
                Text(
                    text = dateFormatter.format(Date(lastSession.completedAt)),
                    style = MaterialTheme.typography.labelSmall.copy(color = Color.White.copy(alpha = 0.6f))
                )
            }
            Text(
                text = "View",
                style = MaterialTheme.typography.titleSmall.copy(color = CoralAccent, fontWeight = FontWeight.SemiBold)
            )
        }
    }
}
