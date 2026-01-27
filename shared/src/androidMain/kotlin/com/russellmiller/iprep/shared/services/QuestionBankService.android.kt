package com.russellmiller.iprep.shared.services

internal actual fun platformLoadQuestionBankJson(): String? {
    val classLoader = QuestionBankService::class.java.classLoader ?: return null
    val candidates = listOf(
        "QuestionBank.json",
        "commonMain/resources/QuestionBank.json"
    )

    return candidates.firstNotNullOfOrNull { path ->
        runCatching {
            classLoader.getResourceAsStream(path)?.bufferedReader()?.use { it.readText() }
        }.getOrNull()
    }
}
