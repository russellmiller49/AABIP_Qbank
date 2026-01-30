package com.russellmiller.iprep.shared.assets

import com.russellmiller.iprep.shared.services.AndroidContextHolder

internal actual fun loadAssetsManifestJson(): String? {
    val context = AndroidContextHolder.get() ?: return null
    return runCatching {
        context.assets.open("assets/manifest/assets_manifest.json").bufferedReader().use { it.readText() }
    }.getOrNull()
}

