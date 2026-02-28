package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.RadioButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.russellmiller.iprep.shared.AppEnvironment
import com.russellmiller.iprep.shared.models.QuizMode
import com.russellmiller.iprep.shared.models.QuizSessionConfiguration

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun QuizScreen(
    onNavigateBack: () -> Unit,
    onNavigateToReview: () -> Unit,
    mode: QuizMode = QuizMode.QuickStart(resume = false),
    questionLimit: Int = 10
) {
    val appEnvironment = remember { AppEnvironment.shared }

    var currentQuestionIndex by remember(mode) { mutableIntStateOf(0) }
    var selectedAnswer by remember(mode, currentQuestionIndex) { mutableStateOf<String?>(null) }
    var isAnswered by remember(mode, currentQuestionIndex) { mutableStateOf(false) }

    val session = remember(mode, questionLimit) {
        appEnvironment.quizSessionService.startSession(
            QuizSessionConfiguration(
                mode = mode,
                questionLimit = questionLimit
            )
        )
    }

    val currentQuestion = session.questions.getOrNull(currentQuestionIndex)
    val scrollState = rememberScrollState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(titleForMode(mode)) },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(imageVector = Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        if (currentQuestion == null) {
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues),
                contentAlignment = Alignment.Center
            ) {
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Text(
                        text = when (mode) {
                            is QuizMode.IncorrectOnly -> "No incorrect questions are available yet."
                            is QuizMode.Module -> "No questions were found for this module."
                            is QuizMode.QuickStart -> "No questions available."
                        },
                        style = MaterialTheme.typography.bodyLarge
                    )
                    Button(onClick = onNavigateBack) {
                        Text("Back")
                    }
                }
            }
            return@Scaffold
        }

        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(horizontal = 16.dp, vertical = 12.dp)
                .verticalScroll(scrollState)
        ) {
            LinearProgressIndicator(
                progress = (currentQuestionIndex + 1).toFloat() / session.questions.size.coerceAtLeast(1).toFloat(),
                modifier = Modifier.fillMaxWidth()
            )

            Spacer(modifier = Modifier.height(14.dp))

            Text(
                text = "Question ${currentQuestionIndex + 1} of ${session.questions.size}",
                style = MaterialTheme.typography.labelLarge,
                color = MaterialTheme.colorScheme.onBackground.copy(alpha = 0.75f)
            )

            Spacer(modifier = Modifier.height(12.dp))

            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text(
                        text = currentQuestion.question.prompt,
                        style = MaterialTheme.typography.titleMedium,
                        color = MaterialTheme.colorScheme.onSurface
                    )
                }
            }

            Spacer(modifier = Modifier.height(14.dp))

            currentQuestion.question.options.forEach { option ->
                val isCorrect = option.id == currentQuestion.question.correctOptionId
                val isSelected = selectedAnswer == option.id
                val colors = when {
                    !isAnswered -> CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
                    isSelected && isCorrect -> CardDefaults.cardColors(containerColor = Color(0xFF3C9E46).copy(alpha = 0.24f))
                    isSelected && !isCorrect -> CardDefaults.cardColors(containerColor = Color(0xFFD9534F).copy(alpha = 0.24f))
                    isCorrect -> CardDefaults.cardColors(containerColor = Color(0xFF3C9E46).copy(alpha = 0.18f))
                    else -> CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
                }

                Card(
                    onClick = {
                        if (!isAnswered) {
                            selectedAnswer = option.id
                            isAnswered = true
                            appEnvironment.quizSessionService.answerQuestion(
                                currentQuestion.question.id,
                                option.id
                            )
                        }
                    },
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(vertical = 4.dp),
                    colors = colors
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(14.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        RadioButton(
                            selected = isSelected,
                            onClick = null
                        )
                        Spacer(modifier = Modifier.width(10.dp))
                        Text(
                            text = option.text,
                            style = MaterialTheme.typography.bodyLarge
                        )
                    }
                }
            }

            if (isAnswered && currentQuestion.question.explanation.isNotBlank()) {
                Spacer(modifier = Modifier.height(14.dp))
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                ) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Text(
                            text = "Explanation",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.SemiBold
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = currentQuestion.question.explanation,
                            style = MaterialTheme.typography.bodyMedium
                        )
                    }
                }
            }

            Spacer(modifier = Modifier.height(18.dp))

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Button(
                    onClick = {
                        if (currentQuestionIndex > 0) {
                            currentQuestionIndex--
                            selectedAnswer = null
                            isAnswered = false
                        }
                    },
                    enabled = currentQuestionIndex > 0
                ) {
                    Text("Previous")
                }

                Button(
                    onClick = {
                        if (currentQuestionIndex < session.questions.size - 1) {
                            currentQuestionIndex++
                            selectedAnswer = null
                            isAnswered = false
                        } else {
                            onNavigateToReview()
                        }
                    },
                    enabled = isAnswered
                ) {
                    Text(if (currentQuestionIndex < session.questions.size - 1) "Next" else "Finish")
                }
            }

            Spacer(modifier = Modifier.height(14.dp))
        }
    }
}

private fun titleForMode(mode: QuizMode): String {
    return when (mode) {
        is QuizMode.QuickStart -> if (mode.resume) "Continue Quiz" else "Quiz"
        is QuizMode.Module -> mode.title
        is QuizMode.IncorrectOnly -> "Retry Incorrect"
    }
}
