package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.ArrowBack
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Button
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
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.russellmiller.iprep.ui.IprepAppViewModel
import kotlin.math.roundToInt

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SettingsScreen(
    appViewModel: IprepAppViewModel,
    onNavigateBack: () -> Unit
) {
    val studyStates by appViewModel.questionStudyStates.collectAsState()
    val overallProgress = remember(studyStates) { appViewModel.getOverallProgress() }
    var showResetDialog by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Settings") },
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
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(20.dp)
        ) {
            Surface(
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(24.dp),
                tonalElevation = 2.dp
            ) {
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(20.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Text(
                        text = "Practice summary",
                        style = MaterialTheme.typography.titleMedium.copy(fontWeight = FontWeight.SemiBold)
                    )
                    Text(
                        text = "Questions answered: ${overallProgress.answeredQuestions}",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    Text(
                        text = "Accuracy: ${(overallProgress.accuracy * 100).roundToInt()}%",
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
            }

            Button(
                onClick = { showResetDialog = true },
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(20.dp)
            ) {
                Text("Reset progress and sessions")
            }
        }
    }

    if (showResetDialog) {
        AlertDialog(
            onDismissRequest = { showResetDialog = false },
            title = { Text("Reset all progress") },
            text = { Text("This will clear practice history, session results, and study progress. This action cannot be undone.") },
            confirmButton = {
                TextButton(onClick = {
                    appViewModel.resetAllProgress()
                    showResetDialog = false
                    onNavigateBack()
                }) {
                    Text("Reset")
                }
            },
            dismissButton = {
                TextButton(onClick = { showResetDialog = false }) {
                    Text("Cancel")
                }
            }
        )
    }
}
