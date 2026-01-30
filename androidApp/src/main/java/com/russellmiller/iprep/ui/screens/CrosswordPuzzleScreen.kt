package com.russellmiller.iprep.ui.screens

import android.annotation.SuppressLint
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.viewinterop.AndroidView

private fun crosswordTitle(puzzleId: String): String =
    when (puzzleId) {
        "crossword1" -> "Interventional Pulmonology"
        "crossword2" -> "IP Board Review"
        "crossword3" -> "Interventional & Pleural"
        else -> "Crossword"
    }

@OptIn(ExperimentalMaterial3Api::class)
@SuppressLint("SetJavaScriptEnabled")
@Composable
fun CrosswordPuzzleScreen(
    puzzleId: String,
    onNavigateBack: () -> Unit
) {
    val assetUrl = remember(puzzleId) { "file:///android_asset/$puzzleId.html" }
    val title = remember(puzzleId) { crosswordTitle(puzzleId) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(title) },
                navigationIcon = {
                    TextButton(onClick = onNavigateBack) {
                        Text("Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        AndroidView(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            factory = { context ->
                WebView(context).apply {
                    settings.javaScriptEnabled = true
                    settings.domStorageEnabled = true
                    settings.useWideViewPort = true
                    settings.loadWithOverviewMode = true
                    webViewClient = WebViewClient()
                    loadUrl(assetUrl)
                }
            },
            update = { view ->
                if (view.url != assetUrl) {
                    view.loadUrl(assetUrl)
                }
            }
        )
    }
}
