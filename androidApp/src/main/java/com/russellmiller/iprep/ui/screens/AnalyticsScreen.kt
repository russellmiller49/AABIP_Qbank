package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.CheckCircle
import androidx.compose.material.icons.filled.Schedule
import androidx.compose.material.icons.filled.WarningAmber
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.russellmiller.iprep.shared.AppEnvironment
import com.russellmiller.iprep.shared.models.Module

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AnalyticsScreen(
    onNavigateBack: () -> Unit
) {
    val appEnvironment = remember { AppEnvironment.shared }
    val studyStates by appEnvironment.studyPlannerService.questionStudyStates.collectAsState(initial = emptyMap())
    val modules = remember { appEnvironment.questionBankService.moduleSummaries().associateBy { it.id } }

    val answered = studyStates.values.count { it.isAnswered }
    val correct = studyStates.values.count { it.isCorrect }
    val reviewDue = studyStates.values.count { it.needsReview }
    val accuracy = if (answered == 0) 0 else (correct * 100f / answered).toInt()

    val moduleRows = remember(studyStates, modules) {
        studyStates.values
            .groupBy { it.moduleId }
            .mapNotNull { (moduleID, states) ->
                val module = modules[moduleID] ?: return@mapNotNull null
                val answeredCount = states.count { it.isAnswered }
                val correctCount = states.count { it.isCorrect }
                val dueCount = states.count { it.needsReview }
                ModuleAnalytics(
                    module = module,
                    answered = answeredCount,
                    correct = correctCount,
                    due = dueCount
                )
            }
            .sortedByDescending { it.accuracy }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Analytics") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(imageVector = Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .padding(paddingValues),
            contentPadding = PaddingValues(horizontal = 16.dp, vertical = 20.dp),
            verticalArrangement = Arrangement.spacedBy(14.dp)
        ) {
            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(10.dp)
                ) {
                    AnalyticsSummaryCard(
                        modifier = Modifier.weight(1f),
                        title = "Correct",
                        value = "$accuracy%",
                        icon = { Icon(imageVector = Icons.Default.CheckCircle, contentDescription = null) }
                    )
                    AnalyticsSummaryCard(
                        modifier = Modifier.weight(1f),
                        title = "Review Due",
                        value = reviewDue.toString(),
                        icon = { Icon(imageVector = Icons.Default.WarningAmber, contentDescription = null) }
                    )
                    AnalyticsSummaryCard(
                        modifier = Modifier.weight(1f),
                        title = "Answered",
                        value = answered.toString(),
                        icon = { Icon(imageVector = Icons.Default.Schedule, contentDescription = null) }
                    )
                }
            }

            if (moduleRows.isEmpty()) {
                item {
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
                    ) {
                        Text(
                            text = "Complete a quiz session to unlock module analytics.",
                            modifier = Modifier.padding(16.dp),
                            style = MaterialTheme.typography.bodyLarge
                        )
                    }
                }
            } else {
                item {
                    Text(
                        text = "Module Insights",
                        style = MaterialTheme.typography.titleLarge,
                        fontWeight = FontWeight.SemiBold
                    )
                }
                items(moduleRows, key = { it.module.id }) { row ->
                    ModuleAnalyticsCard(row)
                }
            }
        }
    }
}

@Composable
private fun AnalyticsSummaryCard(
    modifier: Modifier,
    title: String,
    value: String,
    icon: @Composable () -> Unit
) {
    Card(
        modifier = modifier,
        shape = RoundedCornerShape(14.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            icon()
            Text(text = value, style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
            Text(
                text = title,
                style = MaterialTheme.typography.labelMedium,
                color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.72f)
            )
        }
    }
}

@Composable
private fun ModuleAnalyticsCard(row: ModuleAnalytics) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(18.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Text(
                text = row.module.title,
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )
            LinearProgressIndicator(
                progress = (row.accuracy / 100f),
                modifier = Modifier.fillMaxWidth()
            )
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "${row.correct}/${row.answered} correct",
                    style = MaterialTheme.typography.bodyMedium
                )
                Text(
                    text = "${row.accuracy}%",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
            }
            if (row.due > 0) {
                Text(
                    text = "${row.due} due for review",
                    style = MaterialTheme.typography.labelMedium,
                    color = MaterialTheme.colorScheme.error
                )
            }
        }
    }
}

private data class ModuleAnalytics(
    val module: Module,
    val answered: Int,
    val correct: Int,
    val due: Int
) {
    val accuracy: Int
        get() = if (answered == 0) 0 else (correct * 100f / answered).toInt()
}
