package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Analytics
import androidx.compose.material.icons.filled.AutoStories
import androidx.compose.material.icons.filled.Category
import androidx.compose.material.icons.filled.Gavel
import androidx.compose.material.icons.filled.GridView
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material.icons.filled.RestartAlt
import androidx.compose.material.icons.filled.SportsEsports
import androidx.compose.material.icons.filled.TableChart
import androidx.compose.material.icons.filled.Timeline
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Divider
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.StrokeCap
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import com.russellmiller.iprep.R
import com.russellmiller.iprep.shared.AppEnvironment
import com.russellmiller.iprep.shared.models.Module
import com.russellmiller.iprep.ui.theme.LandingGradientBottom
import com.russellmiller.iprep.ui.theme.LandingGradientTop
import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.sin

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LandingScreen(
    onStartPractice: () -> Unit,
    onContinueSession: () -> Unit,
    onShowProgress: () -> Unit,
    onShowDashboard: () -> Unit,
    onSelectModule: (Module) -> Unit,
    onRetryIncorrect: () -> Unit,
    onShowQuestionExplorer: () -> Unit,
    onShowCrosswords: () -> Unit,
    onShowLeaderboard: () -> Unit,
    onShowDuel: () -> Unit
) {
    val appEnvironment = remember { AppEnvironment.shared }
    val modules = remember { appEnvironment.questionBankService.moduleSummaries() }
    val currentSession by appEnvironment.quizSessionService.currentSession.collectAsState(initial = null)
    val studyStates by appEnvironment.studyPlannerService.questionStudyStates.collectAsState(initial = emptyMap())

    val retryCount = studyStates.values.count { it.needsReview }
    var showModulePicker by rememberSaveable { mutableStateOf(false) }
    var showNoIncorrectAlert by rememberSaveable { mutableStateOf(false) }

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(
                brush = Brush.verticalGradient(
                    colors = listOf(LandingGradientTop, LandingGradientBottom)
                )
            )
    ) {
        HexagonPattern(
            modifier = Modifier.fillMaxSize(),
            lineColor = Color.White.copy(alpha = 0.28f)
        )

        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            contentPadding = PaddingValues(horizontal = 20.dp, vertical = 28.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(18.dp)
        ) {
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(30.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = Color.White.copy(alpha = 0.14f)
                    )
                ) {
                    Column(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 18.dp, vertical = 20.dp),
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.spacedBy(16.dp)
                    ) {
                        Text(
                            text = "AABIP-IPREP",
                            style = MaterialTheme.typography.displaySmall,
                            color = Color.White,
                            textAlign = TextAlign.Center
                        )
                        Text(
                            text = "Interventional Pulmonary Exam Prep",
                            style = MaterialTheme.typography.titleMedium,
                            color = Color.White.copy(alpha = 0.94f),
                            textAlign = TextAlign.Center
                        )

                        Image(
                            painter = painterResource(id = R.drawable.aabip_logo),
                            contentDescription = "AABIP logo",
                            contentScale = ContentScale.Crop,
                            modifier = Modifier
                                .size(180.dp)
                                .clip(CircleShape)
                                .border(1.2.dp, Color.White.copy(alpha = 0.5f), CircleShape)
                        )

                        LandingActionButton(
                            text = "Start Practice",
                            icon = {
                                Icon(
                                    imageVector = Icons.Default.PlayArrow,
                                    contentDescription = null
                                )
                            },
                            primary = true,
                            onClick = onStartPractice
                        )

                        LandingActionButton(
                            text = "Continue Last Session",
                            icon = {
                                Icon(
                                    imageVector = Icons.Default.RestartAlt,
                                    contentDescription = null
                                )
                            },
                            enabled = currentSession != null,
                            onClick = onContinueSession
                        )

                        LandingActionButton(
                            text = "Dashboard",
                            icon = {
                                Icon(
                                    imageVector = Icons.Default.GridView,
                                    contentDescription = null
                                )
                            },
                            onClick = onShowDashboard
                        )

                        LandingActionButton(
                            text = "Study by Category",
                            icon = {
                                Icon(
                                    imageVector = Icons.Default.Category,
                                    contentDescription = null
                                )
                            },
                            onClick = { showModulePicker = true }
                        )

                        LandingActionButton(
                            text = "Question Explorer",
                            icon = {
                                Icon(
                                    imageVector = Icons.Default.AutoStories,
                                    contentDescription = null
                                )
                            },
                            onClick = onShowQuestionExplorer
                        )

                        LandingActionButton(
                            text = "Crossword Puzzles",
                            icon = {
                                Icon(
                                    imageVector = Icons.Default.TableChart,
                                    contentDescription = null
                                )
                            },
                            onClick = onShowCrosswords
                        )

                        LandingActionButton(
                            text = "Leaderboards",
                            icon = {
                                Icon(
                                    imageVector = Icons.Default.Timeline,
                                    contentDescription = null
                                )
                            },
                            onClick = onShowLeaderboard
                        )

                        LandingActionButton(
                            text = "Clinical Duel",
                            icon = {
                                Icon(
                                    imageVector = Icons.Default.SportsEsports,
                                    contentDescription = null
                                )
                            },
                            onClick = onShowDuel
                        )

                        LandingActionButton(
                            text = "Retry Incorrect Questions",
                            icon = {
                                Icon(
                                    imageVector = Icons.Default.Gavel,
                                    contentDescription = null
                                )
                            },
                            enabled = retryCount > 0,
                            onClick = {
                                if (retryCount > 0) {
                                    onRetryIncorrect()
                                } else {
                                    showNoIncorrectAlert = true
                                }
                            }
                        )

                        LandingActionButton(
                            text = "My Progress",
                            icon = {
                                Icon(
                                    imageVector = Icons.Default.Analytics,
                                    contentDescription = null
                                )
                            },
                            onClick = onShowProgress
                        )

                        Divider(color = Color.White.copy(alpha = 0.22f))

                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text(
                                text = "${modules.size} modules",
                                style = MaterialTheme.typography.labelLarge,
                                color = Color.White.copy(alpha = 0.94f)
                            )
                            Text(
                                text = "${appEnvironment.questionBankService.totalQuestionCount} questions",
                                style = MaterialTheme.typography.labelLarge,
                                color = Color.White.copy(alpha = 0.94f)
                            )
                        }
                    }
                }
            }
        }
    }

    if (showModulePicker) {
        ModalBottomSheet(
            onDismissRequest = { showModulePicker = false },
            containerColor = MaterialTheme.colorScheme.surface,
            contentColor = MaterialTheme.colorScheme.onSurface
        ) {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 20.dp)
                    .padding(bottom = 20.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                Text(
                    text = "Choose Category",
                    style = MaterialTheme.typography.titleLarge
                )
                LazyColumn(
                    modifier = Modifier.height(360.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(modules, key = { it.id }) { module ->
                        Card(
                            onClick = {
                                showModulePicker = false
                                onSelectModule(module)
                            },
                            colors = CardDefaults.cardColors(
                                containerColor = MaterialTheme.colorScheme.surfaceVariant
                            )
                        ) {
                            Column(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(14.dp),
                                verticalArrangement = Arrangement.spacedBy(6.dp)
                            ) {
                                Text(
                                    text = module.title,
                                    style = MaterialTheme.typography.titleMedium,
                                    color = MaterialTheme.colorScheme.onSurface
                                )
                                Text(
                                    text = "${module.questionCount} questions • ~${module.estimatedTimeMinutes} min",
                                    style = MaterialTheme.typography.bodyMedium,
                                    color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.78f)
                                )
                            }
                        }
                    }
                }
            }
        }
    }

    if (showNoIncorrectAlert) {
        AlertDialog(
            onDismissRequest = { showNoIncorrectAlert = false },
            title = { Text("No incorrect answers yet") },
            text = { Text("Complete a quiz first so we can track which questions to retry.") },
            confirmButton = {
                TextButton(onClick = { showNoIncorrectAlert = false }) {
                    Text("OK")
                }
            }
        )
    }
}

