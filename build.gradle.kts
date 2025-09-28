// Top-level build file where you can add configuration options common to all sub-projects/modules.
plugins {
    id("com.android.application") version "8.13.0" apply false
    id("org.jetbrains.kotlin.multiplatform") version "1.9.20" apply false
    id("org.jetbrains.kotlin.plugin.serialization") version "1.9.20" apply false
    id("app.cash.sqldelight") version "2.0.0" apply false
}

tasks.register("clean", Delete::class) {
    delete(layout.buildDirectory)
}
