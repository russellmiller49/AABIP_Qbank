package com.russellmiller.iprep.shared.services

internal actual fun loadPearlDiverJson(): String? {
    val context = AndroidContextHolder.get() ?: return null
    return runCatching {
        context.assets.open("pearl_diver_cards.json").bufferedReader().use { it.readText() }
    }.getOrNull()
}

