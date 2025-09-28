package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.russellmiller.iprep.shared.AppEnvironment
import com.russellmiller.iprep.shared.models.QuizMode
import com.russellmiller.iprep.shared.models.QuizSessionConfiguration

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun QuizScreen(
    onNavigateBack: () -> Unit,
    onNavigateToReview: () -> Unit
) {
    val appEnvironment = AppEnvironment.shared
    var currentQuestionIndex by remember { mutableIntStateOf(0) }
    var selectedAnswer by remember { mutableStateOf<String?>(null) }
    var isAnswered by remember { mutableStateOf(false) }
    
    // Start a quick quiz session
    val session = remember {
        appEnvironment.quizSessionService.startSession(
            QuizSessionConfiguration(
                mode = QuizMode.QuickStart(resume = false),
                questionLimit = 5
            )
        )
    }
    
    val currentQuestion = session.questions.getOrNull(currentQuestionIndex)
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Quiz") },
                navigationIcon = {
                    TextButton(onClick = onNavigateBack) {
                        Text("Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        if (currentQuestion != null) {
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
                    .padding(16.dp)
            ) {
                // Progress indicator
                LinearProgressIndicator(
                    progress = (currentQuestionIndex + 1).toFloat() / session.questions.size,
                    modifier = Modifier.fillMaxWidth()
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                // Question number and progress
                Text(
                    text = "Question ${currentQuestionIndex + 1} of ${session.questions.size}",
                    fontSize = 14.sp,
                    fontWeight = FontWeight.Medium
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                // Question prompt
                Card(
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Text(
                            text = currentQuestion.question.prompt,
                            fontSize = 16.sp,
                            fontWeight = FontWeight.Medium
                        )
                    }
                }
                
                Spacer(modifier = Modifier.height(16.dp))
                
                // Answer options
                LazyColumn(
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(currentQuestion.question.options) { option ->
                        Card(
                            modifier = Modifier.fillMaxWidth(),
                            onClick = {
                                if (!isAnswered) {
                                    selectedAnswer = option.id
                                    isAnswered = true
                                    appEnvironment.quizSessionService.answerQuestion(
                                        currentQuestion.question.id,
                                        option.id
                                    )
                                }
                            }
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(16.dp),
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                RadioButton(
                                    selected = selectedAnswer == option.id,
                                    onClick = null
                                )
                                Spacer(modifier = Modifier.width(8.dp))
                                Text(
                                    text = option.text,
                                    fontSize = 14.sp
                                )
                            }
                        }
                    }
                }
                
                Spacer(modifier = Modifier.weight(1f))
                
                // Navigation buttons
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
                        Text(
                            if (currentQuestionIndex < session.questions.size - 1) "Next" else "Finish"
                        )
                    }
                }
            }
        } else {
            Box(
                modifier = Modifier.fillMaxSize(),
                contentAlignment = Alignment.Center
            ) {
                Text("No questions available")
            }
        }
    }
}
