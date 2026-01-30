package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Card
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

private data class CrosswordPuzzle(
    val id: String,
    val title: String,
    val subtitle: String
)

private val crosswordPuzzles = listOf(
    CrosswordPuzzle(
        id = "crossword1",
        title = "Interventional Pulmonology Board Review",
        subtitle = "Interactive crossword • High-yield concepts"
    ),
    CrosswordPuzzle(
        id = "crossword2",
        title = "IP Board Review Crossword",
        subtitle = "Interactive crossword • Mixed topics"
    ),
    CrosswordPuzzle(
        id = "crossword3",
        title = "Interventional & Pleural Crossword",
        subtitle = "Interactive crossword • Interventional + pleural"
    )
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CrosswordListScreen(
    onNavigateBack: () -> Unit,
    onOpenPuzzle: (String) -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Crossword Puzzles") },
                navigationIcon = {
                    TextButton(onClick = onNavigateBack) {
                        Text("Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            items(crosswordPuzzles) { puzzle ->
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    onClick = { onOpenPuzzle(puzzle.id) }
                ) {
                    Column(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        horizontalAlignment = Alignment.Start
                    ) {
                        Text(
                            text = puzzle.title,
                            fontSize = 16.sp,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = puzzle.subtitle,
                            fontSize = 14.sp
                        )
                    }
                }
            }
        }
    }
}

