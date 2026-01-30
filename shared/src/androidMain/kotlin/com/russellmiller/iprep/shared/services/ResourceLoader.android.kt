package com.russellmiller.iprep.shared.services

internal actual fun loadQuestionBankJson(): String? {
    val context = AndroidContextHolder.get() ?: return null
    return runCatching {
        context.assets.open("QuestionBank.json").bufferedReader().use { it.readText() }
    }.getOrNull()
}
