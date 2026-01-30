package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Lock
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.russellmiller.iprep.duel.DuelStore
import com.russellmiller.iprep.shared.models.Enemy
import com.russellmiller.iprep.shared.models.EnemyDefinitions
import com.russellmiller.iprep.shared.models.PlayerProfile

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnemySelectScreen(
    duelStore: DuelStore,
    onNavigateBack: () -> Unit,
    onSelectEnemy: (String) -> Unit
) {
    val profile = duelStore.data.playerProfile
    val enemies = EnemyDefinitions.allEnemies

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Clinical Duel") },
                navigationIcon = {
                    TextButton(onClick = onNavigateBack) { Text("Back") }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Text("Choose your opponent", style = MaterialTheme.typography.titleLarge)
            Text("Level ${profile.level} • ${profile.xp} XP", style = MaterialTheme.typography.bodyMedium)

            LazyVerticalGrid(
                columns = GridCells.Adaptive(minSize = 160.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp),
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                modifier = Modifier.fillMaxSize()
            ) {
                items(enemies, key = { it.id }) { enemy ->
                    EnemyCard(
                        enemy = enemy,
                        profile = profile,
                        onClick = { onSelectEnemy(enemy.id) }
                    )
                }
            }
        }
    }
}

@Composable
@OptIn(ExperimentalMaterial3Api::class)
private fun EnemyCard(
    enemy: Enemy,
    profile: PlayerProfile,
    onClick: () -> Unit
) {
    val unlocked = enemy.isUnlocked(profile)
    val reason = enemy.lockReason(profile)

    Card(
        modifier = Modifier.fillMaxWidth(),
        onClick = { if (unlocked) onClick() },
        enabled = unlocked
    ) {
        Column(
            modifier = Modifier.padding(14.dp),
            verticalArrangement = Arrangement.spacedBy(6.dp)
        ) {
            Text(enemy.name, style = MaterialTheme.typography.titleMedium)
            Text(enemy.title, style = MaterialTheme.typography.bodyMedium, color = MaterialTheme.colorScheme.onSurfaceVariant)
            Spacer(Modifier.height(4.dp))
            Text(enemy.description, style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
            if (!unlocked && reason != null) {
                Spacer(Modifier.height(6.dp))
                Text(reason, style = MaterialTheme.typography.labelMedium, color = MaterialTheme.colorScheme.onSurfaceVariant)
            }
            if (!unlocked) {
                Spacer(Modifier.height(8.dp))
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(6.dp)
                ) {
                    Icon(imageVector = Icons.Filled.Lock, contentDescription = null)
                    Text("Locked", style = MaterialTheme.typography.labelMedium)
                }
            }
        }
    }
}
