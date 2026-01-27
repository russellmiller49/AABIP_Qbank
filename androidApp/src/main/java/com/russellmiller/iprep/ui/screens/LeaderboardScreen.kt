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
import androidx.compose.ui.unit.dp
import com.russellmiller.iprep.shared.models.CompletedQuizSession
import com.russellmiller.iprep.ui.IprepAppViewModel
import kotlin.math.roundToInt

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LeaderboardScreen(
    appViewModel: IprepAppViewModel,
    onNavigateBack: () -> Unit
) {
    val completedSessions by appViewModel.completedSessions.collectAsState()

    if (completedSessions.isEmpty()) {
        EmptyLeaderboardState(onNavigateBack = onNavigateBack)
        return
    }

    val leaderboardEntries = remember(completedSessions) {
        buildLeaderboard(completedSessions)
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Leaderboards") },
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
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            items(leaderboardEntries) { entry ->
                LeaderboardRow(entry = entry)
            }
        }
    }
}

private data class LeaderboardEntry(
    val position: Int,
    val name: String,
    val averageAccuracy: Double,
    val sessionsCompleted: Int
)

private fun buildLeaderboard(sessions: List<CompletedQuizSession>): List<LeaderboardEntry> {
    val userAccuracy = if (sessions.isEmpty()) 0.0 else sessions.map { it.accuracy }.average()
    val userSessions = sessions.size

    val baseline = listOf(
        LeaderboardEntry(0, "Dr. Chen", 0.92, 18),
        LeaderboardEntry(0, "Dr. Patel", 0.88, 22),
        LeaderboardEntry(0, "Dr. Gomez", 0.85, 16),
        LeaderboardEntry(0, "Dr. Reynolds", 0.81, 12)
    )

    val userEntry = LeaderboardEntry(0, "You", userAccuracy, userSessions)

    return (baseline + userEntry)
        .sortedByDescending { it.averageAccuracy }
        .mapIndexed { index, entry ->
            entry.copy(position = index + 1)
        }
}

@Composable
private fun LeaderboardRow(entry: LeaderboardEntry) {
    val accuracyPercent = (entry.averageAccuracy * 100).roundToInt()
    Surface(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(20.dp),
        tonalElevation = if (entry.name == "You") 4.dp else 1.dp
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 18.dp, vertical = 14.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(14.dp)) {
                Card(
                    shape = RoundedCornerShape(12.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primary.copy(alpha = 0.12f))
                ) {
                    Text(
                        text = "${entry.position}",
                        modifier = Modifier.padding(horizontal = 14.dp, vertical = 10.dp),
                        style = MaterialTheme.typography.titleMedium.copy(fontWeight = FontWeight.Bold)
                    )
                }
                Column {
                    Text(
                        text = entry.name,
                        style = MaterialTheme.typography.titleMedium.copy(fontWeight = FontWeight.SemiBold)
                    )
                    Text(
                        text = "Avg accuracy $accuracyPercent%",
                        style = MaterialTheme.typography.bodySmall
                    )
                }
            }
            Text(
                text = "${entry.sessionsCompleted} sessions",
                style = MaterialTheme.typography.labelMedium
            )
        }
    }
}

@Composable
private fun EmptyLeaderboardState(onNavigateBack: () -> Unit) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(24.dp),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = "Complete a few sessions to see how you stack up.",
            style = MaterialTheme.typography.bodyLarge,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
        Spacer(modifier = Modifier.height(16.dp))
        TextButton(onClick = onNavigateBack) {
            Text("Back to Home")
        }
    }
}
