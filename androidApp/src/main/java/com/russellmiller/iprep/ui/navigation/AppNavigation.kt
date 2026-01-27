package com.russellmiller.iprep.ui.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import com.russellmiller.iprep.ui.IprepAppViewModel
import com.russellmiller.iprep.ui.screens.*

@Composable
fun AppNavigation(
    navController: NavHostController,
    appViewModel: IprepAppViewModel
) {
    NavHost(
        navController = navController,
        startDestination = "landing"
    ) {
        composable("landing") {
            LandingScreen(
                appViewModel = appViewModel,
                onNavigateToQuiz = { navController.navigate("quiz") },
                onNavigateToDashboard = { navController.navigate("dashboard") },
                onNavigateToAnalytics = { navController.navigate("analytics") },
                onNavigateToLeaderboard = { navController.navigate("leaderboard") },
                onNavigateToReview = { navController.navigate("review") },
                onNavigateToExplorer = { navController.navigate("explorer") },
                onNavigateToSettings = { navController.navigate("settings") }
            )
        }
        
        composable("dashboard") {
            DashboardScreen(
                appViewModel = appViewModel,
                onNavigateBack = { navController.popBackStack() },
                onNavigateToQuiz = { navController.navigate("quiz") },
                onNavigateToAnalytics = { navController.navigate("analytics") }
            )
        }
        
        composable("quiz") {
            QuizScreen(
                appViewModel = appViewModel,
                onNavigateBack = { navController.popBackStack() },
                onNavigateToReview = { navController.navigate("review") }
            )
        }
        
        composable("review") {
            ReviewScreen(
                appViewModel = appViewModel,
                onNavigateBack = { navController.popBackStack() }
            )
        }
        
        composable("analytics") {
            AnalyticsScreen(
                appViewModel = appViewModel,
                onNavigateBack = { navController.popBackStack() }
            )
        }

        composable("explorer") {
            QuestionExplorerScreen(
                appViewModel = appViewModel,
                onNavigateBack = { navController.popBackStack() }
            )
        }

        composable("leaderboard") {
            LeaderboardScreen(
                appViewModel = appViewModel,
                onNavigateBack = { navController.popBackStack() }
            )
        }
        
        composable("settings") {
            SettingsScreen(
                appViewModel = appViewModel,
                onNavigateBack = { navController.popBackStack() }
            )
        }
    }
}
