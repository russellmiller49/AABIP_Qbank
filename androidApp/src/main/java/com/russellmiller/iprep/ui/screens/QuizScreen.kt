package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.ArrowBack
import androidx.compose.material.icons.outlined.CheckCircle
import androidx.compose.material.icons.outlined.Close
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.SnackbarHost
import androidx.compose.material3.SnackbarHostState
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.russellmiller.iprep.shared.models.QuizSessionQuestion
import com.russellmiller.iprep.shared.models.QuizSessionState
import com.russellmiller.iprep.ui.IprepAppViewModel
import kotlinx.coroutines.launch
import coil.compose.AsyncImage

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun QuizScreen(
    appViewModel: IprepAppViewModel,
    onNavigateBack: () -> Unit,
    onNavigateToReview: () -> Unit
) {
    val session by appViewModel.currentSession.collectAsState()
    val snackbarHostState = remember { SnackbarHostState() }
    val coroutineScope = rememberCoroutineScope()

    if (session == null || session?.questions.isNullOrEmpty()) {
        EmptyQuizState(onNavigateBack = onNavigateBack)
        return
    }

    val activeSession = session!!
    val currentQuestion = activeSession.currentQuestion

    Scaffold(
        topBar = {
            QuizTopBar(
                session = activeSession,
                onNavigateBack = onNavigateBack
            )
        },
        snackbarHost = { SnackbarHost(snackbarHostState) }
    ) { paddingValues ->
        if (currentQuestion == null) {
            EmptyQuizState(onNavigateBack = onNavigateBack)
            return@Scaffold
        }

        val selectedAnswer = activeSession.answers[currentQuestion.question.id]
        val isCorrect = selectedAnswer != null && selectedAnswer == currentQuestion.question.correctOptionId
        val hasAnswered = selectedAnswer != null

        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(horizontal = 20.dp, vertical = 16.dp)
        ) {
            val scrollState = rememberScrollState()

            Column(
                modifier = Modifier
                    .weight(1f)
                    .verticalScroll(scrollState),
                verticalArrangement = Arrangement.spacedBy(20.dp)
            ) {
                val currentQuestionId = currentQuestion.question.id
                val optionImageMap = remember(currentQuestionId) {
                    val optionsIndexed = currentQuestion.question.options.associateBy { it.id }
                    val optionImages = mutableMapOf<String, String>()
                    val primaryImages = mutableListOf<String>()

                    currentQuestion.question.imageURLs.forEach { url ->
                        val lower = url.lowercase()
                        val match = optionsIndexed.keys.firstOrNull { key ->
                            lower.contains("(${key.lowercase()})") ||
                                lower.contains("_${key.lowercase()})") ||
                                lower.contains("_${key.lowercase()}.") ||
                                lower.contains("option_${key.lowercase()}")
                        }
                        if (match != null && optionImages[match] == null) {
                            optionImages[match] = url
                        } else {
                            primaryImages.add(url)
                        }
                    }

                    OptionMedia(primaryImages = primaryImages, optionImages = optionImages)
                }

                QuizProgressHeader(activeSession)

                QuestionCard(question = currentQuestion)

                optionImageMap.primaryImages.forEach { imageUrl ->
                    AsyncImage(
                        model = imageUrl,
                        contentDescription = null,
                        modifier = Modifier
                            .fillMaxWidth()
                            .heightIn(min = 200.dp)
                            .clip(RoundedCornerShape(16.dp))
                    )
                }

                AnswerOptionsSection(
                    question = currentQuestion,
                    selectedAnswer = selectedAnswer,
                    optionImages = optionImageMap.optionImages,
                    onOptionSelected = { optionId ->
                        if (!hasAnswered) {
                            appViewModel.answerQuestion(currentQuestion.question.id, optionId)
                        }
                    }
                )

                if (hasAnswered) {
                    ExplanationSection(
                        question = currentQuestion,
                        isCorrect = isCorrect,
                        selectedAnswer = selectedAnswer!!
                    )
                }
            }

            Spacer(modifier = Modifier.height(16.dp))

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                TextButton(
                    onClick = { appViewModel.goToPreviousQuestion() },
                    enabled = activeSession.currentQuestionIndex > 0
                ) {
                    Text("Previous")
                }
                Button(
                    onClick = {
                        if (activeSession.isLastQuestion) {
                            appViewModel.completeActiveSession()
                            onNavigateToReview()
                        } else {
                            val advanced = appViewModel.goToNextQuestion()
                            if (!advanced) {
                                coroutineScope.launch {
                                    snackbarHostState.showSnackbar("Answer the question before continuing.")
                                }
                            }
                        }
                    },
                    enabled = hasAnswered
                ) {
                    Text(if (activeSession.isLastQuestion) "Finish Quiz" else "Next Question")
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun QuizTopBar(
    session: QuizSessionState,
    onNavigateBack: () -> Unit
) {
    TopAppBar(
        title = {
            Column {
                Text(
                    text = when (val mode = session.configuration.mode) {
                        is com.russellmiller.iprep.shared.models.QuizMode.Module -> mode.title
                        com.russellmiller.iprep.shared.models.QuizMode.IncorrectOnly -> "Adaptive Review"
                        is com.russellmiller.iprep.shared.models.QuizMode.QuickStart -> "Quick Start"
                    },
                    style = MaterialTheme.typography.titleLarge
                )
                Text(
                    text = "Question ${session.currentQuestionIndex + 1} of ${session.totalQuestions}",
                    style = MaterialTheme.typography.bodySmall
                )
            }
        },
        navigationIcon = {
            IconButton(onClick = onNavigateBack) {
                Icon(
                    imageVector = Icons.Outlined.ArrowBack,
                    contentDescription = "Back"
                )
            }
        }
    )
}

@Composable
private fun QuizProgressHeader(session: QuizSessionState) {
    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
        LinearProgressIndicator(
            progress = (session.currentQuestionIndex + 1).toFloat() / session.totalQuestions.toFloat(),
            modifier = Modifier.fillMaxWidth(),
            color = MaterialTheme.colorScheme.primary
        )
        LazyRow(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
            items(session.questions.size) { index ->
                val answered = session.answers.containsKey(session.questions[index].question.id)
                val isCurrent = index == session.currentQuestionIndex
                Surface(
                    color = when {
                        isCurrent -> MaterialTheme.colorScheme.primary
                        answered -> MaterialTheme.colorScheme.secondaryContainer
                        else -> MaterialTheme.colorScheme.surfaceVariant
                    },
                    shape = RoundedCornerShape(16.dp)
                ) {
                    Text(
                        text = "${index + 1}",
                        modifier = Modifier.padding(horizontal = 12.dp, vertical = 8.dp),
                        style = MaterialTheme.typography.labelMedium.copy(
                            color = if (isCurrent) Color.White else MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    )
                }
            }
        }
    }
}

@Composable
private fun QuestionCard(question: QuizSessionQuestion) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(24.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(20.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Text(
                text = question.module.summary.title,
                style = MaterialTheme.typography.labelMedium.copy(color = MaterialTheme.colorScheme.primary)
            )
            Text(
                text = question.question.prompt,
                style = MaterialTheme.typography.titleMedium.copy(fontSize = 20.sp),
                lineHeight = 26.sp
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun AnswerOptionsSection(
    question: QuizSessionQuestion,
    selectedAnswer: String?,
    optionImages: Map<String, String>,
    onOptionSelected: (String) -> Unit
) {
    Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
        question.question.options.forEach { option ->
            val isSelected = selectedAnswer == option.id
            Surface(
                modifier = Modifier
                    .fillMaxWidth(),
                shape = RoundedCornerShape(18.dp),
                color = if (isSelected) MaterialTheme.colorScheme.primary.copy(alpha = 0.1f) else MaterialTheme.colorScheme.surface,
                border = if (isSelected) androidx.compose.foundation.BorderStroke(1.dp, MaterialTheme.colorScheme.primary) else null,
                onClick = { if (selectedAnswer == null) onOptionSelected(option.id) }
            ) {
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 18.dp, vertical = 14.dp)
                ) {
                    Text(
                        text = "${option.id.uppercase()}.",
                        style = MaterialTheme.typography.labelMedium.copy(fontWeight = FontWeight.SemiBold)
                    )
                    Spacer(modifier = Modifier.height(4.dp))
                    Text(
                        text = option.text.ifBlank { "Option ${option.id.uppercase()}" },
                        style = MaterialTheme.typography.bodyLarge
                    )
                    optionImages[option.id]?.let { imageUrl ->
                        Spacer(modifier = Modifier.height(8.dp))
                        AsyncImage(
                            model = imageUrl,
                            contentDescription = null,
                            modifier = Modifier
                                .fillMaxWidth()
                                .clip(RoundedCornerShape(12.dp))
                        )
                    }
                }
            }
        }
    }
}

private data class OptionMedia(
    val primaryImages: List<String>,
    val optionImages: Map<String, String>
)

@Composable
private fun ExplanationSection(
    question: QuizSessionQuestion,
    isCorrect: Boolean,
    selectedAnswer: String
) {
    val correctOption = question.question.options.firstOrNull { it.id == question.question.correctOptionId }
    val selectedOption = question.question.options.firstOrNull { it.id == selectedAnswer }

    Surface(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(20.dp),
        color = if (isCorrect) MaterialTheme.colorScheme.primary.copy(alpha = 0.12f) else MaterialTheme.colorScheme.error.copy(alpha = 0.12f)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 18.dp, vertical = 16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                Icon(
                    imageVector = if (isCorrect) Icons.Outlined.CheckCircle else Icons.Outlined.Close,
                    contentDescription = null,
                    tint = if (isCorrect) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.error
                )
                Text(
                    text = if (isCorrect) "Correct" else "Let's review",
                    style = MaterialTheme.typography.titleMedium.copy(fontWeight = FontWeight.SemiBold)
                )
            }
            if (!isCorrect && selectedOption != null) {
                Text(
                    text = "You selected ${selectedOption.id.uppercase()}. ${selectedOption.text}",
                    style = MaterialTheme.typography.bodySmall.copy(color = MaterialTheme.colorScheme.onSurfaceVariant)
                )
            }
            Text(
                text = "Correct answer: ${correctOption?.id?.uppercase()}. ${correctOption?.text ?: ""}",
                style = MaterialTheme.typography.bodyMedium.copy(fontWeight = FontWeight.SemiBold)
            )
            Text(
                text = question.question.explanation,
                style = MaterialTheme.typography.bodyMedium
            )
        }
    }
}

@Composable
private fun EmptyQuizState(onNavigateBack: () -> Unit) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(MaterialTheme.colorScheme.background)
            .padding(24.dp),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = "Start a practice session from the Home screen to begin.",
            style = MaterialTheme.typography.bodyLarge,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
        Spacer(modifier = Modifier.height(20.dp))
        Button(onClick = onNavigateBack) {
            Text("Back to Home")
        }
    }
}
