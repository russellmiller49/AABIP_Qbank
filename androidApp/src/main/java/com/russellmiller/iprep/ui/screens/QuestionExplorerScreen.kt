package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.CheckCircle
import androidx.compose.material.icons.filled.ExpandLess
import androidx.compose.material.icons.filled.ExpandMore
import androidx.compose.material.icons.filled.FilterList
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material.icons.filled.Search
import androidx.compose.material.icons.filled.WarningAmber
import androidx.compose.material3.AssistChip
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FilterChip
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.russellmiller.iprep.shared.AppEnvironment
import com.russellmiller.iprep.shared.models.Module
import com.russellmiller.iprep.shared.models.QuizOption
import com.russellmiller.iprep.shared.models.QuizSessionQuestion

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun QuestionExplorerScreen(
    onNavigateBack: () -> Unit
) {
    val appEnvironment = remember { AppEnvironment.shared }
    val questions = remember { appEnvironment.questionBankService.allSessionQuestions() }
    val modules = remember { appEnvironment.questionBankService.moduleSummaries().sortedBy { it.title } }
    val studyStates by appEnvironment.studyPlannerService.questionStudyStates.collectAsState(initial = emptyMap())

    var query by rememberSaveable { mutableStateOf("") }
    var selectedModuleID by rememberSaveable { mutableStateOf<String?>(null) }
    var dueOnly by rememberSaveable { mutableStateOf(false) }
    var expandedID by rememberSaveable { mutableStateOf<String?>(null) }
    var showModulePicker by rememberSaveable { mutableStateOf(false) }

    val filtered = remember(questions, query, selectedModuleID, dueOnly, studyStates) {
        questions.filter { question ->
            val matchesQuery = query.isBlank() ||
                question.question.prompt.contains(query, ignoreCase = true) ||
                question.module.summary.title.contains(query, ignoreCase = true)
            val matchesModule = selectedModuleID == null || question.module.id == selectedModuleID
            val matchesDue = !dueOnly || (studyStates[question.question.id]?.needsReview == true)
            matchesQuery && matchesModule && matchesDue
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Question Explorer") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(imageVector = Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(onClick = {
                        query = ""
                        selectedModuleID = null
                        dueOnly = false
                    }) {
                        Icon(imageVector = Icons.Default.Refresh, contentDescription = "Reset filters")
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.background
                )
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            verticalArrangement = Arrangement.spacedBy(12.dp),
            contentPadding = androidx.compose.foundation.layout.PaddingValues(16.dp)
        ) {
            item {
                OutlinedTextField(
                    value = query,
                    onValueChange = { query = it },
                    modifier = Modifier.fillMaxWidth(),
                    leadingIcon = {
                        Icon(imageVector = Icons.Default.Search, contentDescription = null)
                    },
                    label = { Text("Search prompt or module") },
                    singleLine = true
                )
            }

            item {
                Card(
                    onClick = { showModulePicker = true },
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 14.dp, vertical = 16.dp),
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(10.dp)
                    ) {
                        Icon(imageVector = Icons.Default.FilterList, contentDescription = null)
                        Column {
                            Text(
                                text = "Module",
                                style = MaterialTheme.typography.labelMedium,
                                color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.72f)
                            )
                            Text(
                                text = selectedModuleText(modules, selectedModuleID),
                                style = MaterialTheme.typography.bodyLarge
                            )
                        }
                    }
                }
            }

            item {
                FilterChip(
                    selected = dueOnly,
                    onClick = { dueOnly = !dueOnly },
                    label = { Text("Due for review only") },
                    leadingIcon = {
                        if (dueOnly) {
                            Icon(
                                imageVector = Icons.Default.WarningAmber,
                                contentDescription = null,
                                modifier = Modifier.padding(end = 2.dp)
                            )
                        }
                    }
                )
            }

            item {
                Text(
                    text = "${filtered.size} results",
                    style = MaterialTheme.typography.labelLarge,
                    color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.72f)
                )
            }

            if (filtered.isEmpty()) {
                item {
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.surface
                        )
                    ) {
                        Text(
                            text = "No matches found. Try broadening your filters.",
                            modifier = Modifier.padding(16.dp),
                            style = MaterialTheme.typography.bodyLarge
                        )
                    }
                }
            } else {
                items(filtered, key = { it.question.id }) { question ->
                    val state = studyStates[question.question.id]
                    QuestionExplorerCard(
                        question = question,
                        dueForReview = state?.needsReview == true,
                        isExpanded = expandedID == question.question.id,
                        onToggleExpanded = {
                            expandedID = if (expandedID == question.question.id) null else question.question.id
                        }
                    )
                }
            }
        }
    }

    if (showModulePicker) {
        ModalBottomSheet(
            onDismissRequest = { showModulePicker = false },
            containerColor = MaterialTheme.colorScheme.surface
        ) {
            LazyColumn(
                modifier = Modifier.fillMaxWidth(),
                contentPadding = androidx.compose.foundation.layout.PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                item {
                    Text(
                        text = "Choose Module",
                        style = MaterialTheme.typography.titleLarge,
                        modifier = Modifier.padding(bottom = 8.dp)
                    )
                }
                item {
                    Card(
                        onClick = {
                            selectedModuleID = null
                            showModulePicker = false
                        },
                        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                    ) {
                        Text(
                            text = "All modules",
                            style = MaterialTheme.typography.bodyLarge,
                            modifier = Modifier.padding(14.dp)
                        )
                    }
                }
                items(modules, key = { it.id }) { module ->
                    Card(
                        onClick = {
                            selectedModuleID = module.id
                            showModulePicker = false
                        },
                        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                    ) {
                        Text(
                            text = module.title,
                            style = MaterialTheme.typography.bodyLarge,
                            modifier = Modifier.padding(14.dp)
                        )
                    }
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun QuestionExplorerCard(
    question: QuizSessionQuestion,
    dueForReview: Boolean,
    isExpanded: Boolean,
    onToggleExpanded: () -> Unit
) {
    Card(
        onClick = onToggleExpanded,
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(18.dp),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(10.dp)
        ) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Text(
                    text = question.module.summary.title,
                    style = MaterialTheme.typography.labelLarge,
                    color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.72f),
                    modifier = Modifier.weight(1f)
                )
                if (dueForReview) {
                    AssistChip(
                        onClick = {},
                        enabled = false,
                        label = { Text("Due") },
                        leadingIcon = {
                            Icon(
                                imageVector = Icons.Default.WarningAmber,
                                contentDescription = null,
                                modifier = Modifier.padding(end = 1.dp)
                            )
                        }
                    )
                }
            }

            Text(
                text = question.question.prompt,
                style = MaterialTheme.typography.titleMedium,
                maxLines = if (isExpanded) Int.MAX_VALUE else 3,
                overflow = TextOverflow.Ellipsis,
                color = MaterialTheme.colorScheme.onSurface
            )

            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Text(
                    text = "Q${question.question.number}",
                    style = MaterialTheme.typography.labelMedium,
                    color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.7f)
                )
                Icon(
                    imageVector = if (isExpanded) Icons.Default.ExpandLess else Icons.Default.ExpandMore,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.7f)
                )
                Text(
                    text = if (isExpanded) "Collapse" else "Expand",
                    style = MaterialTheme.typography.labelMedium,
                    color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.7f)
                )
            }

            if (isExpanded) {
                Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                    question.question.options.forEach { option ->
                        ExplorerOptionRow(
                            option = option,
                            isCorrect = option.id == question.question.correctOptionId
                        )
                    }

                    if (question.question.explanation.isNotBlank()) {
                        Text(
                            text = "Explanation",
                            style = MaterialTheme.typography.titleSmall,
                            fontWeight = FontWeight.SemiBold
                        )
                        Text(
                            text = question.question.explanation,
                            style = MaterialTheme.typography.bodyMedium
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun ExplorerOptionRow(option: QuizOption, isCorrect: Boolean) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        verticalAlignment = Alignment.Top,
        horizontalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        Text(
            text = option.id.uppercase(),
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.8f)
        )
        Text(
            text = option.text,
            style = MaterialTheme.typography.bodyMedium,
            modifier = Modifier.weight(1f)
        )
        if (isCorrect) {
            Icon(
                imageVector = Icons.Default.CheckCircle,
                contentDescription = "Correct",
                tint = Color(0xFF3C9E46)
            )
        }
    }
}

private fun selectedModuleText(modules: List<Module>, selectedModuleID: String?): String {
    if (selectedModuleID == null) return "All modules"
    return modules.firstOrNull { it.id == selectedModuleID }?.title ?: "All modules"
}
