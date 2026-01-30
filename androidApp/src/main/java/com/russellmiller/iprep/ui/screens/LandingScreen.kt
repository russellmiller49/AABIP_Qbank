package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.russellmiller.iprep.shared.AppEnvironment
import com.russellmiller.iprep.shared.models.Module

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LandingScreen(
    onNavigateToQuiz: () -> Unit,
    onNavigateToDashboard: () -> Unit,
    onNavigateToAnalytics: () -> Unit,
    onNavigateToLeaderboard: () -> Unit,
    onNavigateToDuel: () -> Unit,
    onNavigateToCrosswords: () -> Unit
) {
    val appEnvironment = AppEnvironment.shared
    val modules by remember { mutableStateOf(appEnvironment.questionBankService.moduleSummaries()) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("IPREP") }
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            item {
                Card(
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "Quick Start",
                            fontSize = 20.sp,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "Start a practice session with random questions",
                            textAlign = TextAlign.Center
                        )
                        Button(onClick = onNavigateToQuiz) {
                            Text("Start Quiz")
                        }
                    }
                }
            }
            
            item {
                Card(
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "Dashboard",
                            fontSize = 20.sp,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "View your progress and study statistics",
                            textAlign = TextAlign.Center
                        )
                        Button(onClick = onNavigateToDashboard) {
                            Text("View Dashboard")
                        }
                    }
                }
            }

            item {
                Card(
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "Clinical Duel",
                            fontSize = 20.sp,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "Battle themed enemies by answering True/False questions",
                            textAlign = TextAlign.Center
                        )
                        Button(onClick = onNavigateToDuel) {
                            Text("Start Duel")
                        }
                    }
                }
            }

            item {
                Card(
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "Crossword Puzzles",
                            fontSize = 20.sp,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "Practice high-yield IP concepts with interactive crosswords",
                            textAlign = TextAlign.Center
                        )
                        Button(onClick = onNavigateToCrosswords) {
                            Text("Open Crosswords")
                        }
                    }
                }
            }

            item {
                Text(
                    text = "Study Modules",
                    fontSize = 18.sp,
                    fontWeight = FontWeight.Bold
                )
            }
            
            items(modules) { module ->
                ModuleCard(
                    module = module,
                    onClick = { onNavigateToQuiz() }
                )
            }
            
            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceEvenly
                ) {
                    Button(onClick = onNavigateToAnalytics) {
                        Text("Analytics")
                    }
                    Button(onClick = onNavigateToLeaderboard) {
                        Text("Leaderboard")
                    }
                }
            }
        }
    }
}

@Composable
fun ModuleCard(
    module: Module,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = module.title,
                fontSize = 16.sp,
                fontWeight = FontWeight.Bold
            )
            Text(
                text = module.description,
                fontSize = 14.sp
            )
            Spacer(modifier = Modifier.height(8.dp))
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text(
                    text = "${module.questionCount} questions",
                    fontSize = 12.sp
                )
                Text(
                    text = "${module.estimatedTimeMinutes} min",
                    fontSize = 12.sp
                )
                Text(
                    text = module.difficulty.value,
                    fontSize = 12.sp
                )
            }
            Spacer(modifier = Modifier.height(8.dp))
            Button(
                onClick = onClick,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text("Start Module")
            }
        }
    }
}
