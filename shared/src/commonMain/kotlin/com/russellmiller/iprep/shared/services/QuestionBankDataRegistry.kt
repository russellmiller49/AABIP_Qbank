package com.russellmiller.iprep.shared.services

object QuestionBankDataRegistry {
    private var provider: (() -> String?)? = null

    fun register(provider: () -> String?) {
        this.provider = provider
    }

    fun load(): String? = try {
        provider?.invoke()
    } catch (_: Throwable) {
        null
    }
}
