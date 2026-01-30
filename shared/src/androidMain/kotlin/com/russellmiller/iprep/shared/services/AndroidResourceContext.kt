package com.russellmiller.iprep.shared.services

import android.content.Context

/**
 * Small bridge so shared code can access Android assets/resources without
 * threading Context through every call site.
 */
object SharedAndroidResources {
    fun initialize(context: Context) {
        AndroidContextHolder.set(context.applicationContext)
    }
}

internal object AndroidContextHolder {
    @Volatile
    private var appContext: Context? = null

    fun set(context: Context) {
        appContext = context
    }

    fun get(): Context? = appContext
}

