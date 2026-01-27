package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.RowScope
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.ArrowBack
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.russellmiller.iprep.shared.models.Module
import com.russellmiller.iprep.shared.models.StudyProgress
import com.russellmiller.iprep.ui.IprepAppViewModel
import kotlin.math.max
import kotlin.math.min

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AnalyticsScreen(
    appViewModel: IprepAppViewModel,
    onNavigateBack: () -> Unit
) {
    val completedSessions by appViewModel.completedSessions.collectAsState()
    val moduleProgress by appViewModel.moduleProgress.collectAsState()
    val modules = appViewModel.moduleSummaries

    if (completedSessions.isEmpty()) {
        EmptyAnalyticsState(onNavigateBack = onNavigateBack)
        return
    }

    val averageAccuracy = remember(completedSessions) {
        completedSessions.map { it.accuracy }.average()
    }
    val bestScore = remember(completedSessions) {
        completedSessions.maxOf { it.correctCount }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Analytics") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(imageVector = Icons.Outlined.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = androidx.compose.foundation.layout.PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            item {
                MetricsRow(
                    sessionCount = completedSessions.size,
                    averageAccuracy = averageAccuracy,
                    bestScore = bestScore
                )
            }

            item {
                AccuracyTrendCard(completedSessions.map { it.accuracy })
            }

            item {
                Text(
                    text = "Module momentum",
                    style = MaterialTheme.typography.titleMedium
                )
            }

            items(modules) { module ->
                val progress = moduleProgress[module.id] ?: appViewModel.getModuleProgress(module.id)
                ModuleAnalyticsRow(module = module, progress = progress)
            }
        }
    }
}

@Composable
private fun MetricsRow(sessionCount: Int, averageAccuracy: Double, bestScore: Int) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        AnalyticsMetricCard(title = "Sessions", value = sessionCount.toString())
        AnalyticsMetricCard(title = "Avg accuracy", value = "${(averageAccuracy * 100).toInt()}%")
        AnalyticsMetricCard(title = "Best score", value = bestScore.toString())
    }
}

@Composable
private fun RowScope.AnalyticsMetricCard(title: String, value: String) {
    Card(
        modifier = Modifier.weight(1f),
        shape = RoundedCornerShape(20.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(6.dp)
        ) {
            Text(
                text = value,
                style = MaterialTheme.typography.titleLarge.copy(fontWeight = FontWeight.SemiBold)
            )
            Text(
                text = title,
                style = MaterialTheme.typography.bodySmall
            )
        }
    }
}

@Composable
private fun AccuracyTrendCard(points: List<Float>) {
    val sanitized = if (points.isEmpty()) listOf(0f) else points
    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(24.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primary.copy(alpha = 0.08f))
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(20.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Text(
                text = "Accuracy trend",
                style = MaterialTheme.typography.titleMedium.copy(fontWeight = FontWeight.SemiBold)
            )
            val primaryColor = MaterialTheme.colorScheme.primary
            Canvas(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(180.dp)
            ) {
                val maxAccuracy = sanitized.maxOrNull() ?: 0f
                val minAccuracy = sanitized.minOrNull() ?: 0f
                val range = max(0.05f, maxAccuracy - minAccuracy)
                val stepX = if (sanitized.size <= 1) 0f else size.width / (sanitized.size - 1)

                val path = Path()
                sanitized.forEachIndexed { index, value ->
                    val normalized = if (range == 0f) 0f else (value - minAccuracy) / range
                    val x = stepX * index
                    val y = size.height - (normalized * size.height)
                    if (index == 0) path.moveTo(x, y) else path.lineTo(x, y)
                }
                drawPath(
                    path = path,
                    color = primaryColor,
                    style = androidx.compose.ui.graphics.drawscope.Stroke(width = 6f)
                )

                sanitized.forEachIndexed { index, value ->
                    val normalized = if (range == 0f) 0f else (value - minAccuracy) / range
                    val x = stepX * index
                    val y = size.height - (normalized * size.height)
                    drawCircle(
                        color = primaryColor,
                        radius = 8f,
                        center = Offset(x, y)
                    )
                }
            }
            Text(
                text = "Each point represents quiz accuracy in chronological order.",
                style = MaterialTheme.typography.bodySmall
            )
        }
    }
}

@Composable
private fun ModuleAnalyticsRow(module: Module, progress: StudyProgress?) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(18.dp),
        tonalElevation = 1.dp
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Text(
                text = module.title,
                style = MaterialTheme.typography.titleMedium
            )
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                val accuracyPercent = ((progress?.accuracy ?: 0f) * 100).toInt()
                Text(
                    text = "Accuracy $accuracyPercent%",
                    style = MaterialTheme.typography.bodySmall
                )
                Text(
                    text = "Needs review ${progress?.needsReviewCount ?: 0}",
                    style = MaterialTheme.typography.bodySmall
                )
            }
        }
    }
}

@Composable
private fun EmptyAnalyticsState(onNavigateBack: () -> Unit) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(24.dp),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = "Complete at least one practice session to unlock analytics.",
            style = MaterialTheme.typography.bodyLarge,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
        Spacer(modifier = Modifier.height(16.dp))
        TextButton(onClick = onNavigateBack) {
            Text("Back to Home")
        }
    }
}
