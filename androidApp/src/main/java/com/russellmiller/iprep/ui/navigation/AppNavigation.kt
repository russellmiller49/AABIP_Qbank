package com.russellmiller.iprep.ui.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import com.russellmiller.iprep.ui.screens.*

@Composable
fun AppNavigation(navController: NavHostController) {
    NavHost(
        navController = navController,
        startDestination = "landing"
    ) {
        composable("landing") {
            LandingScreen(
                onNavigateToQuiz = { navController.navigate("quiz") },
                onNavigateToDashboard = { navController.navigate("dashboard") },
                onNavigateToAnalytics = { navController.navigate("analytics") },
                onNavigateToLeaderboard = { navController.navigate("leaderboard") }
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
        
        composable("settings") {
            SettingsScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }
    }
}
