package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
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
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.LinearProgressIndicator
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
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.russellmiller.iprep.shared.models.Module
import com.russellmiller.iprep.shared.models.StudyProgress
import com.russellmiller.iprep.ui.IprepAppViewModel
import kotlin.math.roundToInt
import java.util.Locale

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DashboardScreen(
    appViewModel: IprepAppViewModel,
    onNavigateBack: () -> Unit,
    onNavigateToQuiz: () -> Unit,
    onNavigateToAnalytics: () -> Unit
) {
    val moduleProgressMap by appViewModel.moduleProgress.collectAsState()
    val studyStates by appViewModel.questionStudyStates.collectAsState()
    val overallProgress = remember(studyStates) { appViewModel.getOverallProgress() }
    val modules = appViewModel.moduleSummaries

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Dashboard") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(imageVector = Icons.Outlined.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    TextButton(onClick = onNavigateToAnalytics) {
                        Text("Analytics")
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
                OverallProgressCard(progress = overallProgress)
            }

            item {
                Button(
                    onClick = onNavigateToQuiz,
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(20.dp)
                ) {
                    Text("Start a new practice session")
                }
            }

            item {
                Text(
                    text = "Module breakdown",
                    style = MaterialTheme.typography.titleMedium,
                    modifier = Modifier.padding(vertical = 4.dp)
                )
            }

            items(modules) { module ->
                val progress = moduleProgressMap[module.id] ?: appViewModel.getModuleProgress(module.id)
                ModuleProgressRow(module = module, progress = progress)
            }

            item { Spacer(modifier = Modifier.height(24.dp)) }
        }
    }
}

@Composable
private fun OverallProgressCard(progress: StudyProgress) {
    val completion = (progress.completionPercentage * 100).roundToInt()
    val accuracy = (progress.accuracy * 100).roundToInt()

    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(26.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primary.copy(alpha = 0.08f))
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(20.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Text(
                text = "Overall progress",
                style = MaterialTheme.typography.titleLarge.copy(fontWeight = FontWeight.SemiBold)
            )
            LinearProgressIndicator(
                progress = progress.completionPercentage,
                modifier = Modifier.fillMaxWidth(),
                color = MaterialTheme.colorScheme.primary
            )
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                MetricColumn(label = "Questions answered", value = "${progress.answeredQuestions}")
                MetricColumn(label = "Completion", value = "$completion%")
                MetricColumn(label = "Accuracy", value = "$accuracy%")
            }
        }
    }
}

@Composable
private fun ModuleProgressRow(module: Module, progress: StudyProgress?) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(20.dp),
        tonalElevation = 1.dp
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(10.dp)
        ) {
            Text(
                text = module.title,
                style = MaterialTheme.typography.titleMedium
            )
            Text(
                text = module.description,
                style = MaterialTheme.typography.bodySmall,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis
            )
            LinearProgressIndicator(
                progress = progress?.completionPercentage ?: 0f,
                modifier = Modifier.fillMaxWidth(),
                color = MaterialTheme.colorScheme.primary
            )
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text(
                    text = "${progress?.answeredQuestions ?: 0}/${progress?.totalQuestions ?: module.questionCount} answered",
                    style = MaterialTheme.typography.bodySmall
                )
                Text(
                    text = module.difficulty.value.replaceFirstChar { if (it.isLowerCase()) it.titlecase(Locale.getDefault()) else it.toString() },
                    style = MaterialTheme.typography.labelMedium
                )
            }
        }
    }
}

@Composable
private fun MetricColumn(label: String, value: String) {
    Column(horizontalAlignment = Alignment.CenterHorizontally) {
        Text(
            text = value,
            style = MaterialTheme.typography.titleMedium.copy(fontWeight = FontWeight.SemiBold)
        )
        Text(
            text = label,
            style = MaterialTheme.typography.bodySmall
        )
    }
}
