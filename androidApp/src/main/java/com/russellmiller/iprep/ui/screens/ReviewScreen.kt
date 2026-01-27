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
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Tab
import androidx.compose.material3.TabRow
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.russellmiller.iprep.shared.models.CompletedQuizSession
import com.russellmiller.iprep.ui.IprepAppViewModel
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ReviewScreen(
    appViewModel: IprepAppViewModel,
    onNavigateBack: () -> Unit
) {
    val completedSessions by appViewModel.completedSessions.collectAsState()
    val formatter = remember { SimpleDateFormat("MMM d, yyyy h:mma", Locale.getDefault()) }

    if (completedSessions.isEmpty()) {
        EmptyReviewState(onNavigateBack = onNavigateBack)
        return
    }

    var selectedTabIndex by remember { mutableStateOf(0) }
    var selectedSessionId by remember { mutableStateOf(completedSessions.first().sessionId) }

    val selectedSession = remember(completedSessions, selectedSessionId) {
        completedSessions.firstOrNull { it.sessionId == selectedSessionId }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Session Review") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(imageVector = Icons.Outlined.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            TabRow(selectedTabIndex = selectedTabIndex) {
                completedSessions.forEachIndexed { index, session ->
                    Tab(
                        selected = selectedTabIndex == index,
                        onClick = {
                            selectedTabIndex = index
                            selectedSessionId = session.sessionId
                        },
                        text = {
                            Text(
                                text = formatter.format(Date(session.completedAt)),
                                maxLines = 1,
                                overflow = TextOverflow.Ellipsis
                            )
                        }
                    )
                }
            }

            selectedSession?.let { session ->
                ReviewSummaryCard(session = session)

                val questionDetails = remember(session) {
                    session.questionReferences.mapNotNull { reference ->
                        appViewModel.questionBank.sessionQuestion(reference)
                    }
                }

                LazyColumn(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(horizontal = 16.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    items(questionDetails) { item ->
                        val wasCorrect = session.selections[item.question.id] == item.question.correctOptionId
                        ReviewQuestionRow(question = item, isCorrect = wasCorrect, session = session)
                    }
                    item { Spacer(modifier = Modifier.height(24.dp)) }
                }
            }
        }
    }
}

@Composable
private fun ReviewSummaryCard(session: CompletedQuizSession) {
    val accuracyPercent = (session.accuracy * 100).toInt()
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp),
        shape = RoundedCornerShape(24.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primary.copy(alpha = 0.08f))
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(20.dp),
            verticalArrangement = Arrangement.spacedBy(10.dp)
        ) {
            Text(
                text = "Score ${session.correctCount}/${session.totalQuestions}",
                style = MaterialTheme.typography.titleLarge.copy(fontWeight = FontWeight.SemiBold)
            )
            Text(
                text = "Accuracy $accuracyPercent% • Duration ${(session.durationMillis / 1000)}s",
                style = MaterialTheme.typography.bodyMedium
            )
            Text(
                text = "Mode: ${modeTitle(session)}",
                style = MaterialTheme.typography.bodySmall
            )
        }
    }
}

@Composable
private fun ReviewQuestionRow(
    question: com.russellmiller.iprep.shared.models.QuizSessionQuestion,
    isCorrect: Boolean,
    session: CompletedQuizSession
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(18.dp),
        color = if (isCorrect) MaterialTheme.colorScheme.surface else MaterialTheme.colorScheme.error.copy(alpha = 0.08f)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(6.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = question.module.summary.title,
                    style = MaterialTheme.typography.labelMedium.copy(color = MaterialTheme.colorScheme.primary)
                )
                Text(
                    text = if (isCorrect) "Correct" else "Incorrect",
                    style = MaterialTheme.typography.labelMedium.copy(fontWeight = FontWeight.Bold)
                )
            }
            Text(
                text = question.question.prompt,
                style = MaterialTheme.typography.bodyLarge,
                maxLines = 3,
                overflow = TextOverflow.Ellipsis
            )
            val selected = session.selections[question.question.id]
            val correctOption = question.question.options.firstOrNull { it.id == question.question.correctOptionId }
            val selectedOption = question.question.options.firstOrNull { it.id == selected }
            if (selectedOption != null) {
                Text(
                    text = "Your answer: ${selectedOption.id.uppercase()}. ${selectedOption.text}",
                    style = MaterialTheme.typography.bodySmall
                )
            }
            if (!isCorrect && correctOption != null) {
                Text(
                    text = "Correct: ${correctOption.id.uppercase()}. ${correctOption.text}",
                    style = MaterialTheme.typography.bodySmall.copy(fontWeight = FontWeight.SemiBold)
                )
            }
        }
    }
}

@Composable
private fun EmptyReviewState(onNavigateBack: () -> Unit) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(24.dp),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = "Complete a quiz to view your detailed history.",
            style = MaterialTheme.typography.bodyLarge,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
        Spacer(modifier = Modifier.height(16.dp))
        TextButton(onClick = onNavigateBack) {
            Text("Back to Home")
        }
    }
}

private fun modeTitle(session: CompletedQuizSession): String {
    return when (val mode = session.configuration.mode) {
        is com.russellmiller.iprep.shared.models.QuizMode.Module -> "${mode.title} module"
        com.russellmiller.iprep.shared.models.QuizMode.IncorrectOnly -> "Adaptive review"
        is com.russellmiller.iprep.shared.models.QuizMode.QuickStart -> "Quick Start"
    }
}
