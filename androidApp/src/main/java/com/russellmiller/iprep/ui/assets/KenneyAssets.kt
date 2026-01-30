package com.russellmiller.iprep.ui.assets

import android.content.Context
import android.graphics.BitmapFactory
import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.compose.ui.graphics.ImageBitmap
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.platform.LocalContext
import com.russellmiller.iprep.shared.assets.tryLoadAssetRegistry

@Composable
fun rememberKenneyImageBitmap(id: String): ImageBitmap? {
    val context = LocalContext.current
    val registry = remember { tryLoadAssetRegistry() }
    val path = remember(id) { registry?.tryPath(id) }
    return remember(path) { loadBitmap(context, path) }
}

private fun loadBitmap(context: Context, path: String?): ImageBitmap? {
    if (path.isNullOrBlank()) return null
    return runCatching {
        context.assets.open(path).use { input ->
            BitmapFactory.decodeStream(input)?.asImageBitmap()
        }
    }.getOrNull()
}

