package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.wrapContentHeight
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.ArrowBack
import androidx.compose.material.icons.outlined.FilterList
import androidx.compose.material.icons.outlined.Search
import androidx.compose.material3.AssistChip
import androidx.compose.material3.AssistChipDefaults
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.russellmiller.iprep.shared.models.Module
import com.russellmiller.iprep.shared.models.QuizSessionQuestion
import com.russellmiller.iprep.ui.IprepAppViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun QuestionExplorerScreen(
    appViewModel: IprepAppViewModel,
    onNavigateBack: () -> Unit
) {
    val modules = appViewModel.moduleSummaries
    val allQuestions = remember { appViewModel.questionBank.allSessionQuestions() }

    var searchQuery by remember { mutableStateOf("") }
    var selectedModuleId by remember { mutableStateOf<String?>(null) }
    var selectedQuestion by remember { mutableStateOf<QuizSessionQuestion?>(null) }

    val filteredQuestions = remember(searchQuery, selectedModuleId, allQuestions) {
        allQuestions.filter { sessionQuestion ->
            val matchesModule = selectedModuleId?.let { sessionQuestion.module.summary.id == it } ?: true
            val matchesQuery = searchQuery.isBlank() ||
                sessionQuestion.question.prompt.contains(searchQuery, ignoreCase = true) ||
                sessionQuestion.module.summary.title.contains(searchQuery, ignoreCase = true)
            matchesModule && matchesQuery
        }
    }

    Scaffold(
        topBar = {
            Surface(color = MaterialTheme.colorScheme.primary) {
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp, vertical = 20.dp),
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            IconButton(onClick = onNavigateBack) {
                                Icon(
                                    imageVector = Icons.Outlined.ArrowBack,
                                    contentDescription = "Back",
                                    tint = Color.White
                                )
                            }
                            Text(
                                text = "Question Explorer",
                                style = MaterialTheme.typography.titleLarge.copy(
                                    color = Color.White,
                                    fontWeight = FontWeight.SemiBold
                                )
                            )
                        }
                        Icon(
                            imageVector = Icons.Outlined.FilterList,
                            contentDescription = null,
                            tint = Color.White.copy(alpha = 0.7f)
                        )
                    }

        OutlinedTextField(
            value = searchQuery,
            onValueChange = { searchQuery = it },
            modifier = Modifier.fillMaxWidth(),
            singleLine = true,
                        leadingIcon = {
                            Icon(
                                imageVector = Icons.Outlined.Search,
                                contentDescription = null
                            )
                        },
                        placeholder = { Text("Search prompts, modules, keywords") },
                        shape = RoundedCornerShape(24.dp)
                    )

                    ModuleFilterRow(
                        modules = modules,
                        selectedModuleId = selectedModuleId,
                        onModuleSelected = { id ->
                            selectedModuleId = if (id == null) null else if (selectedModuleId == id) null else id
                        }
                    )
                }
            }
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(horizontal = 20.dp, vertical = 20.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            items(filteredQuestions) { item ->
                QuestionExplorerRow(
                    question = item,
                    onClick = { selectedQuestion = item }
                )
            }
        }
    }

    if (selectedQuestion != null) {
        ModalBottomSheet(onDismissRequest = { selectedQuestion = null }) {
            QuestionDetailSheet(
                question = selectedQuestion!!,
                onDismiss = { selectedQuestion = null }
            )
        }
    }
}

@Composable
private fun ModuleFilterRow(
    modules: List<Module>,
    selectedModuleId: String?,
    onModuleSelected: (String?) -> Unit
) {
    LazyRow(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        item {
            AssistChip(
                onClick = { onModuleSelected(null) },
                label = { Text("All") },
                shape = CircleShape,
                colors = AssistChipDefaults.assistChipColors(
                    containerColor = if (selectedModuleId == null) MaterialTheme.colorScheme.secondaryContainer else MaterialTheme.colorScheme.surfaceVariant
                )
            )
        }

        items(modules) { module ->
            val selected = selectedModuleId == module.id
            AssistChip(
                onClick = { onModuleSelected(module.id) },
                label = { Text(module.title.split(" ").take(2).joinToString(" ")) },
                shape = CircleShape,
                colors = AssistChipDefaults.assistChipColors(
                    containerColor = if (selected) MaterialTheme.colorScheme.secondaryContainer else MaterialTheme.colorScheme.surfaceVariant
                )
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun QuestionExplorerRow(
    question: QuizSessionQuestion,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .wrapContentHeight(),
        shape = RoundedCornerShape(24.dp),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp),
        onClick = onClick
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(18.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Text(
                text = question.module.summary.title,
                style = MaterialTheme.typography.labelMedium.copy(color = MaterialTheme.colorScheme.primary)
            )
            Text(
                text = question.question.prompt,
                style = MaterialTheme.typography.titleMedium,
                maxLines = 3,
                overflow = TextOverflow.Ellipsis
            )
            Text(
                text = "${question.question.options.size} answer choices • #${question.question.number}",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun QuestionDetailSheet(
    question: QuizSessionQuestion,
    onDismiss: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 24.dp, vertical = 24.dp),
        verticalArrangement = Arrangement.spacedBy(18.dp)
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = question.module.summary.title,
                style = MaterialTheme.typography.titleMedium
            )
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        }

        Text(
            text = question.question.prompt,
            style = MaterialTheme.typography.bodyLarge
        )

        Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
            Text(
                text = "Answer Choices",
                style = MaterialTheme.typography.titleSmall.copy(fontWeight = FontWeight.SemiBold)
            )
            question.question.options.forEach { option ->
                Surface(
                    modifier = Modifier.fillMaxWidth(),
                    color = MaterialTheme.colorScheme.surfaceVariant,
                    shape = RoundedCornerShape(14.dp)
                ) {
                    Text(
                        text = "${option.id.uppercase()}. ${option.text}",
                        modifier = Modifier.padding(horizontal = 16.dp, vertical = 12.dp),
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
            }
        }

        Text(
            text = "Explanation",
            style = MaterialTheme.typography.titleSmall.copy(fontWeight = FontWeight.SemiBold)
        )
        Text(
            text = question.question.explanation,
            style = MaterialTheme.typography.bodyMedium
        )

        if (question.question.references.isNotEmpty()) {
            Column(verticalArrangement = Arrangement.spacedBy(6.dp)) {
                Text(
                    text = "References",
                    style = MaterialTheme.typography.titleSmall.copy(fontWeight = FontWeight.SemiBold)
                )
                question.question.references.forEach { reference ->
                    Text(
                        text = "• $reference",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }

        Spacer(modifier = Modifier.height(12.dp))
    }
}
