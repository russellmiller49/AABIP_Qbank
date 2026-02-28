package com.russellmiller.iprep.ui.navigation

import android.net.Uri
import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.compose.ui.platform.LocalContext
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import com.russellmiller.iprep.duel.DuelStore
import com.russellmiller.iprep.shared.AppEnvironment
import com.russellmiller.iprep.shared.models.QuizMode
import com.russellmiller.iprep.ui.screens.AnalyticsScreen
import com.russellmiller.iprep.ui.screens.CrosswordListScreen
import com.russellmiller.iprep.ui.screens.CrosswordPuzzleScreen
import com.russellmiller.iprep.ui.screens.DashboardScreen
import com.russellmiller.iprep.ui.screens.DuelScreen
import com.russellmiller.iprep.ui.screens.EnemySelectScreen
import com.russellmiller.iprep.ui.screens.LandingScreen
import com.russellmiller.iprep.ui.screens.LeaderboardScreen
import com.russellmiller.iprep.ui.screens.QuestionExplorerScreen
import com.russellmiller.iprep.ui.screens.QuizScreen
import com.russellmiller.iprep.ui.screens.ReviewScreen
import com.russellmiller.iprep.ui.screens.SettingsScreen

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
                onStartPractice = { navController.navigate("quiz/quick/false") },
                onContinueSession = { navController.navigate("quiz/quick/true") },
                onShowProgress = { navController.navigate("analytics") },
                onShowDashboard = { navController.navigate("dashboard") },
                onSelectModule = { module ->
                    navController.navigate("quiz/module/${module.id}/${Uri.encode(module.title)}")
                },
                onRetryIncorrect = { navController.navigate("quiz/incorrect") },
                onShowQuestionExplorer = { navController.navigate("question_explorer") },
                onShowCrosswords = { navController.navigate("crosswords") },
                onShowLeaderboard = { navController.navigate("leaderboard") },
                onShowDuel = { navController.navigate("duel_enemy_select") }
            )
        }

        composable("dashboard") {
            DashboardScreen(
                onNavigateBack = { navController.popBackStack() },
                onQuickStart = { navController.navigate("quiz/quick/false") },
                onContinueQuiz = { navController.navigate("quiz/quick/true") },
                onOpenModule = { module ->
                    navController.navigate("quiz/module/${module.id}/${Uri.encode(module.title)}")
                },
                onNavigateToAnalytics = { navController.navigate("analytics") },
                onNavigateToReview = { navController.navigate("review") },
                onNavigateToSettings = { navController.navigate("settings") },
                onNavigateToQuestionExplorer = { navController.navigate("question_explorer") }
            )
        }

        composable("quiz") {
            QuizScreen(
                onNavigateBack = { navController.popBackStack() },
                onNavigateToReview = { navController.navigate("review") },
                mode = QuizMode.QuickStart(resume = false)
            )
        }

        composable("quiz/quick/{resume}") { backStackEntry ->
            val resume = backStackEntry.arguments?.getString("resume").equals("true", ignoreCase = true)
            QuizScreen(
                onNavigateBack = { navController.popBackStack() },
                onNavigateToReview = { navController.navigate("review") },
                mode = QuizMode.QuickStart(resume = resume)
            )
        }

        composable("quiz/module/{moduleId}/{moduleTitle}") { backStackEntry ->
            val moduleId = backStackEntry.arguments?.getString("moduleId") ?: return@composable
            val moduleTitle = Uri.decode(backStackEntry.arguments?.getString("moduleTitle") ?: "Module")
            QuizScreen(
                onNavigateBack = { navController.popBackStack() },
                onNavigateToReview = { navController.navigate("review") },
                mode = QuizMode.Module(id = moduleId, title = moduleTitle)
            )
        }

        composable("quiz/incorrect") {
            QuizScreen(
                onNavigateBack = { navController.popBackStack() },
                onNavigateToReview = { navController.navigate("review") },
                mode = QuizMode.IncorrectOnly
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

        composable("question_explorer") {
            QuestionExplorerScreen(
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
