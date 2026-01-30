package com.russellmiller.iprep.ui.navigation

import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.compose.ui.platform.LocalContext
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import com.russellmiller.iprep.duel.DuelStore
import com.russellmiller.iprep.shared.AppEnvironment
import com.russellmiller.iprep.ui.screens.*

@Composable
fun AppNavigation(navController: NavHostController) {
    val context = LocalContext.current
    val duelStore = remember { DuelStore(context) }
    val appEnvironment = AppEnvironment.shared

    NavHost(
        navController = navController,
        startDestination = "landing"
    ) {
        composable("landing") {
            LandingScreen(
                onNavigateToQuiz = { navController.navigate("quiz") },
                onNavigateToDashboard = { navController.navigate("dashboard") },
                onNavigateToAnalytics = { navController.navigate("analytics") },
                onNavigateToLeaderboard = { navController.navigate("leaderboard") },
                onNavigateToDuel = { navController.navigate("duel_enemy_select") },
                onNavigateToCrosswords = { navController.navigate("crosswords") }
            )
        }
        
        composable("dashboard") {
            DashboardScreen(
                onNavigateBack = { navController.popBackStack() },
                onNavigateToQuiz = { navController.navigate("quiz") },
                onNavigateToAnalytics = { navController.navigate("analytics") }
            )
        }
        
        composable("quiz") {
            QuizScreen(
                onNavigateBack = { navController.popBackStack() },
                onNavigateToReview = { navController.navigate("review") }
            )
        }
        
        composable("review") {
            ReviewScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }
        
        composable("analytics") {
            AnalyticsScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }
        
        composable("leaderboard") {
            LeaderboardScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }

        composable("crosswords") {
            CrosswordListScreen(
                onNavigateBack = { navController.popBackStack() },
                onOpenPuzzle = { puzzleId ->
                    navController.navigate("crossword/$puzzleId")
                }
            )
        }

        composable("crossword/{puzzleId}") { backStackEntry ->
            val puzzleId = backStackEntry.arguments?.getString("puzzleId") ?: return@composable
            CrosswordPuzzleScreen(
                puzzleId = puzzleId,
                onNavigateBack = { navController.popBackStack() }
            )
        }

        composable("settings") {
            SettingsScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }

        composable("duel_enemy_select") {
            EnemySelectScreen(
                duelStore = duelStore,
                onNavigateBack = { navController.popBackStack() },
                onSelectEnemy = { enemyId ->
                    navController.navigate("duel/$enemyId")
                }
            )
        }

        composable("duel/{enemyId}") { backStackEntry ->
            val enemyId = backStackEntry.arguments?.getString("enemyId") ?: return@composable
            DuelScreen(
                enemyId = enemyId,
                duelStore = duelStore,
                appEnvironment = appEnvironment,
                onNavigateBack = { navController.popBackStack() }
            )
        }
    }
}