@Composable
private fun LandingActionButton(
    text: String,
    icon: @Composable () -> Unit,
    onClick: () -> Unit,
    primary: Boolean = false,
    enabled: Boolean = true
) {
    val containerBrush = if (primary) {
        Brush.horizontalGradient(
            colors = listOf(
                MaterialTheme.colorScheme.primary.copy(alpha = 0.96f),
                MaterialTheme.colorScheme.primary.copy(alpha = 0.8f)
            )
        )
    } else {
        Brush.horizontalGradient(
            colors = listOf(
                Color.White.copy(alpha = 0.34f),
                Color.White.copy(alpha = 0.24f)
            )
        )
    }

    Button(
        onClick = onClick,
        enabled = enabled,
        modifier = Modifier
            .fillMaxWidth()
            .height(52.dp),
        shape = RoundedCornerShape(26.dp),
        colors = ButtonDefaults.buttonColors(
            containerColor = Color.Transparent,
            contentColor = Color.White,
            disabledContainerColor = Color.White.copy(alpha = 0.14f),
            disabledContentColor = Color.White.copy(alpha = 0.6f)
        ),
        elevation = ButtonDefaults.buttonElevation(defaultElevation = 0.dp, pressedElevation = 0.dp),
        contentPadding = PaddingValues(horizontal = 16.dp)
    ) {
        Box(
            modifier = Modifier
                .fillMaxSize()
                .alpha(if (enabled) 1f else 0.62f)
                .clip(RoundedCornerShape(26.dp))
                .background(containerBrush),
            contentAlignment = Alignment.Center
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(10.dp)
            ) {
                icon()
                Text(
                    text = text,
                    style = MaterialTheme.typography.labelLarge,
                    fontWeight = FontWeight.Medium
                )
            }
        }
    }
}

@Composable
private fun HexagonPattern(modifier: Modifier, lineColor: Color) {
    Canvas(modifier = modifier) {
        val step = 68.dp.toPx()
        val verticalStep = step * 0.75f
        val radius = step / 2.4f

        val rows = (size.height / verticalStep).toInt() + 2
        val columns = (size.width / step).toInt() + 3

        for (row in 0..rows) {
            val y = row * verticalStep
            for (column in 0..columns) {
                val xOffset = column * step + if (row % 2 == 0) 0f else step / 2f
                drawPath(
                    path = hexagonPath(center = Offset(xOffset, y), radius = radius),
                    color = lineColor,
                    style = Stroke(width = 1f, cap = StrokeCap.Round)
                )
            }
        }
    }
}

private fun hexagonPath(center: Offset, radius: Float): Path {
    val path = Path()
    for (side in 0 until 6) {
        val angle = side * PI / 3.0 + PI / 6.0
        val point = Offset(
            x = center.x + radius * cos(angle).toFloat(),
            y = center.y + radius * sin(angle).toFloat()
        )
        if (side == 0) {
            path.moveTo(point.x, point.y)
        } else {
            path.lineTo(point.x, point.y)
        }
    }
    path.close()
    return path
}
