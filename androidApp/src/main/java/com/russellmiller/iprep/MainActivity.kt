package com.russellmiller.iprep

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.ui.Modifier
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.compose.rememberNavController
import com.russellmiller.iprep.shared.services.QuestionBankDataRegistry
import com.russellmiller.iprep.ui.IprepAppViewModel
import com.russellmiller.iprep.ui.navigation.AppNavigation
import com.russellmiller.iprep.ui.theme.IprepTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        QuestionBankDataRegistry.register {
            runCatching {
                assets.open("QuestionBank.json").bufferedReader().use { it.readText() }
            }.getOrNull()
        }

        setContent {
            IprepTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    val navController = rememberNavController()
                    val appViewModel: IprepAppViewModel = viewModel()
                    AppNavigation(
                        navController = navController,
                        appViewModel = appViewModel
                    )
                }
            }
        }
    }
}
