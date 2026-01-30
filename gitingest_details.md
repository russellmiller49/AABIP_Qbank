# AABIP_Qbank — gitingest (details)

Generated: `2026-01-29T09:11:19-08:00`
Git: `unified` @ `7af7a7b`

## What this file is
- A **second** document you can provide to an LLM when more detail is needed.
- Focuses on **text-readable** code/docs and skips binaries, oversized files, and build artifacts.

## Selection settings
- Include dirs: `shared/src/, androidApp/src/main/, iosApp/iprep/, iosApp/iprepTests/, iosApp/iprepUITests/, docs/`
- Include extensions: `.json`, `.kt`, `.kts`, `.md`, `.plist`, `.properties`, `.sh`, `.swift`, `.txt`, `.xcconfig`, `.xml`, `.yaml`, `.yml`
- Max file size: `200000` bytes
- Inline mode: `curated`
- Inline cap (files): `100`

## Manifest (filtered candidates)

```
       82  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/util/Time.kt
      100  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/DuelResourceLoader.kt
      101  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/ResourceLoader.kt
      111  shared/src/androidMain/kotlin/com/russellmiller/iprep/shared/util/Time.kt
      198  shared/src/commonMain/kotlin/qbank/bridge/Greeter.kt
      296  shared/src/androidMain/kotlin/com/russellmiller/iprep/shared/services/ResourceLoader.android.kt
      300  shared/src/androidMain/kotlin/com/russellmiller/iprep/shared/services/DuelResourceLoader.android.kt
      319  shared/src/iosMain/kotlin/com/russellmiller/iprep/shared/util/Time.kt
      385  shared/src/androidMain/kotlin/com/russellmiller/iprep/shared/assets/AssetRegistry.android.kt
      557  shared/src/androidMain/kotlin/com/russellmiller/iprep/shared/services/AndroidResourceContext.kt
      569  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/FeatureFlag.kt
      610  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/AppRoute.kt
      925  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/QuizQuestion.kt
     1232  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/AppEnvironment.kt
     1279  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/QuestionStudyState.kt
     1280  shared/src/iosMain/kotlin/com/russellmiller/iprep/shared/services/ResourceLoader.ios.kt
     1284  shared/src/iosMain/kotlin/com/russellmiller/iprep/shared/services/DuelResourceLoader.ios.kt
     1364  shared/src/iosMain/kotlin/com/russellmiller/iprep/shared/assets/AssetRegistry.ios.kt
     1534  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/Module.kt
     1546  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/assets/AssetRegistry.kt
     1626  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/QuizSession.kt
     1647  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/DuelPersistence.kt
     3075  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/EnemyDefinitions.kt
     3717  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/DuelQuestionBankService.kt
     4229  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/FeatureFlagsService.kt
     4520  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/StudyPlannerService.kt
     5074  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/QuizSessionService.kt
     5586  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/DuelModels.kt
     6022  shared/src/commonMain/resources/assets/manifest/assets_manifest.json
     9401  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/DuelEngineService.kt
     9810  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/QuestionBankService.kt
    10013  shared/src/commonTest/kotlin/com/russellmiller/iprep/shared/services/DuelEngineServiceTest.kt
       68  androidApp/src/main/res/values/strings.xml
      143  androidApp/src/main/res/xml/backup_rules.xml
      288  androidApp/src/main/java/com/russellmiller/iprep/ui/theme/Color.kt
      382  androidApp/src/main/res/xml/data_extraction_rules.xml
      424  androidApp/src/main/res/values/themes.xml
      806  androidApp/src/main/AndroidManifest.xml
      969  androidApp/src/main/java/com/russellmiller/iprep/ui/assets/KenneyAssets.kt
      993  androidApp/src/main/java/com/russellmiller/iprep/ui/theme/Type.kt
     1135  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/SettingsScreen.kt
     1138  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/AnalyticsScreen.kt
     1144  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/LeaderboardScreen.kt
     1158  androidApp/src/main/java/com/russellmiller/iprep/MainActivity.kt
     1682  androidApp/src/main/java/com/russellmiller/iprep/duel/DuelStore.kt
     2191  androidApp/src/main/java/com/russellmiller/iprep/ui/theme/Theme.kt
     2259  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/CrosswordPuzzleScreen.kt
     3049  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/ReviewScreen.kt
     3246  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/CrosswordListScreen.kt
     3839  androidApp/src/main/java/com/russellmiller/iprep/ui/navigation/AppNavigation.kt
     3913  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/EnemySelectScreen.kt
     4234  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/DashboardScreen.kt
     6713  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/QuizScreen.kt
     7331  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/LandingScreen.kt
    30762  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/DuelScreen.kt
   103748  androidApp/src/main/assets/pearl_diver_cards.json
       50  iosApp/iprep/Persistence/PersistencePlaceholder.swift
       63  iosApp/iprep/Assets.xcassets/Contents.json
       80  iosApp/iprep/Services/QuestionStudyState 2.swift
      123  iosApp/iprep/Assets.xcassets/AccentColor.colorset/Contents.json
      232  iosApp/iprep/Models/FeatureFlagKey.swift
      232  iosApp/iprep/Support/Bundle+Module.swift
      307  iosApp/iprep/Assets.xcassets/AABIPLogo.imageset/Contents.json
      370  iosApp/iprep/Components/Typography.swift
      414  iosApp/iprep/Components/Color+Theme.swift
      476  iosApp/iprep/Resources/RemoteConfigDefaults.plist
      485  iosApp/iprep/Models/AppRoute.swift
      586  iosApp/iprep/Services/SyncManager.swift
      605  iosApp/iprep/iprepApp.swift
      608  iosApp/iprep/Models/Module.swift
      695  iosApp/iprep/Assets.xcassets/Accent.colorset/Contents.json
      695  iosApp/iprep/Assets.xcassets/Background.colorset/Contents.json
      695  iosApp/iprep/Assets.xcassets/MutedAccent.colorset/Contents.json
      695  iosApp/iprep/Assets.xcassets/Surface.colorset/Contents.json
      695  iosApp/iprep/Assets.xcassets/SurfaceElevated.colorset/Contents.json
      715  iosApp/iprep/Models/QuizQuestion.swift
      792  iosApp/iprep/Services/StorageService.swift
      809  iosApp/iprep/Models/QuizSessionConfiguration.swift
      849  iosApp/iprep/Services/AuthService.swift
      955  iosApp/iprepTests/QuizViewModelTests.swift
     1102  iosApp/iprep/Features/Landing/ModulePickerView.swift
     1123  iosApp/iprepTests/ServicesTests.swift
     1137  iosApp/iprepTests/ReviewViewCrashTests.swift
     1183  iosApp/iprepTests/iprepTests.swift
     1276  iosApp/iprepUITests/iprepUITests.swift
     1298  iosApp/iprep/Services/FeatureFlags.swift
     1396  iosApp/iprep/Features/Settings/SettingsView.swift
     1476  iosApp/iprep/Features/Crosswords/CrosswordPuzzleView.swift
     1506  iosApp/iprepTests/ReviewViewCrashFixTests.swift
     1513  iosApp/iprep/Services/FirestoreService.swift
     1606  iosApp/iprepUITests/DashboardUITests.swift
     1697  iosApp/iprep/Info.plist
     1730  iosApp/iprepTests/ModelsTests.swift
     1901  iosApp/iprep/Services/MediaCache.swift
     1952  iosApp/iprep/Features/Crosswords/CrosswordsView.swift
     2021  iosApp/iprep/Components/ModuleCard.swift
     2055  iosApp/iprep/Models/QuizQuestion+Search.swift
     2246  iosApp/iprep/Assets.xcassets/AppIcon.appiconset/Contents.json
     2303  iosApp/iprep/Services/QuestionBankService.swift
     2478  iosApp/iprep/Services/DuelStore.swift
     2500  iosApp/iprep/Services/FlowPublisher.swift
     2584  iosApp/iprep/Services/RemoteConfigService.swift
     3626  iosApp/iprep/Models/QuestionStudyState.swift
     3994  iosApp/iprep/Support/KenneyAssets.swift
     4008  iosApp/iprep/Services/LeaderboardService.swift
     4195  iosApp/iprep/Services/QuestionStudyState.swift
     4712  iosApp/iprep/Features/Duel/EnemySelectView.swift
     4993  iosApp/iprep/ContentView.swift
     5131  iosApp/iprep/Services/StudyPlanner.swift
     5224  iosApp/iprep/Features/Duel/DuelViewModel.swift
     5234  iosApp/iprep/Features/Leaderboard/LeaderboardView.swift
     5263  iosApp/iprep/Models/QuizSessionState.swift
     7244  iosApp/iprep/Services/LocalStore.swift
     9423  iosApp/iprep/Features/Dashboard/DashboardView.swift
    12171  iosApp/iprep/Features/Analytics/ProgressReportView.swift
    12312  iosApp/iprep/AppEnvironment.swift
    12562  iosApp/iprep/Features/Landing/LandingView.swift
    12963  iosApp/iprep/Features/Analytics/AnalyticsView.swift
    13004  iosApp/iprep/Features/Review/ReviewView.swift
    14602  iosApp/iprep/Features/Search/QuestionExplorerView.swift
    17279  iosApp/iprep/Features/Duel/Components/DuelArenaView.swift
    17440  iosApp/iprep/Features/Quiz/QuizViewModel.swift
    25321  iosApp/iprep/Features/Duel/DuelView.swift
    37912  iosApp/iprep/Features/Quiz/QuizView.swift
    11186  docs/ARCHITECTURE.md
```

## Skipped (reason)

```
     too_large>200000B  shared/src/commonMain/resources/QuestionBank.json
inline_cap_reached>100  iosApp/iprep/Features/Search/QuestionExplorerView.swift
inline_cap_reached>100  iosApp/iprep/Features/Duel/Components/DuelArenaView.swift
inline_cap_reached>100  iosApp/iprep/Features/Quiz/QuizViewModel.swift
inline_cap_reached>100  iosApp/iprep/Features/Duel/DuelView.swift
inline_cap_reached>100  iosApp/iprep/Features/Quiz/QuizView.swift
inline_cap_reached>100  docs/ARCHITECTURE.md
```

## Inlined file contents

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/util/Time.kt`
- Size: `82` bytes
```
package com.russellmiller.iprep.shared.util

expect fun currentTimeMillis(): Long

```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/DuelResourceLoader.kt`
- Size: `100` bytes
```
package com.russellmiller.iprep.shared.services

internal expect fun loadPearlDiverJson(): String?


```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/ResourceLoader.kt`
- Size: `101` bytes
```
package com.russellmiller.iprep.shared.services

internal expect fun loadQuestionBankJson(): String?

```

---
### `shared/src/androidMain/kotlin/com/russellmiller/iprep/shared/util/Time.kt`
- Size: `111` bytes
```
package com.russellmiller.iprep.shared.util

actual fun currentTimeMillis(): Long = System.currentTimeMillis()

```

---
### `shared/src/commonMain/kotlin/qbank/bridge/Greeter.kt`
- Size: `198` bytes
```
package qbank.bridge

/**
 * Simple Kotlin entry point exposed to Swift to validate the shared module wiring.
 */
class Greeter {
    fun hello(name: String): String = "Hello, $name from Kotlin!"
}

```

---
### `shared/src/androidMain/kotlin/com/russellmiller/iprep/shared/services/ResourceLoader.android.kt`
- Size: `296` bytes
```
package com.russellmiller.iprep.shared.services

internal actual fun loadQuestionBankJson(): String? {
    val context = AndroidContextHolder.get() ?: return null
    return runCatching {
        context.assets.open("QuestionBank.json").bufferedReader().use { it.readText() }
    }.getOrNull()
}

```

---
### `shared/src/androidMain/kotlin/com/russellmiller/iprep/shared/services/DuelResourceLoader.android.kt`
- Size: `300` bytes
```
package com.russellmiller.iprep.shared.services

internal actual fun loadPearlDiverJson(): String? {
    val context = AndroidContextHolder.get() ?: return null
    return runCatching {
        context.assets.open("pearl_diver_cards.json").bufferedReader().use { it.readText() }
    }.getOrNull()
}


```

---
### `shared/src/iosMain/kotlin/com/russellmiller/iprep/shared/util/Time.kt`
- Size: `319` bytes
```
package com.russellmiller.iprep.shared.util

import kotlinx.cinterop.ExperimentalForeignApi
import platform.Foundation.NSDate
import platform.Foundation.timeIntervalSince1970

@OptIn(ExperimentalForeignApi::class)
actual fun currentTimeMillis(): Long {
    return (NSDate().timeIntervalSince1970() * 1000.0).toLong()
}

```

---
### `shared/src/androidMain/kotlin/com/russellmiller/iprep/shared/assets/AssetRegistry.android.kt`
- Size: `385` bytes
```
package com.russellmiller.iprep.shared.assets

import com.russellmiller.iprep.shared.services.AndroidContextHolder

internal actual fun loadAssetsManifestJson(): String? {
    val context = AndroidContextHolder.get() ?: return null
    return runCatching {
        context.assets.open("assets/manifest/assets_manifest.json").bufferedReader().use { it.readText() }
    }.getOrNull()
}


```

---
### `shared/src/androidMain/kotlin/com/russellmiller/iprep/shared/services/AndroidResourceContext.kt`
- Size: `557` bytes
```
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


```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/FeatureFlag.kt`
- Size: `569` bytes
```
package com.russellmiller.iprep.shared.models

import kotlinx.serialization.Serializable

@Serializable
enum class FeatureFlagKey {
    ENABLE_ANALYTICS,
    ENABLE_LEADERBOARD,
    ENABLE_OFFLINE_MODE,
    ENABLE_DARK_MODE,
    ENABLE_NOTIFICATIONS,
    ENABLE_SOCIAL_FEATURES,
    ENABLE_ADVANCED_QUIZ_MODES,
    ENABLE_PROGRESS_TRACKING,
    ENABLE_QUESTION_EXPLORER,
    ENABLE_STUDY_PLANNER
}

@Serializable
data class FeatureFlag(
    val key: FeatureFlagKey,
    val enabled: Boolean,
    val description: String? = null,
    val defaultValue: Boolean = false
)

```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/AppRoute.kt`
- Size: `610` bytes
```
package com.russellmiller.iprep.shared.models

import kotlinx.serialization.Serializable

@Serializable
sealed class AppRoute {
    @Serializable
    object Dashboard : AppRoute()
    
    @Serializable
    data class Quiz(val mode: QuizMode) : AppRoute()
    
    @Serializable
    object ProgressReport : AppRoute()
    
    @Serializable
    object Review : AppRoute()
    
    @Serializable
    object Analytics : AppRoute()
    
    @Serializable
    object Settings : AppRoute()
    
    @Serializable
    object QuestionExplorer : AppRoute()
    
    @Serializable
    object Leaderboard : AppRoute()
}

```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/QuizQuestion.kt`
- Size: `925` bytes
```
package com.russellmiller.iprep.shared.models

import kotlinx.serialization.Serializable

@Serializable
data class QuizOption(
    val id: String,
    val text: String,
    val imageURL: String? = null
)

@Serializable
data class QuizQuestion(
    val id: String,
    val number: Int,
    val prompt: String,
    val options: List<QuizOption>,
    val correctOptionId: String,
    val explanation: String,
    val references: List<String>,
    val imageURLs: List<String>,
    val explanationImageURLs: List<String>
) {
    fun option(withId: String): QuizOption? {
        return options.firstOrNull { it.id == withId }
    }
}

@Serializable
data class QuizModule(
    val summary: Module,
    val questions: List<QuizQuestion>
) {
    val id: String get() = summary.id
}

@Serializable
data class QuizSessionQuestion(
    val module: QuizModule,
    val question: QuizQuestion
) {
    val id: String get() = question.id
}

```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/AppEnvironment.kt`
- Size: `1232` bytes
```
package com.russellmiller.iprep.shared

import com.russellmiller.iprep.shared.services.*

class AppEnvironment {
    val questionBankService: QuestionBankService
    val featureFlagsService: FeatureFlagsService
    val studyPlannerService: StudyPlannerService
    val quizSessionService: QuizSessionService
    val duelQuestionBankService: DuelQuestionBankService
    val duelEngineService: DuelEngineService
    
    init {
        questionBankService = QuestionBankService()
        featureFlagsService = FeatureFlagsService()
        studyPlannerService = StudyPlannerService()
        quizSessionService = QuizSessionService(questionBankService, studyPlannerService)

        duelQuestionBankService = DuelQuestionBankService()
        loadPearlDiverJson()?.let { jsonString ->
            duelQuestionBankService.loadQuestions(jsonString)
        }
        duelEngineService = DuelEngineService(duelQuestionBankService)
    }
    
    companion object {
        private var INSTANCE: AppEnvironment? = null
        
        fun getInstance(): AppEnvironment {
            return INSTANCE ?: AppEnvironment().also { INSTANCE = it }
        }
        
        val shared: AppEnvironment
            get() = getInstance()
    }
}

```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/QuestionStudyState.kt`
- Size: `1279` bytes
```
package com.russellmiller.iprep.shared.models

import kotlinx.serialization.Serializable

@Serializable
data class QuestionStudyState(
    val questionId: String,
    val moduleId: String,
    val isCorrect: Boolean,
    val isAnswered: Boolean,
    val timesAnswered: Int = 0,
    val timesCorrect: Int = 0,
    val lastAnsweredAt: Long? = null,
    val difficulty: StudyDifficulty = StudyDifficulty.UNKNOWN
) {
    val accuracy: Float
        get() = if (timesAnswered == 0) 0f else timesCorrect.toFloat() / timesAnswered
    
    val needsReview: Boolean
        get() = isAnswered && (!isCorrect || accuracy < 0.7f)
}

@Serializable
enum class StudyDifficulty {
    UNKNOWN,
    EASY,
    MEDIUM,
    HARD
}

@Serializable
data class StudyProgress(
    val moduleId: String,
    val totalQuestions: Int,
    val answeredQuestions: Int,
    val correctAnswers: Int,
    val studyStates: Map<String, QuestionStudyState>
) {
    val completionPercentage: Float
        get() = if (totalQuestions == 0) 0f else answeredQuestions.toFloat() / totalQuestions
    
    val accuracy: Float
        get() = if (answeredQuestions == 0) 0f else correctAnswers.toFloat() / answeredQuestions
    
    val needsReviewCount: Int
        get() = studyStates.values.count { it.needsReview }
}

```

---
### `shared/src/iosMain/kotlin/com/russellmiller/iprep/shared/services/ResourceLoader.ios.kt`
- Size: `1280` bytes
```
package com.russellmiller.iprep.shared.services

import kotlinx.cinterop.ExperimentalForeignApi
import kotlinx.cinterop.addressOf
import kotlinx.cinterop.convert
import kotlinx.cinterop.usePinned
import platform.Foundation.NSBundle
import platform.posix.SEEK_END
import platform.posix.fclose
import platform.posix.fopen
import platform.posix.fread
import platform.posix.fseek
import platform.posix.ftell
import platform.posix.rewind

@OptIn(ExperimentalForeignApi::class)
internal actual fun loadQuestionBankJson(): String? {
    val path = NSBundle.mainBundle.pathForResource("QuestionBank", "json") ?: return null
    val filePointer = fopen(path, "rb") ?: return null
    return try {
        if (fseek(filePointer, 0, SEEK_END) != 0) return null
        val fileSize = ftell(filePointer)
        if (fileSize <= 0L) return ""
        if (fileSize > Int.MAX_VALUE.toLong()) return null
        rewind(filePointer)
        val byteCount = fileSize.toInt()
        val buffer = ByteArray(byteCount)
        val bytesRead = buffer.usePinned { pinned ->
            fread(pinned.addressOf(0), 1u, byteCount.convert(), filePointer)
        }
        if (bytesRead.toLong() != fileSize) return null
        buffer.decodeToString()
    } finally {
        fclose(filePointer)
    }
}

```

---
### `shared/src/iosMain/kotlin/com/russellmiller/iprep/shared/services/DuelResourceLoader.ios.kt`
- Size: `1284` bytes
```
package com.russellmiller.iprep.shared.services

import kotlinx.cinterop.ExperimentalForeignApi
import kotlinx.cinterop.addressOf
import kotlinx.cinterop.convert
import kotlinx.cinterop.usePinned
import platform.Foundation.NSBundle
import platform.posix.SEEK_END
import platform.posix.fclose
import platform.posix.fopen
import platform.posix.fread
import platform.posix.fseek
import platform.posix.ftell
import platform.posix.rewind

@OptIn(ExperimentalForeignApi::class)
internal actual fun loadPearlDiverJson(): String? {
    val path = NSBundle.mainBundle.pathForResource("pearl_diver_cards", "json") ?: return null
    val filePointer = fopen(path, "rb") ?: return null
    return try {
        if (fseek(filePointer, 0, SEEK_END) != 0) return null
        val fileSize = ftell(filePointer)
        if (fileSize <= 0L) return ""
        if (fileSize > Int.MAX_VALUE.toLong()) return null
        rewind(filePointer)
        val byteCount = fileSize.toInt()
        val buffer = ByteArray(byteCount)
        val bytesRead = buffer.usePinned { pinned ->
            fread(pinned.addressOf(0), 1u, byteCount.convert(), filePointer)
        }
        if (bytesRead.toLong() != fileSize) return null
        buffer.decodeToString()
    } finally {
        fclose(filePointer)
    }
}


```

---
### `shared/src/iosMain/kotlin/com/russellmiller/iprep/shared/assets/AssetRegistry.ios.kt`
- Size: `1364` bytes
```
package com.russellmiller.iprep.shared.assets

import kotlinx.cinterop.ExperimentalForeignApi
import kotlinx.cinterop.addressOf
import kotlinx.cinterop.convert
import kotlinx.cinterop.usePinned
import platform.Foundation.NSBundle
import platform.posix.SEEK_END
import platform.posix.fclose
import platform.posix.fopen
import platform.posix.fread
import platform.posix.fseek
import platform.posix.ftell
import platform.posix.rewind

@OptIn(ExperimentalForeignApi::class)
internal actual fun loadAssetsManifestJson(): String? {
    val path = NSBundle.mainBundle.pathForResource(
        name = "assets_manifest",
        ofType = "json",
        inDirectory = "assets/manifest"
    ) ?: return null

    val filePointer = fopen(path, "rb") ?: return null
    return try {
        if (fseek(filePointer, 0, SEEK_END) != 0) return null
        val fileSize = ftell(filePointer)
        if (fileSize <= 0L) return ""
        if (fileSize > Int.MAX_VALUE.toLong()) return null
        rewind(filePointer)
        val byteCount = fileSize.toInt()
        val buffer = ByteArray(byteCount)
        val bytesRead = buffer.usePinned { pinned ->
            fread(pinned.addressOf(0), 1u, byteCount.convert(), filePointer)
        }
        if (bytesRead.toLong() != fileSize) return null
        buffer.decodeToString()
    } finally {
        fclose(filePointer)
    }
}


```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/Module.kt`
- Size: `1534` bytes
```
package com.russellmiller.iprep.shared.models

import kotlinx.serialization.Serializable

@Serializable
data class Module(
    val id: String,
    val title: String,
    val description: String,
    val questionCount: Int,
    val estimatedTimeMinutes: Int,
    val difficulty: Difficulty
) {
    @Serializable
    enum class Difficulty(val value: String) {
        EASY("easy"),
        MODERATE("moderate"),
        HARD("hard")
    }
    
    companion object {
        val placeholder = listOf(
            Module(
                id = "advanced-bronchoscopy",
                title = "Advanced Therapeutic Bronchoscopy",
                description = "Latest interventional techniques and peri-procedural care.",
                questionCount = 42,
                estimatedTimeMinutes = 35,
                difficulty = Difficulty.HARD
            ),
            Module(
                id = "airway-disease",
                title = "Airway Disease",
                description = "Diagnosis and management pathways for airway disorders.",
                questionCount = 38,
                estimatedTimeMinutes = 30,
                difficulty = Difficulty.MODERATE
            ),
            Module(
                id = "pleural-disease",
                title = "Pleural Disease",
                description = "Evidence-based approaches to pleural pathology.",
                questionCount = 24,
                estimatedTimeMinutes = 20,
                difficulty = Difficulty.MODERATE
            )
        )
    }
}

```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/assets/AssetRegistry.kt`
- Size: `1546` bytes
```
package com.russellmiller.iprep.shared.assets

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json

@Serializable
data class AssetEntry(
    val id: String,
    val category: String,
    val path: String,
    val source_pack: String? = null
)

@Serializable
data class AssetsManifest(
    val version: Int = 1,
    val root: String,
    val assets: List<AssetEntry> = emptyList()
)

class AssetRegistry(private val manifest: AssetsManifest) {
    private val byId = manifest.assets.associateBy { it.id }

    fun path(id: String): String =
        byId[id]?.path ?: error("Missing asset id: $id")

    fun tryPath(id: String): String? = byId[id]?.path
}

fun loadAssetRegistry(): AssetRegistry {
    val jsonString = loadAssetsManifestJson()
        ?: error("assets/manifest/assets_manifest.json missing from bundle resources")

    val json = Json { ignoreUnknownKeys = true }
    val manifest = json.decodeFromString<AssetsManifest>(jsonString)

    val normalized = manifest.copy(
        assets = manifest.assets.map { entry ->
            entry.copy(path = entry.path.toResourcePath())
        }
    )

    return AssetRegistry(normalized)
}

fun tryLoadAssetRegistry(): AssetRegistry? = runCatching { loadAssetRegistry() }.getOrNull()

private fun String.toResourcePath(): String {
    val normalized = replace("\\", "/")
    return normalized.substringAfter("shared/src/commonMain/resources/", normalized)
}

internal expect fun loadAssetsManifestJson(): String?

```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/QuizSession.kt`
- Size: `1626` bytes
```
package com.russellmiller.iprep.shared.models

import kotlinx.serialization.Serializable

@Serializable
data class QuizSessionConfiguration(
    val mode: QuizMode,
    val questionLimit: Int? = null,
    val timeLimitMinutes: Int? = null,
    val shuffleQuestions: Boolean = true,
    val showExplanations: Boolean = true
)

@Serializable
sealed class QuizMode {
    @Serializable
    data class QuickStart(val resume: Boolean) : QuizMode()
    
    @Serializable
    data class Module(val id: String, val title: String) : QuizMode()
    
    @Serializable
    object IncorrectOnly : QuizMode()
}

@Serializable
data class QuizSessionState(
    val configuration: QuizSessionConfiguration,
    val questions: List<QuizSessionQuestion>,
    val currentQuestionIndex: Int = 0,
    val answers: Map<String, String> = emptyMap(),
    val startTime: Long = 0L,
    val isCompleted: Boolean = false
) {
    val currentQuestion: QuizSessionQuestion?
        get() = questions.getOrNull(currentQuestionIndex)
    
    val progress: Float
        get() = if (questions.isEmpty()) 0f else currentQuestionIndex.toFloat() / questions.size
    
    val isLastQuestion: Boolean
        get() = currentQuestionIndex >= questions.size - 1
    
    val score: Int
        get() = answers.count { (questionId, answerId) ->
            questions.find { it.question.id == questionId }
                ?.question
                ?.correctOptionId == answerId
        }
    
    val totalQuestions: Int
        get() = questions.size
}

@Serializable
data class QuizSessionQuestionReference(
    val moduleID: String,
    val questionID: String
)

```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/DuelPersistence.kt`
- Size: `1647` bytes
```
package com.russellmiller.iprep.shared.models

import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import kotlinx.serialization.decodeFromString

@Serializable
data class DuelPersistenceData(
    // topicMastery lives here (single source)
    val playerProfile: PlayerProfile,
    // Keep last 20
    val recentDuels: List<CompletedDuel> = emptyList(),
    val recentlySeenQuestionIds: List<String> = emptyList(),
    val recentlyMissedQuestionIds: List<String> = emptyList()
    // NO topicMastery here - it's in PlayerProfile
) {
    companion object {
        val empty = DuelPersistenceData(
            playerProfile = PlayerProfile(id = "local")
        )

        private val json = Json { ignoreUnknownKeys = true; encodeDefaults = true }

        // Cross-platform helpers: iOS/Android store a string blob
        fun encode(data: DuelPersistenceData): String = json.encodeToString(DuelPersistenceData.serializer(), data)
        fun decode(jsonString: String): DuelPersistenceData = runCatching {
            json.decodeFromString(DuelPersistenceData.serializer(), jsonString)
        }.getOrElse {
            empty
        }
    }
}

// Mastery update rule: +0.04 for correct, -0.02 for wrong (clamped 0..1)
fun updateMastery(profile: PlayerProfile, topic: String, isCorrect: Boolean): PlayerProfile {
    val current = profile.topicMastery[topic] ?: 0.5f
    val delta = if (isCorrect) 0.04f else -0.02f
    val newMastery = (current + delta).coerceIn(0f, 1f)
    return profile.copy(
        topicMastery = profile.topicMastery + (topic to newMastery)
    )
}

```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/EnemyDefinitions.kt`
- Size: `3075` bytes
```
package com.russellmiller.iprep.shared.models

object EnemyDefinitions {
    val allEnemies: List<Enemy> = listOf(
        Enemy(
            id = "airway-assassin",
            name = "Dr. Malice",
            title = "The Airway Assassin",
            description = "Challenges you on CAO, stents, and rigid bronchoscopy.",
            iconName = "lungs.fill",
            themeColor = "#E63946",
            topicBiases = listOf("Airway", "CAO", "stent", "rigid", "MCAO", "ECAC"),
            unlockType = UnlockType.NONE
        ),
        Enemy(
            id = "pleural-phantom",
            name = "The Phantom",
            title = "Pleural Phantom",
            description = "Haunts the pleural space with effusions and pneumothorax.",
            iconName = "waveform.path.ecg",
            themeColor = "#457B9D",
            topicBiases = listOf("Pleural", "effusion", "IPC", "pleurodesis", "pneumothorax"),
            unlockType = UnlockType.DUELS_WON,
            unlockValue = 2
        ),
        Enemy(
            id = "staging-sentinel",
            name = "The Sentinel",
            title = "Staging Sentinel",
            description = "Guards accurate lung cancer staging with EBUS mastery.",
            iconName = "target",
            themeColor = "#2A9D8F",
            topicBiases = listOf("staging", "EBUS", "Lung cancer", "screening", "LDCT"),
            unlockType = UnlockType.DUELS_WON,
            unlockValue = 3
        ),
        Enemy(
            id = "peripheral-prowler",
            name = "The Prowler",
            title = "Peripheral Prowler",
            description = "Lurks in the lung periphery, testing biopsy and navigation.",
            iconName = "scope",
            themeColor = "#F4A261",
            topicBiases = listOf("Peripheral", "biopsy", "cryobiopsy", "navigation", "nodule"),
            unlockType = UnlockType.ENEMY_DEFEATED,
            unlockEnemyId = "staging-sentinel"
        ),
        Enemy(
            id = "thermal-tyrant",
            name = "Lord Ablation",
            title = "The Thermal Tyrant",
            description = "Rules over ablative therapies and early-stage cancer.",
            iconName = "flame.fill",
            themeColor = "#E76F51",
            topicBiases = listOf("Thermal", "Ablat", "Early-Stage", "debridement"),
            unlockType = UnlockType.LEVEL,
            unlockValue = 5
        ),
        Enemy(
            id = "code-commander",
            name = "Administrator X",
            title = "The Code Commander",
            description = "Final boss: coding, billing, anesthesia, and tracheostomy.",
            iconName = "dollarsign.circle.fill",
            themeColor = "#6D6875",
            topicBiases = listOf("Coding", "Billing", "Anesthesia", "tracheostomy"),
            unlockType = UnlockType.DUELS_WON,
            unlockValue = 10
        )
    )

    fun enemy(id: String): Enemy? = allEnemies.find { it.id == id }

    fun unlockedEnemies(profile: PlayerProfile): List<Enemy> =
        allEnemies.filter { it.isUnlocked(profile) }
}


```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/DuelQuestionBankService.kt`
- Size: `3717` bytes
```
package com.russellmiller.iprep.shared.services

import com.russellmiller.iprep.shared.models.DuelQuestion
import com.russellmiller.iprep.shared.models.Enemy
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json
import kotlin.random.Random

class DuelQuestionBankService(
    private val rng: Random = Random.Default // Injectable for tests
) {
    private var questions: List<DuelQuestion> = emptyList()
    private var questionsByTopic: Map<String, List<DuelQuestion>> = emptyMap()

    companion object {
        // Selection weights
        const val ENEMY_BIAS_WEIGHT = 0.30f
        const val WEAKNESS_WEIGHT = 0.25f
        const val MISSED_WEIGHT = 0.25f
        // Novelty enforced via filtering, not scoring

        const val GLOBAL_RECENT_BAN = 20 // Soft ban recently seen
        const val RELAXED_BAN = 10 // Fallback if pool too small
    }

    fun loadQuestions(jsonString: String) {
        val json = Json { ignoreUnknownKeys = true }
        questions = json.decodeFromString<List<DuelQuestion>>(jsonString)
        questionsByTopic = questions.groupBy { it.topic }
    }

    fun selectQuestion(
        enemy: Enemy,
        alreadySeen: List<String>, // Questions asked THIS duel (hard ban)
        recentlySeen: List<String>, // Last N across all duels (soft ban)
        recentlyMissed: List<String>, // Questions gotten wrong recently
        weakTopics: List<String>
    ): DuelQuestion? {
        if (questions.isEmpty()) return null

        // Hard constraint: never repeat in same duel
        var candidates = questions.filter { it.id !in alreadySeen }
        if (candidates.isEmpty()) return questions.random(rng)

        // Soft constraint: try to avoid recently seen globally
        val freshCandidates = candidates.filter { it.id !in recentlySeen.take(GLOBAL_RECENT_BAN) }
        if (freshCandidates.size >= 5) {
            candidates = freshCandidates
        } else {
            // Relax to smaller ban
            val relaxedCandidates = candidates.filter { it.id !in recentlySeen.take(RELAXED_BAN) }
            if (relaxedCandidates.size >= 3) {
                candidates = relaxedCandidates
            }
            // If still too small, use all non-duel-seen candidates
        }

        // Score remaining candidates
        val scored = candidates.map { question ->
            var score = 0f

            // Enemy topic bias
            if (enemy.topicBiases.any { bias ->
                    question.topic.contains(bias, ignoreCase = true)
                }) {
                score += ENEMY_BIAS_WEIGHT
            }

            // Player weakness
            if (weakTopics.any { weak ->
                    question.topic.contains(weak, ignoreCase = true)
                }) {
                score += WEAKNESS_WEIGHT
            }

            // Recently missed boost
            if (question.id in recentlyMissed) {
                score += MISSED_WEIGHT
            }

            // Small random factor
            score += rng.nextFloat() * 0.1f

            question to score
        }

        // Weighted random selection
        val totalScore = scored.sumOf { it.second.toDouble() }.toFloat()
        if (totalScore <= 0f) return candidates.random(rng)

        var pick = rng.nextFloat() * totalScore
        for ((question, weight) in scored) {
            pick -= weight
            if (pick <= 0f) return question
        }

        return scored.maxByOrNull { it.second }?.first ?: candidates.random(rng)
    }

    fun allQuestions(): List<DuelQuestion> = questions
    fun topics(): Set<String> = questionsByTopic.keys

    private fun <T> List<T>.random(rng: Random): T = this[rng.nextInt(this.size)]
}


```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/FeatureFlagsService.kt`
- Size: `4229` bytes
```
package com.russellmiller.iprep.shared.services

import com.russellmiller.iprep.shared.models.FeatureFlag
import com.russellmiller.iprep.shared.models.FeatureFlagKey
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

class FeatureFlagsService {
    private val _featureFlags = MutableStateFlow<Map<FeatureFlagKey, FeatureFlag>>(emptyMap())
    val featureFlags: StateFlow<Map<FeatureFlagKey, FeatureFlag>> = _featureFlags.asStateFlow()
    
    init {
        // Initialize with default feature flags
        val defaultFlags = mapOf(
            FeatureFlagKey.ENABLE_ANALYTICS to FeatureFlag(
                key = FeatureFlagKey.ENABLE_ANALYTICS,
                enabled = true,
                description = "Enable analytics and progress tracking",
                defaultValue = true
            ),
            FeatureFlagKey.ENABLE_LEADERBOARD to FeatureFlag(
                key = FeatureFlagKey.ENABLE_LEADERBOARD,
                enabled = true,
                description = "Enable leaderboard functionality",
                defaultValue = true
            ),
            FeatureFlagKey.ENABLE_OFFLINE_MODE to FeatureFlag(
                key = FeatureFlagKey.ENABLE_OFFLINE_MODE,
                enabled = true,
                description = "Enable offline mode for studying",
                defaultValue = true
            ),
            FeatureFlagKey.ENABLE_DARK_MODE to FeatureFlag(
                key = FeatureFlagKey.ENABLE_DARK_MODE,
                enabled = true,
                description = "Enable dark mode theme",
                defaultValue = true
            ),
            FeatureFlagKey.ENABLE_NOTIFICATIONS to FeatureFlag(
                key = FeatureFlagKey.ENABLE_NOTIFICATIONS,
                enabled = false,
                description = "Enable push notifications",
                defaultValue = false
            ),
            FeatureFlagKey.ENABLE_SOCIAL_FEATURES to FeatureFlag(
                key = FeatureFlagKey.ENABLE_SOCIAL_FEATURES,
                enabled = false,
                description = "Enable social features and sharing",
                defaultValue = false
            ),
            FeatureFlagKey.ENABLE_ADVANCED_QUIZ_MODES to FeatureFlag(
                key = FeatureFlagKey.ENABLE_ADVANCED_QUIZ_MODES,
                enabled = true,
                description = "Enable advanced quiz modes and configurations",
                defaultValue = true
            ),
            FeatureFlagKey.ENABLE_PROGRESS_TRACKING to FeatureFlag(
                key = FeatureFlagKey.ENABLE_PROGRESS_TRACKING,
                enabled = true,
                description = "Enable detailed progress tracking",
                defaultValue = true
            ),
            FeatureFlagKey.ENABLE_QUESTION_EXPLORER to FeatureFlag(
                key = FeatureFlagKey.ENABLE_QUESTION_EXPLORER,
                enabled = true,
                description = "Enable question explorer functionality",
                defaultValue = true
            ),
            FeatureFlagKey.ENABLE_STUDY_PLANNER to FeatureFlag(
                key = FeatureFlagKey.ENABLE_STUDY_PLANNER,
                enabled = true,
                description = "Enable study planner and scheduling",
                defaultValue = true
            )
        )
        
        _featureFlags.value = defaultFlags
    }
    
    fun isFeatureEnabled(key: FeatureFlagKey): Boolean {
        return _featureFlags.value[key]?.enabled ?: false
    }
    
    fun getFeatureFlag(key: FeatureFlagKey): FeatureFlag? {
        return _featureFlags.value[key]
    }
    
    fun updateFeatureFlag(key: FeatureFlagKey, enabled: Boolean) {
        val currentFlags = _featureFlags.value.toMutableMap()
        currentFlags[key]?.let { flag ->
            currentFlags[key] = flag.copy(enabled = enabled)
            _featureFlags.value = currentFlags
        }
    }
    
    fun updateFeatureFlags(flags: Map<FeatureFlagKey, FeatureFlag>) {
        _featureFlags.value = flags
    }
    
    suspend fun refreshFromRemote() {
        // TODO: Implement remote config fetching
        // For now, keeping local defaults
    }
}

```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/StudyPlannerService.kt`
- Size: `4520` bytes
```
package com.russellmiller.iprep.shared.services

import com.russellmiller.iprep.shared.models.*
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

class StudyPlannerService {
    private val _studyProgress = MutableStateFlow<Map<String, StudyProgress>>(emptyMap())
    val studyProgress: StateFlow<Map<String, StudyProgress>> = _studyProgress.asStateFlow()
    
    private val _questionStudyStates = MutableStateFlow<Map<String, QuestionStudyState>>(emptyMap())
    val questionStudyStates: StateFlow<Map<String, QuestionStudyState>> = _questionStudyStates.asStateFlow()
    
    fun updateQuestionState(
        questionId: String,
        moduleId: String,
        isCorrect: Boolean,
        isAnswered: Boolean = true
    ) {
        val currentStates = _questionStudyStates.value.toMutableMap()
        val existingState = currentStates[questionId]
        
        val updatedState = existingState?.copy(
            isCorrect = isCorrect,
            isAnswered = isAnswered,
            timesAnswered = existingState.timesAnswered + 1,
            timesCorrect = if (isCorrect) existingState.timesCorrect + 1 else existingState.timesCorrect,
            lastAnsweredAt = 0L
        ) ?: QuestionStudyState(
            questionId = questionId,
            moduleId = moduleId,
            isCorrect = isCorrect,
            isAnswered = isAnswered,
            timesAnswered = 1,
            timesCorrect = if (isCorrect) 1 else 0,
            lastAnsweredAt = 0L
        )
        
        currentStates[questionId] = updatedState
        _questionStudyStates.value = currentStates
        
        // Update module progress
        updateModuleProgress(moduleId)
    }
    
    private fun updateModuleProgress(moduleId: String) {
        val currentProgress = _studyProgress.value.toMutableMap()
        val moduleStates = _questionStudyStates.value.values.filter { it.moduleId == moduleId }
        
        if (moduleStates.isNotEmpty()) {
            val totalQuestions = moduleStates.size
            val answeredQuestions = moduleStates.count { it.isAnswered }
            val correctAnswers = moduleStates.count { it.isCorrect }
            
            val progress = StudyProgress(
                moduleId = moduleId,
                totalQuestions = totalQuestions,
                answeredQuestions = answeredQuestions,
                correctAnswers = correctAnswers,
                studyStates = moduleStates.associateBy { it.questionId }
            )
            
            currentProgress[moduleId] = progress
            _studyProgress.value = currentProgress
        }
    }
    
    fun getQuestionState(questionId: String): QuestionStudyState? {
        return _questionStudyStates.value[questionId]
    }
    
    fun getModuleProgress(moduleId: String): StudyProgress? {
        return _studyProgress.value[moduleId]
    }
    
    fun getQuestionsNeedingReview(moduleId: String? = null): List<QuestionStudyState> {
        val states = _questionStudyStates.value.values
        return if (moduleId != null) {
            states.filter { it.moduleId == moduleId && it.needsReview }
        } else {
            states.filter { it.needsReview }
        }
    }
    
    fun getOverallProgress(): StudyProgress {
        val allStates = _questionStudyStates.value.values
        val totalQuestions = allStates.size
        val answeredQuestions = allStates.count { it.isAnswered }
        val correctAnswers = allStates.count { it.isCorrect }
        
        return StudyProgress(
            moduleId = "overall",
            totalQuestions = totalQuestions,
            answeredQuestions = answeredQuestions,
            correctAnswers = correctAnswers,
            studyStates = allStates.associateBy { it.questionId }
        )
    }
    
    fun resetProgress(moduleId: String? = null) {
        if (moduleId != null) {
            val currentStates = _questionStudyStates.value.toMutableMap()
            currentStates.keys.filter { currentStates[it]?.moduleId == moduleId }
                .forEach { currentStates.remove(it) }
            _questionStudyStates.value = currentStates
            
            val currentProgress = _studyProgress.value.toMutableMap()
            currentProgress.remove(moduleId)
            _studyProgress.value = currentProgress
        } else {
            _questionStudyStates.value = emptyMap()
            _studyProgress.value = emptyMap()
        }
    }
}

```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/QuizSessionService.kt`
- Size: `5074` bytes
```
package com.russellmiller.iprep.shared.services

import com.russellmiller.iprep.shared.models.*
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

class QuizSessionService(
    private val questionBankService: QuestionBankService,
    private val studyPlannerService: StudyPlannerService
) {
    private val _currentSession = MutableStateFlow<QuizSessionState?>(null)
    val currentSession: StateFlow<QuizSessionState?> = _currentSession.asStateFlow()
    
    fun startSession(configuration: QuizSessionConfiguration): QuizSessionState {
        val questions = when (configuration.mode) {
            is QuizMode.QuickStart -> {
                if (configuration.mode.resume) {
                    // TODO: Load from saved session
                    questionBankService.quickStartQuestions(limit = configuration.questionLimit ?: 10)
                } else {
                    questionBankService.quickStartQuestions(limit = configuration.questionLimit ?: 10)
                }
            }
            is QuizMode.Module -> {
                questionBankService.sessionQuestions(forModule = configuration.mode.id)
            }
            is QuizMode.IncorrectOnly -> {
                val incorrectQuestions = studyPlannerService.getQuestionsNeedingReview()
                // Convert to QuizSessionQuestion format
                incorrectQuestions.mapNotNull { state ->
                    questionBankService.sessionQuestion(
                        reference = QuizSessionQuestionReference(
                            moduleID = state.moduleId,
                            questionID = state.questionId
                        )
                    )
                }
            }
        }
        
        val session = QuizSessionState(
            configuration = configuration,
            questions = questions,
            currentQuestionIndex = 0,
            answers = emptyMap(),
            startTime = 0L,
            isCompleted = false
        )
        
        _currentSession.value = session
        return session
    }
    
    fun answerQuestion(questionId: String, answerId: String) {
        val currentSession = _currentSession.value ?: return
        val question = currentSession.questions.find { it.question.id == questionId } ?: return
        
        val updatedAnswers = currentSession.answers + (questionId to answerId)
        val isCorrect = question.question.correctOptionId == answerId
        
        // Update study state
        studyPlannerService.updateQuestionState(
            questionId = questionId,
            moduleId = question.module.summary.id,
            isCorrect = isCorrect
        )
        
        val updatedSession = currentSession.copy(answers = updatedAnswers)
        _currentSession.value = updatedSession
    }
    
    fun nextQuestion(): Boolean {
        val currentSession = _currentSession.value ?: return false
        
        if (currentSession.isLastQuestion) {
            completeSession()
            return false
        }
        
        val updatedSession = currentSession.copy(
            currentQuestionIndex = currentSession.currentQuestionIndex + 1
        )
        _currentSession.value = updatedSession
        return true
    }
    
    fun previousQuestion(): Boolean {
        val currentSession = _currentSession.value ?: return false
        
        if (currentSession.currentQuestionIndex <= 0) return false
        
        val updatedSession = currentSession.copy(
            currentQuestionIndex = currentSession.currentQuestionIndex - 1
        )
        _currentSession.value = updatedSession
        return true
    }
    
    fun goToQuestion(index: Int): Boolean {
        val currentSession = _currentSession.value ?: return false
        
        if (index < 0 || index >= currentSession.questions.size) return false
        
        val updatedSession = currentSession.copy(currentQuestionIndex = index)
        _currentSession.value = updatedSession
        return true
    }
    
    fun completeSession() {
        val currentSession = _currentSession.value ?: return
        
        val completedSession = currentSession.copy(isCompleted = true)
        _currentSession.value = completedSession
    }
    
    fun endSession() {
        _currentSession.value = null
    }
    
    fun getSessionResults(): QuizSessionResults? {
        val session = _currentSession.value ?: return null
        
        return QuizSessionResults(
            session = session,
            score = session.score,
            totalQuestions = session.totalQuestions,
            accuracy = if (session.totalQuestions > 0) session.score.toFloat() / session.totalQuestions else 0f,
            timeSpent = 0L,
            questionsAnswered = session.answers.size
        )
    }
}

data class QuizSessionResults(
    val session: QuizSessionState,
    val score: Int,
    val totalQuestions: Int,
    val accuracy: Float,
    val timeSpent: Long,
    val questionsAnswered: Int
)

```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/DuelModels.kt`
- Size: `5586` bytes
```
package com.russellmiller.iprep.shared.models

import kotlinx.serialization.Serializable

@Serializable
data class DuelQuestion(
    // Already prefixed "pearl-diver-XXX" - collision-safe
    val id: String,
    val topic: String,
    val statement: String,
    val answer: Boolean,
    val explanation: String,
    val source: String,
    // For HINT lifeline
    val hint: String
)

// Enemy is defined in EnemyDefinitions and not persisted directly.
// DuelState stores enemyId only; UI resolves via EnemyDefinitions.enemy(id).
class Enemy internal constructor(
    val id: String,
    val name: String,
    val title: String,
    val description: String,
    val iconName: String,
    val themeColor: String,
    val maxHP: Int = 100,
    val topicBiases: List<String>,
    // Unlock logic stays internal - exposed via methods only
    internal val unlockType: UnlockType = UnlockType.NONE,
    internal val unlockValue: Int = 0,
    internal val unlockEnemyId: String? = null
) {
    val displayName: String get() = "$name, $title"

    fun isUnlocked(profile: PlayerProfile): Boolean = when (unlockType) {
        UnlockType.NONE -> true
        UnlockType.DUELS_WON -> profile.duelsWon >= unlockValue
        UnlockType.ENEMY_DEFEATED -> unlockEnemyId in profile.defeatedEnemies
        UnlockType.LEVEL -> profile.level >= unlockValue
    }

    fun lockReason(profile: PlayerProfile): String? = when {
        isUnlocked(profile) -> null
        unlockType == UnlockType.DUELS_WON -> "Win ${unlockValue - profile.duelsWon} more duels"
        unlockType == UnlockType.ENEMY_DEFEATED -> "Defeat ${unlockEnemyId ?: "required enemy"} first"
        unlockType == UnlockType.LEVEL -> "Reach level $unlockValue"
        else -> null
    }
}

internal enum class UnlockType { NONE, DUELS_WON, ENEMY_DEFEATED, LEVEL }

@Serializable
enum class Lifeline {
    // Shows question.hint (replaces 50/50)
    HINT,
    // Next wrong = 50% damage taken
    SHIELD,
    // Next correct = +50% damage dealt
    DOUBLE_TAP
}

@Serializable
data class LifelineState(
    val hintUsed: Boolean = false,
    // Shield: used = consumed for duel, active = armed for next answer
    val shieldUsed: Boolean = false,
    val shieldActive: Boolean = false,
    // DoubleTap: used = consumed for duel, active = armed for next answer
    val doubleTapUsed: Boolean = false,
    val doubleTapActive: Boolean = false
) {
    val remainingCount: Int get() = listOf(!hintUsed, !shieldUsed, !doubleTapUsed).count { it }
}

@Serializable
data class PlayerProfile(
    val id: String,
    val xp: Long = 0,
    val level: Int = 1,
    val duelsWon: Int = 0,
    val duelsLost: Int = 0,
    val totalCorrect: Int = 0,
    val totalAnswered: Int = 0,
    val longestStreak: Int = 0,
    val defeatedEnemies: Set<String> = emptySet(),
    val topicMastery: Map<String, Float> = emptyMap()
) {
    companion object {
        // Level curve: 200 + 75*(level-1)
        // Level 2: 200 XP, Level 3: 275 XP, Level 5: 500 XP, Level 10: 875 XP
        fun xpForLevel(level: Int): Long = if (level <= 1) 0L else (200 + 75 * (level - 1)).toLong()

        fun levelForXP(xp: Long): Int {
            var lvl = 1
            while (xpForLevel(lvl + 1) <= xp) lvl++
            return lvl
        }
    }

    val xpToNextLevel: Long get() = xpForLevel(level + 1) - xp
    val levelProgress: Float
        get() {
            val currentLevelXP = xpForLevel(level)
            val nextLevelXP = xpForLevel(level + 1)
            val range = nextLevelXP - currentLevelXP
            return if (range > 0) (xp - currentLevelXP).toFloat() / range else 1f
        }
}

// Simplified phases - RESOLVING is UI-only
@Serializable
enum class DuelPhase {
    // Show enemy introduction
    INTRO,
    // Display question, awaiting answer
    QUESTION,
    // Show explanation (UI animates damage before this)
    FEEDBACK,
    // Duel complete
    END
}

@Serializable
data class DuelState(
    val id: String,
    // Store ID only, resolve via EnemyDefinitions.enemy(id)
    val enemyId: String,
    // Captured at start from enemy.maxHP
    val enemyMaxHP: Int,
    val playerHP: Int = 100,
    // Initialized from enemyMaxHP in startDuel()
    val enemyHP: Int,
    val currentStreak: Int = 0,
    val maxStreak: Int = 0,
    val questionsAsked: List<String> = emptyList(),
    val currentQuestion: DuelQuestion? = null,
    val phase: DuelPhase = DuelPhase.INTRO,
    val lifelines: LifelineState = LifelineState(),
    val lastAnswer: AnswerResult? = null,
    val showingHint: Boolean = false,
    val startTime: Long = 0L,
    val xpEarned: Long = 0L,
    val correctCount: Int = 0,
    val incorrectCount: Int = 0
) {
    val isPlayerVictory: Boolean get() = enemyHP <= 0
    val isPlayerDefeated: Boolean get() = playerHP <= 0
    val isEnded: Boolean get() = isPlayerVictory || isPlayerDefeated
    val totalAnswered: Int get() = correctCount + incorrectCount

    // Convenience: resolve full enemy from definitions
    val enemy: Enemy? get() = EnemyDefinitions.enemy(enemyId)
}

@Serializable
data class AnswerResult(
    val questionId: String,
    val playerAnswer: Boolean,
    val correctAnswer: Boolean,
    val isCorrect: Boolean,
    val damageDealt: Int,
    val damageTaken: Int,
    val wasCrit: Boolean,
    val streakMultiplier: Float
)

@Serializable
data class CompletedDuel(
    val id: String,
    val enemyId: String,
    val won: Boolean,
    val xpEarned: Long,
    val correctCount: Int,
    val totalQuestions: Int,
    val maxStreak: Int,
    val completedAt: Long,
    val durationSeconds: Long
)

```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/DuelEngineService.kt`
- Size: `9401` bytes
```
package com.russellmiller.iprep.shared.services

import com.russellmiller.iprep.shared.models.AnswerResult
import com.russellmiller.iprep.shared.models.CompletedDuel
import com.russellmiller.iprep.shared.models.DuelPhase
import com.russellmiller.iprep.shared.models.DuelState
import com.russellmiller.iprep.shared.models.Enemy
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlin.math.max
import kotlin.random.Random
import com.russellmiller.iprep.shared.util.currentTimeMillis

class DuelEngineService(
    private val questionBankService: DuelQuestionBankService,
    private val rng: Random = Random.Default // Injectable for tests
) {
    companion object {
        const val BASE_DAMAGE = 12
        const val PLAYER_MAX_HP = 100

        const val BASE_CRIT_CHANCE = 0.05f
        const val CRIT_CHANCE_PER_STREAK = 0.01f
        const val MAX_CRIT_CHANCE = 0.20f
        const val CRIT_MULTIPLIER = 2.0f

        const val DOUBLE_TAP_BONUS = 0.50f
        const val SHIELD_REDUCTION = 0.50f

        const val XP_PER_CORRECT = 10L
        const val XP_STREAK_BONUS = 5L
        const val XP_WIN_BONUS = 50L
    }

    private val _currentDuel = MutableStateFlow<DuelState?>(null)
    val currentDuel: StateFlow<DuelState?> = _currentDuel.asStateFlow()

    // Track recent questions globally (persisted separately)
    private var recentlySeenIds = mutableListOf<String>()
    private var recentlyMissedIds = mutableListOf<String>()
    private var weakTopics = listOf<String>()

    fun setPlayerContext(recentSeen: List<String>, recentMissed: List<String>, weakTopics: List<String>) {
        this.recentlySeenIds = recentSeen.toMutableList()
        this.recentlyMissedIds = recentMissed.toMutableList()
        this.weakTopics = weakTopics
    }

    fun recentlySeenQuestionIds(): List<String> = recentlySeenIds.toList()

    fun recentlyMissedQuestionIds(): List<String> = recentlyMissedIds.toList()

    fun startDuel(enemy: Enemy): DuelState {
        val question = questionBankService.selectQuestion(
            enemy = enemy,
            alreadySeen = emptyList(),
            recentlySeen = recentlySeenIds,
            recentlyMissed = recentlyMissedIds,
            weakTopics = weakTopics
        )

        val state = DuelState(
            id = "duel-${currentTimeMillis()}",
            enemyId = enemy.id,
            enemyMaxHP = enemy.maxHP,
            playerHP = PLAYER_MAX_HP,
            enemyHP = enemy.maxHP,
            currentQuestion = question,
            phase = DuelPhase.INTRO,
            startTime = currentTimeMillis()
        )
        _currentDuel.value = state
        return state
    }

    fun proceedToQuestion() {
        val current = _currentDuel.value ?: return
        _currentDuel.value = current.copy(
            phase = DuelPhase.QUESTION,
            showingHint = false
        )
    }

    fun submitAnswer(playerAnswer: Boolean): AnswerResult? {
        val current = _currentDuel.value ?: return null
        val question = current.currentQuestion ?: return null
        if (current.phase != DuelPhase.QUESTION) return null

        val isCorrect = playerAnswer == question.answer
        val newStreak = if (isCorrect) current.currentStreak + 1 else 0
        val maxStreak = max(current.maxStreak, newStreak)
        // Use newStreak for damage/crit so 3rd correct gets streak=3 bonus
        val multiplier = streakMultiplier(newStreak)
        val isCrit = isCorrect && rollCrit(newStreak)

        var damageDealt = 0
        var damageTaken = 0

        if (isCorrect) {
            var damage = (BASE_DAMAGE * multiplier).toInt()
            if (current.lifelines.doubleTapActive) {
                damage = (damage * (1 + DOUBLE_TAP_BONUS)).toInt()
            }
            if (isCrit) {
                damage = (damage * CRIT_MULTIPLIER).toInt()
            }
            damageDealt = damage
        } else {
            var damage = BASE_DAMAGE
            if (current.lifelines.shieldActive) {
                damage = (damage * SHIELD_REDUCTION).toInt()
            }
            damageTaken = damage

            // Track missed question
            if (question.id !in recentlyMissedIds) {
                recentlyMissedIds.add(0, question.id)
                if (recentlyMissedIds.size > 50) recentlyMissedIds.removeLast()
            }
        }

        // Track seen question
        if (question.id !in recentlySeenIds) {
            recentlySeenIds.add(0, question.id)
            if (recentlySeenIds.size > 30) recentlySeenIds.removeLast()
        }

        val xpGained = if (isCorrect) XP_PER_CORRECT + (newStreak * XP_STREAK_BONUS) else 0L

        val result = AnswerResult(
            questionId = question.id,
            playerAnswer = playerAnswer,
            correctAnswer = question.answer,
            isCorrect = isCorrect,
            damageDealt = damageDealt,
            damageTaken = damageTaken,
            wasCrit = isCrit,
            streakMultiplier = multiplier
        )

        val newPlayerHP = max(0, current.playerHP - damageTaken)
        val newEnemyHP = max(0, current.enemyHP - damageDealt)

        // Clear active lifelines after use
        val newLifelines = current.lifelines.copy(
            shieldActive = false,
            doubleTapActive = false
        )

        _currentDuel.value = current.copy(
            playerHP = newPlayerHP,
            enemyHP = newEnemyHP,
            currentStreak = newStreak,
            maxStreak = maxStreak,
            questionsAsked = current.questionsAsked + question.id,
            lastAnswer = result,
            lifelines = newLifelines,
            xpEarned = current.xpEarned + xpGained,
            correctCount = if (isCorrect) current.correctCount + 1 else current.correctCount,
            incorrectCount = if (!isCorrect) current.incorrectCount + 1 else current.incorrectCount
            // Note: phase stays QUESTION - UI handles "resolving" animation
        )

        return result
    }

    fun showFeedback() {
        val current = _currentDuel.value ?: return

        if (current.isEnded) {
            val winBonus = if (current.isPlayerVictory) XP_WIN_BONUS else 0L
            _currentDuel.value = current.copy(
                phase = DuelPhase.END,
                xpEarned = current.xpEarned + winBonus
            )
        } else {
            _currentDuel.value = current.copy(phase = DuelPhase.FEEDBACK)
        }
    }

    fun proceedToNextQuestion() {
        val current = _currentDuel.value ?: return
        if (current.phase != DuelPhase.FEEDBACK) return
        val enemy = current.enemy ?: return

        val nextQuestion = questionBankService.selectQuestion(
            enemy = enemy,
            alreadySeen = current.questionsAsked,
            recentlySeen = recentlySeenIds,
            recentlyMissed = recentlyMissedIds,
            weakTopics = weakTopics
        )

        _currentDuel.value = current.copy(
            currentQuestion = nextQuestion,
            phase = DuelPhase.QUESTION,
            lastAnswer = null,
            showingHint = false
        )
    }

    fun useHint(): String? {
        val current = _currentDuel.value ?: return null
        if (current.lifelines.hintUsed) return null

        val hint = current.currentQuestion?.hint
        _currentDuel.value = current.copy(
            lifelines = current.lifelines.copy(hintUsed = true),
            showingHint = true
        )
        return hint
    }

    fun useShield(): Boolean {
        val current = _currentDuel.value ?: return false
        if (current.lifelines.shieldUsed) return false

        _currentDuel.value = current.copy(
            lifelines = current.lifelines.copy(
                shieldUsed = true,
                shieldActive = true
            )
        )
        return true
    }

    fun useDoubleTap(): Boolean {
        val current = _currentDuel.value ?: return false
        if (current.lifelines.doubleTapUsed) return false

        _currentDuel.value = current.copy(
            lifelines = current.lifelines.copy(
                doubleTapUsed = true,
                doubleTapActive = true
            )
        )
        return true
    }

    fun getCompletedDuel(): CompletedDuel? {
        val current = _currentDuel.value ?: return null
        if (current.phase != DuelPhase.END) return null
        val enemy = current.enemy ?: return null

        val now = currentTimeMillis()
        return CompletedDuel(
            id = current.id,
            enemyId = enemy.id,
            won = current.isPlayerVictory,
            xpEarned = current.xpEarned,
            correctCount = current.correctCount,
            totalQuestions = current.totalAnswered,
            maxStreak = current.maxStreak,
            completedAt = now,
            durationSeconds = (now - current.startTime) / 1000
        )
    }

    fun endDuel() {
        _currentDuel.value = null
    }

    private fun streakMultiplier(streak: Int): Float = when {
        streak < 3 -> 1.0f
        streak < 6 -> 1.25f
        streak < 10 -> 1.5f
        else -> 1.75f
    }

    private fun rollCrit(streak: Int): Boolean {
        val chance = kotlin.math.min(MAX_CRIT_CHANCE, BASE_CRIT_CHANCE + streak * CRIT_CHANCE_PER_STREAK)
        return rng.nextFloat() < chance
    }
}


```

---
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/QuestionBankService.kt`
- Size: `9810` bytes
```
package com.russellmiller.iprep.shared.services

import com.russellmiller.iprep.shared.models.*
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import kotlinx.serialization.decodeFromString

@Serializable
data class QuestionBankDTO(
    val modules: List<ModuleDTO>
)

@Serializable
data class ModuleDTO(
    val id: String,
    val title: String,
    val description: String,
    val estimatedTimeMinutes: Int,
    val difficulty: String,
    val questionCount: Int,
    val questions: List<QuestionDTO>
)

@Serializable
data class QuestionDTO(
    val id: String,
    val number: Int,
    val prompt: String,
    val options: List<OptionDTO>,
    val correctOptionId: String,
    val explanation: String,
    val references: List<String>,
    val imageURLs: List<String>
)

@Serializable
data class OptionDTO(
    val id: String,
    val text: String
)

class QuestionBankService {
    private val modules: List<QuizModule>
    private val modulesById: Map<String, QuizModule>
    val totalQuestionCount: Int
    
    init {
        val (loadedModules, loadedModulesById, loadedTotalCount) = try {
            val jsonString = loadQuestionBankJson()
                ?: error("QuestionBank.json missing from bundle resources")
            val json = Json { ignoreUnknownKeys = true }
            val dto = json.decodeFromString<QuestionBankDTO>(jsonString)
            
            val quizModules = dto.modules.map { moduleDTO ->
                val difficulty = Module.Difficulty.values()
                    .firstOrNull { it.value == moduleDTO.difficulty }
                    ?: Module.Difficulty.MODERATE
                val summary = Module(
                    id = moduleDTO.id,
                    title = moduleDTO.title,
                    description = moduleDTO.description,
                    questionCount = moduleDTO.questions.size,
                    estimatedTimeMinutes = moduleDTO.estimatedTimeMinutes,
                    difficulty = difficulty
                )
                
                val questions = moduleDTO.questions.map { questionDTO ->
                    var promptText = questionDTO.prompt
                    var options = questionDTO.options.map { optionDTO ->
                        QuizOption(id = optionDTO.id.lowercase(), text = optionDTO.text, imageURL = null)
                    }

                    if (options.isEmpty()) {
                        parseEmbeddedOptions(promptText)?.let { parsed ->
                            promptText = parsed.first
                            options = parsed.second
                        }
                    }

                    val promptImages = mutableListOf<String>()
                    val explanationImages = mutableListOf<String>()
                    val optionImageMap = mutableMapOf<String, String>()

                    for (urlString in questionDTO.imageURLs) {
                        val lower = urlString.lowercase()
                        val optionId = optionIdentifier(lower)
                        when {
                            optionId != null -> optionImageMap[optionId] = urlString
                            lower.contains("diss") || lower.contains("discuss") || lower.contains("explanation") -> explanationImages += urlString
                            else -> promptImages += urlString
                        }
                    }

                    val normalizedOptions = options.map { option ->
                        val optionId = option.id.lowercase()
                        option.copy(id = optionId, imageURL = optionImageMap[optionId])
                    }
                    
                    QuizQuestion(
                        id = questionDTO.id,
                        number = questionDTO.number,
                        prompt = promptText,
                        options = normalizedOptions,
                        correctOptionId = questionDTO.correctOptionId.lowercase(),
                        explanation = questionDTO.explanation,
                        references = questionDTO.references,
                        imageURLs = promptImages,
                        explanationImageURLs = explanationImages
                    )
                }
                
                QuizModule(summary = summary, questions = questions)
            }
            
            Triple(quizModules, quizModules.associateBy { it.id }, quizModules.sumOf { it.questions.size })
        } catch (e: Exception) {
            println("[Shared.QuestionBankService] load failed: ${e.message}")
            // Fallback to placeholder data
            val placeholderModules = Module.placeholder.map { module ->
                QuizModule(
                    summary = module,
                    questions = emptyList()
                )
            }
            
            Triple(placeholderModules, placeholderModules.associateBy { it.id }, 0)
        }
        
        this.modules = loadedModules
        this.modulesById = loadedModulesById
        this.totalQuestionCount = loadedTotalCount
    }
    
    fun moduleSummaries(): List<Module> {
        return modules.map { it.summary }
    }
    
    fun quizModule(id: String): QuizModule? {
        return modulesById[id]
    }
    
    fun questions(moduleId: String): List<QuizQuestion> {
        return modulesById[moduleId]?.questions ?: emptyList()
    }
    
    fun quickStartQuestions(limit: Int = 10, excluding: Set<String> = emptySet()): List<QuizSessionQuestion> {
        if (modules.isEmpty()) return emptyList()
        
        val allQuestions = modules.flatMap { module ->
            module.questions.map { QuizSessionQuestion(module = module, question = it) }
        }
        
        val filtered = allQuestions.filter { !excluding.contains(it.question.id) }
        if (filtered.isEmpty()) return emptyList()
        
        return filtered.shuffled().take(maxOf(1, minOf(limit, filtered.size)))
    }
    
    fun allSessionQuestions(): List<QuizSessionQuestion> {
        return modules.flatMap { module ->
            module.questions.map { QuizSessionQuestion(module = module, question = it) }
        }
    }
    
    fun sessionQuestions(forModule: String): List<QuizSessionQuestion> {
        val module = modulesById[forModule] ?: return emptyList()
        return module.questions.map { QuizSessionQuestion(module = module, question = it) }
    }
    
    fun sessionQuestions(forModule: String, excluding: Set<String>): List<QuizSessionQuestion> {
        val base = sessionQuestions(forModule = forModule)
        if (base.isEmpty()) return emptyList()
        
        val filtered = base.filter { !excluding.contains(it.question.id) }
        return if (filtered.isEmpty()) emptyList() else filtered
    }
    
    fun sessionQuestion(reference: QuizSessionQuestionReference): QuizSessionQuestion? {
        val module = modulesById[reference.moduleID] ?: return null
        val question = module.questions.find { it.id == reference.questionID } ?: return null
        return QuizSessionQuestion(module = module, question = question)
    }
    
    fun moduleCount(): Int {
        return modules.size
    }
    
    fun sessionQuestions(from: List<QuizSessionQuestionReference>): List<QuizSessionQuestion> {
        return from.mapNotNull { reference ->
            sessionQuestion(reference)
        }
    }

    private fun parseEmbeddedOptions(prompt: String): Pair<String, List<QuizOption>>? {
        val markers = embeddedOptionMarkers(prompt)
        if (markers.isEmpty()) return null

        val options = markers.mapIndexed { index, marker ->
            val start = marker.endInclusive + 1
            val end = if (index + 1 < markers.size) markers[index + 1].start else prompt.length
            val optionText = prompt.substring(start, end).trim()
            QuizOption(id = marker.label.toString(), text = optionText, imageURL = null)
        }.filter { it.text.isNotEmpty() }

        val questionText = prompt.substring(0, markers.first().start).trim()
        return if (questionText.isNotEmpty() && options.isNotEmpty()) questionText to options else null
    }

    private fun optionIdentifier(filename: String): String? {
        val length = filename.length
        if (length < 3) return null

        for (index in 0..(length - 3)) {
            if (filename[index] != '(') continue
            val candidate = filename[index + 1]
            if (!isAsciiLetter(candidate)) continue
            if (filename[index + 2] != ')') continue
            return asciiLowercaseChar(candidate).toString()
        }
        return null
    }

    private data class EmbeddedOptionMarker(
        val label: Char,
        val start: Int,
        val endInclusive: Int
    )

    private fun embeddedOptionMarkers(prompt: String): List<EmbeddedOptionMarker> {
        if (prompt.length < 3) return emptyList()

        val markers = mutableListOf<EmbeddedOptionMarker>()
        for (index in 1..(prompt.length - 2)) {
            val previous = prompt[index - 1]
            val candidate = prompt[index]
            val next = prompt[index + 1]

            if (previous != ' ') continue
            if (next != ')') continue
            if (!isAsciiLetter(candidate)) continue

            markers += EmbeddedOptionMarker(
                label = asciiLowercaseChar(candidate),
                start = index - 1,
                endInclusive = index + 1
            )
        }
        return markers
    }

    private fun isAsciiLetter(candidate: Char): Boolean {
        return (candidate in 'a'..'z') || (candidate in 'A'..'Z')
    }

    private fun asciiLowercaseChar(candidate: Char): Char {
        return if (candidate in 'A'..'Z') (candidate.code + 32).toChar() else candidate
    }
}

```

---
### `shared/src/commonTest/kotlin/com/russellmiller/iprep/shared/services/DuelEngineServiceTest.kt`
- Size: `10013` bytes
```
package com.russellmiller.iprep.shared.services

import com.russellmiller.iprep.shared.models.Enemy
import com.russellmiller.iprep.shared.models.PlayerProfile
import com.russellmiller.iprep.shared.models.UnlockType
import com.russellmiller.iprep.shared.models.updateMastery
import com.russellmiller.iprep.shared.models.DuelPersistenceData
import com.russellmiller.iprep.shared.models.EnemyDefinitions
import kotlin.random.Random
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNotNull
import kotlin.test.assertNotSame
import kotlin.test.assertTrue

class DuelEngineServiceTest {
    private fun sampleQuestionsJson(count: Int = 12): String {
        val items = (1..count).joinToString(separator = ",") { i ->
            """{"id":"q$i","topic":"Topic $i","statement":"S$i","answer":true,"explanation":"E$i","source":"src","hint":"H$i"}"""
        }
        return "[$items]"
    }

    private fun sampleEnemy(): Enemy = Enemy(
        id = "test-enemy",
        name = "Test",
        title = "Dummy",
        description = "Test enemy",
        iconName = "bolt.fill",
        themeColor = "#000000",
        maxHP = 100,
        topicBiases = listOf("Topic"),
        unlockType = UnlockType.NONE
    )

    private fun definedEnemy(id: String = "airway-assassin"): Enemy =
        requireNotNull(EnemyDefinitions.enemy(id)) { "Missing enemy definition: $id" }

    @Test
    fun streakMultiplierUsesNewStreak() {
        val qb = DuelQuestionBankService(Random(1)).apply { loadQuestions(sampleQuestionsJson(count = 5)) }
        val engine = DuelEngineService(qb, Random(2))
        engine.setPlayerContext(recentSeen = emptyList(), recentMissed = emptyList(), weakTopics = emptyList())
        engine.startDuel(definedEnemy())
        engine.proceedToQuestion()

        // 1st correct -> streak 1 -> 1.0
        val r1 = engine.submitAnswer(true)
        assertNotNull(r1)
        assertEquals(1.0f, r1.streakMultiplier)
        engine.showFeedback()
        engine.proceedToNextQuestion()

        // 2nd correct -> streak 2 -> 1.0
        val r2 = engine.submitAnswer(true)
        assertNotNull(r2)
        assertEquals(1.0f, r2.streakMultiplier)
        engine.showFeedback()
        engine.proceedToNextQuestion()

        // 3rd correct -> streak 3 -> 1.25
        val r3 = engine.submitAnswer(true)
        assertNotNull(r3)
        assertEquals(1.25f, r3.streakMultiplier)
    }

    @Test
    fun critChanceDeterministicWithSeededRng() {
        val qb1 = DuelQuestionBankService(Random(42)).apply { loadQuestions(sampleQuestionsJson(count = 3)) }
        val qb2 = DuelQuestionBankService(Random(42)).apply { loadQuestions(sampleQuestionsJson(count = 3)) }

        val engine1 = DuelEngineService(qb1, Random(123))
        val engine2 = DuelEngineService(qb2, Random(123))

        engine1.setPlayerContext(emptyList(), emptyList(), emptyList())
        engine2.setPlayerContext(emptyList(), emptyList(), emptyList())

        engine1.startDuel(definedEnemy()); engine1.proceedToQuestion()
        engine2.startDuel(definedEnemy()); engine2.proceedToQuestion()

        val r1 = engine1.submitAnswer(true)
        val r2 = engine2.submitAnswer(true)
        assertNotNull(r1)
        assertNotNull(r2)
        assertEquals(r1.wasCrit, r2.wasCrit)
    }

    @Test
    fun lifelineOneUseEnforced() {
        val qb = DuelQuestionBankService(Random(1)).apply { loadQuestions(sampleQuestionsJson(count = 1)) }
        val engine = DuelEngineService(qb, Random(2))
        engine.setPlayerContext(emptyList(), emptyList(), emptyList())
        engine.startDuel(definedEnemy())
        engine.proceedToQuestion()

        assertTrue(engine.useShield())
        assertFalse(engine.useShield())
        assertTrue(engine.useDoubleTap())
        assertFalse(engine.useDoubleTap())
    }

    @Test
    fun lifelineActiveClearedAfterAnswer() {
        val qb = DuelQuestionBankService(Random(1)).apply { loadQuestions(sampleQuestionsJson(count = 1)) }
        val engine = DuelEngineService(qb, Random(2))
        engine.setPlayerContext(emptyList(), emptyList(), emptyList())
        engine.startDuel(definedEnemy())
        engine.proceedToQuestion()

        assertTrue(engine.useShield())
        val before = engine.currentDuel.value
        assertNotNull(before)
        assertTrue(before.lifelines.shieldUsed)
        assertTrue(before.lifelines.shieldActive)

        // Force wrong answer to consume shield
        val result = engine.submitAnswer(false)
        assertNotNull(result)

        val after = engine.currentDuel.value
        assertNotNull(after)
        assertTrue(after.lifelines.shieldUsed)
        assertFalse(after.lifelines.shieldActive)
    }

    @Test
    fun shieldReducesDamageByHalf() {
        val qb = DuelQuestionBankService(Random(1)).apply { loadQuestions(sampleQuestionsJson(count = 1)) }
        val engine = DuelEngineService(qb, Random(2))
        engine.setPlayerContext(emptyList(), emptyList(), emptyList())
        engine.startDuel(definedEnemy())
        engine.proceedToQuestion()

        assertTrue(engine.useShield())
        val result = engine.submitAnswer(false)
        assertNotNull(result)
        assertEquals(6, result.damageTaken)
    }

    @Test
    fun doubleTapBoostsDamage() {
        val qb = DuelQuestionBankService(Random(1)).apply { loadQuestions(sampleQuestionsJson(count = 1)) }
        val engine = DuelEngineService(qb, Random(2))
        engine.setPlayerContext(emptyList(), emptyList(), emptyList())
        engine.startDuel(definedEnemy())
        engine.proceedToQuestion()

        assertTrue(engine.useDoubleTap())
        val result = engine.submitAnswer(true)
        assertNotNull(result)
        assertTrue(result.damageDealt >= 18) // 12 * 1.5, possibly higher with crit
    }

    @Test
    fun questionHardBanNoRepeatsInSingleDuel() {
        val qb = DuelQuestionBankService(Random(99)).apply { loadQuestions(sampleQuestionsJson(count = 5)) }
        val engine = DuelEngineService(qb, Random(1))
        engine.setPlayerContext(emptyList(), emptyList(), emptyList())
        engine.startDuel(definedEnemy())
        engine.proceedToQuestion()

        val asked = mutableSetOf<String>()
        repeat(3) {
            val stateBefore = engine.currentDuel.value
            assertNotNull(stateBefore)
            val q = stateBefore.currentQuestion
            assertNotNull(q)
            assertFalse(asked.contains(q.id))
            asked.add(q.id)

            engine.submitAnswer(true)
            engine.showFeedback()
            engine.proceedToNextQuestion()
        }
    }

    @Test
    fun questionSoftBanAvoidsRecentWhenPoolLargeEnough() {
        val qb = DuelQuestionBankService(Random(1)).apply { loadQuestions(sampleQuestionsJson(count = 10)) }
        val enemy = sampleEnemy()
        val recentlySeen = listOf("q1", "q2", "q3", "q4", "q5")
        val picked = qb.selectQuestion(
            enemy = enemy,
            alreadySeen = emptyList(),
            recentlySeen = recentlySeen,
            recentlyMissed = emptyList(),
            weakTopics = emptyList()
        )
        assertNotNull(picked)
        assertFalse(picked.id in recentlySeen)
    }

    @Test
    fun levelCurveMatchesSpec() {
        assertEquals(275L, PlayerProfile.xpForLevel(2))
        assertEquals(350L, PlayerProfile.xpForLevel(3))
        assertEquals(500L, PlayerProfile.xpForLevel(5))
        assertEquals(875L, PlayerProfile.xpForLevel(10))
        assertEquals(1, PlayerProfile.levelForXP(0))
        assertEquals(1, PlayerProfile.levelForXP(200))
        assertEquals(2, PlayerProfile.levelForXP(275))
    }

    @Test
    fun enemyUnlockLogicWorks() {
        val base = PlayerProfile(id = "p")
        val pleural = EnemyDefinitions.enemy("pleural-phantom")
        assertNotNull(pleural)
        assertFalse(pleural.isUnlocked(base))
        assertNotNull(pleural.lockReason(base))

        val leveled = base.copy(duelsWon = 2)
        assertTrue(pleural.isUnlocked(leveled))
        assertEquals(null, pleural.lockReason(leveled))
    }

    @Test
    fun startDuelInitializesEnemyHpFromMaxHp() {
        val qb = DuelQuestionBankService(Random(1)).apply { loadQuestions(sampleQuestionsJson(count = 1)) }
        val engine = DuelEngineService(qb, Random(1))
        val enemy = sampleEnemy().let {
            Enemy(
                id = it.id,
                name = it.name,
                title = it.title,
                description = it.description,
                iconName = it.iconName,
                themeColor = it.themeColor,
                maxHP = 77,
                topicBiases = it.topicBiases,
                unlockType = UnlockType.NONE
            )
        }
        val state = engine.startDuel(enemy)
        assertEquals(77, state.enemyMaxHP)
        assertEquals(77, state.enemyHP)
    }

    @Test
    fun masteryUpdateRuleAppliesAndClamps() {
        val profile = PlayerProfile(id = "p")
        val p1 = updateMastery(profile, topic = "Airway", isCorrect = true)
        assertEquals(0.54f, p1.topicMastery["Airway"] ?: 0f, 0.0001f)

        val p2 = updateMastery(p1, topic = "Airway", isCorrect = false)
        assertEquals(0.52f, p2.topicMastery["Airway"] ?: 0f, 0.0001f)

        val high = profile.copy(topicMastery = mapOf("X" to 0.99f))
        val high2 = updateMastery(high, topic = "X", isCorrect = true)
        assertEquals(1.0f, high2.topicMastery["X"] ?: 0f, 0.0001f)
    }

    @Test
    fun persistenceRoundTrip() {
        val data = DuelPersistenceData(
            playerProfile = PlayerProfile(id = "p", xp = 123, level = 2),
            recentDuels = emptyList(),
            recentlySeenQuestionIds = listOf("q1", "q2"),
            recentlyMissedQuestionIds = listOf("q3")
        )
        val encoded = DuelPersistenceData.encode(data)
        val decoded = DuelPersistenceData.decode(encoded)
        assertEquals(data, decoded)
        assertNotSame(data, decoded)
    }
}

```

---
### `androidApp/src/main/res/values/strings.xml`
- Size: `68` bytes
```
<resources>
    <string name="app_name">IPREP</string>
</resources>

```

---
### `androidApp/src/main/res/xml/backup_rules.xml`
- Size: `143` bytes
```
<?xml version="1.0" encoding="utf-8"?>
<full-backup-content>
    <exclude domain="sharedpref" path="device_prefs.xml"/>
</full-backup-content>

```

---
### `androidApp/src/main/java/com/russellmiller/iprep/ui/theme/Color.kt`
- Size: `288` bytes
```
package com.russellmiller.iprep.ui.theme

import androidx.compose.ui.graphics.Color

val Purple80 = Color(0xFFD0BCFF)
val PurpleGrey80 = Color(0xFFCCC2DC)
val Pink80 = Color(0xFFEFB8C8)

val Purple40 = Color(0xFF6650a4)
val PurpleGrey40 = Color(0xFF625b71)
val Pink40 = Color(0xFF7D5260)

```

---
### `androidApp/src/main/res/xml/data_extraction_rules.xml`
- Size: `382` bytes
```
<?xml version="1.0" encoding="utf-8"?>
<data-extraction-rules>
    <cloud-backup>
        <include domain="sharedpref" path="."/>
        <exclude domain="sharedpref" path="device.xml"/>
    </cloud-backup>
    <device-transfer>
        <include domain="sharedpref" path="."/>
        <exclude domain="sharedpref" path="device.xml"/>
    </device-transfer>
</data-extraction-rules>

```

---
### `androidApp/src/main/res/values/themes.xml`
- Size: `424` bytes
```
<?xml version="1.0" encoding="utf-8"?>
<resources xmlns:tools="http://schemas.android.com/tools">
    <!-- Base application theme. -->
    <style name="Base.Theme.Iprep" parent="Theme.MaterialComponents.DayNight">
        <!-- Customize your light theme here. -->
        <!-- <item name="colorPrimary">@color/my_light_primary</item> -->
    </style>

    <style name="Theme.Iprep" parent="Base.Theme.Iprep" />
</resources>

```

---
### `androidApp/src/main/AndroidManifest.xml`
- Size: `806` bytes
```
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools">

    <application
        android:allowBackup="true"
        android:label="@string/app_name"
        android:supportsRtl="true"
        android:theme="@style/Theme.Iprep"
        tools:targetApi="31">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:label="@string/app_name"
            android:theme="@style/Theme.Iprep">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>

```

---
### `androidApp/src/main/java/com/russellmiller/iprep/ui/assets/KenneyAssets.kt`
- Size: `969` bytes
```
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


```

---
### `androidApp/src/main/java/com/russellmiller/iprep/ui/theme/Type.kt`
- Size: `993` bytes
```
package com.russellmiller.iprep.ui.theme

import androidx.compose.material3.Typography
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp

// Set of Material typography styles to start with
val Typography = Typography(
    bodyLarge = TextStyle(
        fontFamily = FontFamily.Default,
        fontWeight = FontWeight.Normal,
        fontSize = 16.sp,
        lineHeight = 24.sp,
        letterSpacing = 0.5.sp
    )
    /* Other default text styles to override
    titleLarge = TextStyle(
        fontFamily = FontFamily.Default,
        fontWeight = FontWeight.Normal,
        fontSize = 22.sp,
        lineHeight = 28.sp,
        letterSpacing = 0.sp
    ),
    labelSmall = TextStyle(
        fontFamily = FontFamily.Default,
        fontWeight = FontWeight.Medium,
        fontSize = 11.sp,
        lineHeight = 16.sp,
        letterSpacing = 0.5.sp
    )
    */
)

```

---
### `androidApp/src/main/java/com/russellmiller/iprep/ui/screens/SettingsScreen.kt`
- Size: `1135` bytes
```
package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SettingsScreen(
    onNavigateBack: () -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Settings") },
                navigationIcon = {
                    TextButton(onClick = onNavigateBack) {
                        Text("Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentAlignment = Alignment.Center
        ) {
            Text(
                text = "Settings coming soon!",
                fontSize = 18.sp,
                fontWeight = FontWeight.Medium
            )
        }
    }
}

```

---
### `androidApp/src/main/java/com/russellmiller/iprep/ui/screens/AnalyticsScreen.kt`
- Size: `1138` bytes
```
package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AnalyticsScreen(
    onNavigateBack: () -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Analytics") },
                navigationIcon = {
                    TextButton(onClick = onNavigateBack) {
                        Text("Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentAlignment = Alignment.Center
        ) {
            Text(
                text = "Analytics coming soon!",
                fontSize = 18.sp,
                fontWeight = FontWeight.Medium
            )
        }
    }
}

```

---
### `androidApp/src/main/java/com/russellmiller/iprep/ui/screens/LeaderboardScreen.kt`
- Size: `1144` bytes
```
package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LeaderboardScreen(
    onNavigateBack: () -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Leaderboard") },
                navigationIcon = {
                    TextButton(onClick = onNavigateBack) {
                        Text("Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentAlignment = Alignment.Center
        ) {
            Text(
                text = "Leaderboard coming soon!",
                fontSize = 18.sp,
                fontWeight = FontWeight.Medium
            )
        }
    }
}

```

---
### `androidApp/src/main/java/com/russellmiller/iprep/MainActivity.kt`
- Size: `1158` bytes
```
package com.russellmiller.iprep

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.ui.Modifier
import androidx.navigation.compose.rememberNavController
import com.russellmiller.iprep.ui.navigation.AppNavigation
import com.russellmiller.iprep.ui.theme.IprepTheme
import com.russellmiller.iprep.shared.services.SharedAndroidResources

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        SharedAndroidResources.initialize(applicationContext)
        setContent {
            IprepTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    val navController = rememberNavController()
                    AppNavigation(navController = navController)
                }
            }
        }
    }
}

```

---
### `androidApp/src/main/java/com/russellmiller/iprep/duel/DuelStore.kt`
- Size: `1682` bytes
```
package com.russellmiller.iprep.duel

import android.content.Context
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import com.russellmiller.iprep.shared.models.CompletedDuel
import com.russellmiller.iprep.shared.models.DuelPersistenceData
import com.russellmiller.iprep.shared.models.PlayerProfile

class DuelStore(context: Context) {
    private val key = "AABIPIPREP.duelData"
    private val prefs = context.getSharedPreferences("iprep_duel", Context.MODE_PRIVATE)

    var data: DuelPersistenceData by mutableStateOf(load())
        private set

    private fun load(): DuelPersistenceData {
        val blob = prefs.getString(key, null) ?: return DuelPersistenceData.empty
        return DuelPersistenceData.decode(blob)
    }

    private fun persist() {
        prefs.edit().putString(key, DuelPersistenceData.encode(data)).apply()
    }

    fun updateProfile(profile: PlayerProfile) {
        data = data.copy(playerProfile = profile)
        persist()
    }

    fun updateRecentQuestionIds(seen: List<String>, missed: List<String>) {
        data = data.copy(
            recentlySeenQuestionIds = seen,
            recentlyMissedQuestionIds = missed
        )
        persist()
    }

    fun addCompletedDuel(duel: CompletedDuel) {
        val updated = (listOf(duel) + data.recentDuels).take(20)
        data = data.copy(recentDuels = updated)
        persist()
    }

    fun weakTopics(limit: Int = 3): List<String> {
        return data.playerProfile.topicMastery
            .entries
            .sortedBy { it.value }
            .take(limit)
            .map { it.key }
    }
}


```

---
### `androidApp/src/main/java/com/russellmiller/iprep/ui/theme/Theme.kt`
- Size: `2191` bytes
```
package com.russellmiller.iprep.ui.theme

import android.app.Activity
import android.os.Build
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.dynamicDarkColorScheme
import androidx.compose.material3.dynamicLightColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.SideEffect
import androidx.compose.ui.graphics.toArgb
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalView
import androidx.core.view.WindowCompat

private val DarkColorScheme = darkColorScheme(
    primary = Purple80,
    secondary = PurpleGrey80,
    tertiary = Pink80
)

private val LightColorScheme = lightColorScheme(
    primary = Purple40,
    secondary = PurpleGrey40,
    tertiary = Pink40

    /* Other default colors to override
    background = Color(0xFFFFFBFE),
    surface = Color(0xFFFFFBFE),
    onPrimary = Color.White,
    onSecondary = Color.White,
    onTertiary = Color.White,
    onBackground = Color(0xFF1C1B1F),
    onSurface = Color(0xFF1C1B1F),
    */
)

@Composable
fun IprepTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    // Dynamic color is available on Android 12+
    dynamicColor: Boolean = true,
    content: @Composable () -> Unit
) {
    val colorScheme = when {
        dynamicColor && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S -> {
            val context = LocalContext.current
            if (darkTheme) dynamicDarkColorScheme(context) else dynamicLightColorScheme(context)
        }

        darkTheme -> DarkColorScheme
        else -> LightColorScheme
    }
    val view = LocalView.current
    if (!view.isInEditMode) {
        SideEffect {
            val window = (view.context as Activity).window
            window.statusBarColor = colorScheme.primary.toArgb()
            WindowCompat.getInsetsController(window, view).isAppearanceLightStatusBars = darkTheme
        }
    }

    MaterialTheme(
        colorScheme = colorScheme,
        typography = Typography,
        content = content
    )
}

```

---
### `androidApp/src/main/java/com/russellmiller/iprep/ui/screens/CrosswordPuzzleScreen.kt`
- Size: `2259` bytes
```
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

```

---
### `androidApp/src/main/java/com/russellmiller/iprep/ui/screens/ReviewScreen.kt`
- Size: `3049` bytes
```
package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.russellmiller.iprep.shared.AppEnvironment

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ReviewScreen(
    onNavigateBack: () -> Unit
) {
    val appEnvironment = AppEnvironment.shared
    val sessionResults = remember { appEnvironment.quizSessionService.getSessionResults() }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Quiz Results") },
                navigationIcon = {
                    TextButton(onClick = onNavigateBack) {
                        Text("Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        if (sessionResults != null) {
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
                    .padding(16.dp),
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                Card(
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "Quiz Complete!",
                            fontSize = 24.sp,
                            fontWeight = FontWeight.Bold
                        )
                        Spacer(modifier = Modifier.height(16.dp))
                        Text(
                            text = "Score: ${sessionResults.score}/${sessionResults.totalQuestions}",
                            fontSize = 18.sp,
                            fontWeight = FontWeight.Medium
                        )
                        Text(
                            text = "Accuracy: ${(sessionResults.accuracy * 100).toInt()}%",
                            fontSize = 16.sp
                        )
                        Text(
                            text = "Time: ${sessionResults.timeSpent / 1000}s",
                            fontSize = 16.sp
                        )
                    }
                }
                
                Button(
                    onClick = onNavigateBack,
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text("Return to Home")
                }
            }
        } else {
            Box(
                modifier = Modifier.fillMaxSize(),
                contentAlignment = Alignment.Center
            ) {
                Text("No quiz results available")
            }
        }
    }
}

```

---
### `androidApp/src/main/java/com/russellmiller/iprep/ui/screens/CrosswordListScreen.kt`
- Size: `3246` bytes
```
package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Card
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

private data class CrosswordPuzzle(
    val id: String,
    val title: String,
    val subtitle: String
)

private val crosswordPuzzles = listOf(
    CrosswordPuzzle(
        id = "crossword1",
        title = "Interventional Pulmonology Board Review",
        subtitle = "Interactive crossword • High-yield concepts"
    ),
    CrosswordPuzzle(
        id = "crossword2",
        title = "IP Board Review Crossword",
        subtitle = "Interactive crossword • Mixed topics"
    ),
    CrosswordPuzzle(
        id = "crossword3",
        title = "Interventional & Pleural Crossword",
        subtitle = "Interactive crossword • Interventional + pleural"
    )
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CrosswordListScreen(
    onNavigateBack: () -> Unit,
    onOpenPuzzle: (String) -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Crossword Puzzles") },
                navigationIcon = {
                    TextButton(onClick = onNavigateBack) {
                        Text("Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            items(crosswordPuzzles) { puzzle ->
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    onClick = { onOpenPuzzle(puzzle.id) }
                ) {
                    Column(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        horizontalAlignment = Alignment.Start
                    ) {
                        Text(
                            text = puzzle.title,
                            fontSize = 16.sp,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = puzzle.subtitle,
                            fontSize = 14.sp
                        )
                    }
                }
            }
        }
    }
}


```

---
### `androidApp/src/main/java/com/russellmiller/iprep/ui/navigation/AppNavigation.kt`
- Size: `3839` bytes
```
package com.russellmiller.iprep.ui.navigation

import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.compose.ui.platform.LocalContext
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import com.russellmiller.iprep.duel.DuelStore
import com.russellmiller.iprep.shared.AppEnvironment
import com.russellmiller.iprep.ui.screens.*

@Composable
fun AppNavigation(navController: NavHostController) {
    val context = LocalContext.current
    val duelStore = remember { DuelStore(context) }
    val appEnvironment = AppEnvironment.shared

    NavHost(
        navController = navController,
        startDestination = "landing"
    ) {
        composable("landing") {
            LandingScreen(
                onNavigateToQuiz = { navController.navigate("quiz") },
                onNavigateToDashboard = { navController.navigate("dashboard") },
                onNavigateToAnalytics = { navController.navigate("analytics") },
                onNavigateToLeaderboard = { navController.navigate("leaderboard") },
                onNavigateToDuel = { navController.navigate("duel_enemy_select") },
                onNavigateToCrosswords = { navController.navigate("crosswords") }
            )
        }
        
        composable("dashboard") {
            DashboardScreen(
                onNavigateBack = { navController.popBackStack() },
                onNavigateToQuiz = { navController.navigate("quiz") },
                onNavigateToAnalytics = { navController.navigate("analytics") }
            )
        }
        
        composable("quiz") {
            QuizScreen(
                onNavigateBack = { navController.popBackStack() },
                onNavigateToReview = { navController.navigate("review") }
            )
        }
        
        composable("review") {
            ReviewScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }
        
        composable("analytics") {
            AnalyticsScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }
        
        composable("leaderboard") {
            LeaderboardScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }

        composable("crosswords") {
            CrosswordListScreen(
                onNavigateBack = { navController.popBackStack() },
                onOpenPuzzle = { puzzleId ->
                    navController.navigate("crossword/$puzzleId")
                }
            )
        }

        composable("crossword/{puzzleId}") { backStackEntry ->
            val puzzleId = backStackEntry.arguments?.getString("puzzleId") ?: return@composable
            CrosswordPuzzleScreen(
                puzzleId = puzzleId,
                onNavigateBack = { navController.popBackStack() }
            )
        }

        composable("settings") {
            SettingsScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }

        composable("duel_enemy_select") {
            EnemySelectScreen(
                duelStore = duelStore,
                onNavigateBack = { navController.popBackStack() },
                onSelectEnemy = { enemyId ->
                    navController.navigate("duel/$enemyId")
                }
            )
        }

        composable("duel/{enemyId}") { backStackEntry ->
            val enemyId = backStackEntry.arguments?.getString("enemyId") ?: return@composable
            DuelScreen(
                enemyId = enemyId,
                duelStore = duelStore,
                appEnvironment = appEnvironment,
                onNavigateBack = { navController.popBackStack() }
            )
        }
    }
}

```

---
### `androidApp/src/main/java/com/russellmiller/iprep/ui/screens/EnemySelectScreen.kt`
- Size: `3913` bytes
```
package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Lock
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.russellmiller.iprep.duel.DuelStore
import com.russellmiller.iprep.shared.models.Enemy
import com.russellmiller.iprep.shared.models.EnemyDefinitions
import com.russellmiller.iprep.shared.models.PlayerProfile

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnemySelectScreen(
    duelStore: DuelStore,
    onNavigateBack: () -> Unit,
    onSelectEnemy: (String) -> Unit
) {
    val profile = duelStore.data.playerProfile
    val enemies = EnemyDefinitions.allEnemies

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Clinical Duel") },
                navigationIcon = {
                    TextButton(onClick = onNavigateBack) { Text("Back") }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Text("Choose your opponent", style = MaterialTheme.typography.titleLarge)
            Text("Level ${profile.level} • ${profile.xp} XP", style = MaterialTheme.typography.bodyMedium)

            LazyVerticalGrid(
                columns = GridCells.Adaptive(minSize = 160.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp),
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                modifier = Modifier.fillMaxSize()
            ) {
                items(enemies, key = { it.id }) { enemy ->
                    EnemyCard(
                        enemy = enemy,
                        profile = profile,
                        onClick = { onSelectEnemy(enemy.id) }
                    )
                }
            }
        }
    }
}

@Composable
@OptIn(ExperimentalMaterial3Api::class)
private fun EnemyCard(
    enemy: Enemy,
    profile: PlayerProfile,
    onClick: () -> Unit
) {
    val unlocked = enemy.isUnlocked(profile)
    val reason = enemy.lockReason(profile)

    Card(
        modifier = Modifier.fillMaxWidth(),
        onClick = { if (unlocked) onClick() },
        enabled = unlocked
    ) {
        Column(
            modifier = Modifier.padding(14.dp),
            verticalArrangement = Arrangement.spacedBy(6.dp)
        ) {
            Text(enemy.name, style = MaterialTheme.typography.titleMedium)
            Text(enemy.title, style = MaterialTheme.typography.bodyMedium, color = MaterialTheme.colorScheme.onSurfaceVariant)
            Spacer(Modifier.height(4.dp))
            Text(enemy.description, style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
            if (!unlocked && reason != null) {
                Spacer(Modifier.height(6.dp))
                Text(reason, style = MaterialTheme.typography.labelMedium, color = MaterialTheme.colorScheme.onSurfaceVariant)
            }
            if (!unlocked) {
                Spacer(Modifier.height(8.dp))
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(6.dp)
                ) {
                    Icon(imageVector = Icons.Filled.Lock, contentDescription = null)
                    Text("Locked", style = MaterialTheme.typography.labelMedium)
                }
            }
        }
    }
}

```

---
### `androidApp/src/main/java/com/russellmiller/iprep/ui/screens/DashboardScreen.kt`
- Size: `4234` bytes
```
package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.russellmiller.iprep.shared.AppEnvironment

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DashboardScreen(
    onNavigateBack: () -> Unit,
    onNavigateToQuiz: () -> Unit,
    onNavigateToAnalytics: () -> Unit
) {
    val appEnvironment = AppEnvironment.shared
    val overallProgress by remember { mutableStateOf(appEnvironment.studyPlannerService.getOverallProgress()) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Dashboard") },
                navigationIcon = {
                    TextButton(onClick = onNavigateBack) {
                        Text("Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            item {
                Card(
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "Overall Progress",
                            fontSize = 18.sp,
                            fontWeight = FontWeight.Bold
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = "${overallProgress.answeredQuestions}/${overallProgress.totalQuestions} questions answered",
                            fontSize = 14.sp
                        )
                        Text(
                            text = "${(overallProgress.completionPercentage * 100).toInt()}% complete",
                            fontSize = 14.sp
                        )
                        Text(
                            text = "${(overallProgress.accuracy * 100).toInt()}% accuracy",
                            fontSize = 14.sp
                        )
                    }
                }
            }
            
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    onClick = onNavigateToQuiz
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "Continue Studying",
                            fontSize = 16.sp,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "Start a new practice session",
                            fontSize = 14.sp
                        )
                    }
                }
            }
            
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    onClick = onNavigateToAnalytics
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "View Analytics",
                            fontSize = 16.sp,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "Detailed progress reports",
                            fontSize = 14.sp
                        )
                    }
                }
            }
        }
    }
}

```

---
### `androidApp/src/main/java/com/russellmiller/iprep/ui/screens/QuizScreen.kt`
- Size: `6713` bytes
```
package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.russellmiller.iprep.shared.AppEnvironment
import com.russellmiller.iprep.shared.models.QuizMode
import com.russellmiller.iprep.shared.models.QuizSessionConfiguration

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun QuizScreen(
    onNavigateBack: () -> Unit,
    onNavigateToReview: () -> Unit
) {
    val appEnvironment = AppEnvironment.shared
    var currentQuestionIndex by remember { mutableIntStateOf(0) }
    var selectedAnswer by remember { mutableStateOf<String?>(null) }
    var isAnswered by remember { mutableStateOf(false) }
    
    // Start a quick quiz session
    val session = remember {
        appEnvironment.quizSessionService.startSession(
            QuizSessionConfiguration(
                mode = QuizMode.QuickStart(resume = false),
                questionLimit = 5
            )
        )
    }
    
    val currentQuestion = session.questions.getOrNull(currentQuestionIndex)
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Quiz") },
                navigationIcon = {
                    TextButton(onClick = onNavigateBack) {
                        Text("Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        if (currentQuestion != null) {
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
                    .padding(16.dp)
            ) {
                // Progress indicator
                LinearProgressIndicator(
                    progress = (currentQuestionIndex + 1).toFloat() / session.questions.size,
                    modifier = Modifier.fillMaxWidth()
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                // Question number and progress
                Text(
                    text = "Question ${currentQuestionIndex + 1} of ${session.questions.size}",
                    fontSize = 14.sp,
                    fontWeight = FontWeight.Medium
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                // Question prompt
                Card(
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Text(
                            text = currentQuestion.question.prompt,
                            fontSize = 16.sp,
                            fontWeight = FontWeight.Medium
                        )
                    }
                }
                
                Spacer(modifier = Modifier.height(16.dp))
                
                // Answer options
                LazyColumn(
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(currentQuestion.question.options) { option ->
                        Card(
                            modifier = Modifier.fillMaxWidth(),
                            onClick = {
                                if (!isAnswered) {
                                    selectedAnswer = option.id
                                    isAnswered = true
                                    appEnvironment.quizSessionService.answerQuestion(
                                        currentQuestion.question.id,
                                        option.id
                                    )
                                }
                            }
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(16.dp),
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                RadioButton(
                                    selected = selectedAnswer == option.id,
                                    onClick = null
                                )
                                Spacer(modifier = Modifier.width(8.dp))
                                Text(
                                    text = option.text,
                                    fontSize = 14.sp
                                )
                            }
                        }
                    }
                }
                
                Spacer(modifier = Modifier.weight(1f))
                
                // Navigation buttons
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Button(
                        onClick = {
                            if (currentQuestionIndex > 0) {
                                currentQuestionIndex--
                                selectedAnswer = null
                                isAnswered = false
                            }
                        },
                        enabled = currentQuestionIndex > 0
                    ) {
                        Text("Previous")
                    }
                    
                    Button(
                        onClick = {
                            if (currentQuestionIndex < session.questions.size - 1) {
                                currentQuestionIndex++
                                selectedAnswer = null
                                isAnswered = false
                            } else {
                                onNavigateToReview()
                            }
                        },
                        enabled = isAnswered
                    ) {
                        Text(
                            if (currentQuestionIndex < session.questions.size - 1) "Next" else "Finish"
                        )
                    }
                }
            }
        } else {
            Box(
                modifier = Modifier.fillMaxSize(),
                contentAlignment = Alignment.Center
            ) {
                Text("No questions available")
            }
        }
    }
}

```

---
### `androidApp/src/main/java/com/russellmiller/iprep/ui/screens/LandingScreen.kt`
- Size: `7331` bytes
```
package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.russellmiller.iprep.shared.AppEnvironment
import com.russellmiller.iprep.shared.models.Module

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LandingScreen(
    onNavigateToQuiz: () -> Unit,
    onNavigateToDashboard: () -> Unit,
    onNavigateToAnalytics: () -> Unit,
    onNavigateToLeaderboard: () -> Unit,
    onNavigateToDuel: () -> Unit,
    onNavigateToCrosswords: () -> Unit
) {
    val appEnvironment = AppEnvironment.shared
    val modules by remember { mutableStateOf(appEnvironment.questionBankService.moduleSummaries()) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("IPREP") }
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            item {
                Card(
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "Quick Start",
                            fontSize = 20.sp,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "Start a practice session with random questions",
                            textAlign = TextAlign.Center
                        )
                        Button(onClick = onNavigateToQuiz) {
                            Text("Start Quiz")
                        }
                    }
                }
            }
            
            item {
                Card(
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "Dashboard",
                            fontSize = 20.sp,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "View your progress and study statistics",
                            textAlign = TextAlign.Center
                        )
                        Button(onClick = onNavigateToDashboard) {
                            Text("View Dashboard")
                        }
                    }
                }
            }

            item {
                Card(
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "Clinical Duel",
                            fontSize = 20.sp,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "Battle themed enemies by answering True/False questions",
                            textAlign = TextAlign.Center
                        )
                        Button(onClick = onNavigateToDuel) {
                            Text("Start Duel")
                        }
                    }
                }
            }

            item {
                Card(
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "Crossword Puzzles",
                            fontSize = 20.sp,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "Practice high-yield IP concepts with interactive crosswords",
                            textAlign = TextAlign.Center
                        )
                        Button(onClick = onNavigateToCrosswords) {
                            Text("Open Crosswords")
                        }
                    }
                }
            }

            item {
                Text(
                    text = "Study Modules",
                    fontSize = 18.sp,
                    fontWeight = FontWeight.Bold
                )
            }
            
            items(modules) { module ->
                ModuleCard(
                    module = module,
                    onClick = { onNavigateToQuiz() }
                )
            }
            
            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceEvenly
                ) {
                    Button(onClick = onNavigateToAnalytics) {
                        Text("Analytics")
                    }
                    Button(onClick = onNavigateToLeaderboard) {
                        Text("Leaderboard")
                    }
                }
            }
        }
    }
}

@Composable
fun ModuleCard(
    module: Module,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = module.title,
                fontSize = 16.sp,
                fontWeight = FontWeight.Bold
            )
            Text(
                text = module.description,
                fontSize = 14.sp
            )
            Spacer(modifier = Modifier.height(8.dp))
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text(
                    text = "${module.questionCount} questions",
                    fontSize = 12.sp
                )
                Text(
                    text = "${module.estimatedTimeMinutes} min",
                    fontSize = 12.sp
                )
                Text(
                    text = module.difficulty.value,
                    fontSize = 12.sp
                )
            }
            Spacer(modifier = Modifier.height(8.dp))
            Button(
                onClick = onClick,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text("Start Module")
            }
        }
    }
}

```

---
### `androidApp/src/main/java/com/russellmiller/iprep/ui/screens/DuelScreen.kt`
- Size: `30762` bytes
```
package com.russellmiller.iprep.ui.screens

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.core.Animatable
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.animateDpAsState
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.animation.slideInVertically
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Bolt
import androidx.compose.material.icons.filled.Person
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.clipToBounds
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.ColorFilter
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.russellmiller.iprep.duel.DuelStore
import com.russellmiller.iprep.shared.AppEnvironment
import com.russellmiller.iprep.shared.models.DuelPhase
import com.russellmiller.iprep.shared.models.Enemy
import com.russellmiller.iprep.shared.models.EnemyDefinitions
import com.russellmiller.iprep.shared.models.PlayerProfile
import com.russellmiller.iprep.shared.models.updateMastery
import com.russellmiller.iprep.ui.assets.rememberKenneyImageBitmap
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.max
import kotlin.math.sin

sealed class BattleEvent {
    data object PlayerAttack : BattleEvent()
    data object EnemyAttack : BattleEvent()
    data class EnemyHit(val damage: Int, val isCrit: Boolean) : BattleEvent()
    data class PlayerHit(val damage: Int) : BattleEvent()
    data object None : BattleEvent()
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DuelScreen(
    enemyId: String,
    duelStore: DuelStore,
    appEnvironment: AppEnvironment,
    onNavigateBack: () -> Unit
) {
    val engine = appEnvironment.duelEngineService
    val duelState by engine.currentDuel.collectAsState(initial = null)

    var isResolving by remember { mutableStateOf(false) }
    var battleEvent by remember { mutableStateOf<BattleEvent>(BattleEvent.None) }
    var recordedDuelId by remember { mutableStateOf<String?>(null) }
    val scope = rememberCoroutineScope()

    LaunchedEffect(enemyId) {
        val enemy = EnemyDefinitions.enemy(enemyId) ?: return@LaunchedEffect
        engine.setPlayerContext(
            recentSeen = duelStore.data.recentlySeenQuestionIds,
            recentMissed = duelStore.data.recentlyMissedQuestionIds,
            weakTopics = duelStore.weakTopics()
        )
        recordedDuelId = null
        engine.startDuel(enemy)
    }

    DisposableEffect(enemyId) {
        onDispose {
            engine.endDuel()
        }
    }

    // Persist duel completion once.
    LaunchedEffect(duelState?.phase) {
        val duel = duelState ?: return@LaunchedEffect
        if (duel.phase != DuelPhase.END) return@LaunchedEffect
        val completed = engine.getCompletedDuel() ?: return@LaunchedEffect
        if (recordedDuelId == completed.id) return@LaunchedEffect
        recordedDuelId = completed.id

        val base = duelStore.data.playerProfile
        val updated = applyCompletedDuelToProfile(base, completed.enemyId, completed.won, completed.xpEarned, completed.maxStreak)
        duelStore.updateProfile(updated)
        duelStore.addCompletedDuel(completed)
        duelStore.updateRecentQuestionIds(engine.recentlySeenQuestionIds(), engine.recentlyMissedQuestionIds())
    }

    LaunchedEffect(duelState?.lastAnswer) {
        val duel = duelState ?: run {
            battleEvent = BattleEvent.None
            return@LaunchedEffect
        }

        val result = duel.lastAnswer ?: run {
            battleEvent = BattleEvent.None
            return@LaunchedEffect
        }

        if (result.questionId != duel.currentQuestion?.id) return@LaunchedEffect

        if (result.isCorrect) {
            battleEvent = BattleEvent.PlayerAttack
            delay(400)
            battleEvent = BattleEvent.EnemyHit(damage = result.damageDealt, isCrit = result.wasCrit)
        } else {
            battleEvent = BattleEvent.EnemyAttack
            delay(400)
            battleEvent = BattleEvent.PlayerHit(damage = result.damageTaken)
        }

        delay(1000)
        battleEvent = BattleEvent.None
    }

    val enemy = duelState?.enemy ?: EnemyDefinitions.enemy(enemyId)

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(enemy?.displayName ?: "Clinical Duel") },
                navigationIcon = {
                    TextButton(onClick = onNavigateBack) { Text("Back") }
                }
            )
        }
    ) { padding ->
        val duel = duelState
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            if (duel != null && enemy != null) {
                DuelArena(duel = duel, enemy = enemy, battleEvent = battleEvent)
            }

            val contentModifier = Modifier
                .fillMaxWidth()
                .weight(1f)
                .padding(16.dp)

            when (duel?.phase) {
                null -> {
                    Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                        CircularProgressIndicator()
                    }
                }

                DuelPhase.INTRO -> {
                    IntroPanel(
                        modifier = contentModifier,
                        enemyName = enemy?.displayName ?: enemyId,
                        enemyDescription = enemy?.description ?: "",
                        onStart = { engine.proceedToQuestion() }
                    )
                }

                DuelPhase.QUESTION -> {
                    QuestionPanel(
                        modifier = contentModifier,
                        duel = duel,
                        isResolving = isResolving,
                        onHint = { engine.useHint() },
                        onShield = { engine.useShield() },
                        onDoubleTap = { engine.useDoubleTap() },
                        onAnswer = { answer ->
                            val current = duelState ?: return@QuestionPanel
                            val q = current.currentQuestion ?: return@QuestionPanel
                            val topic = q.topic

                            val priorStreak = current.currentStreak
                            val newStreak = if (answer == q.answer) priorStreak + 1 else 0

                            val result = engine.submitAnswer(answer) ?: return@QuestionPanel
                            val updatedProfile = applyAnswerToProfile(duelStore.data.playerProfile, topic, result.isCorrect, newStreak)
                            duelStore.updateProfile(updatedProfile)
                            duelStore.updateRecentQuestionIds(engine.recentlySeenQuestionIds(), engine.recentlyMissedQuestionIds())

                            isResolving = true
                            scope.launch {
                                delay(1500)
                                engine.showFeedback()
                                isResolving = false
                            }
                        }
                    )
                }

                DuelPhase.FEEDBACK -> {
                    FeedbackPanel(
                        modifier = contentModifier,
                        duel = duel,
                        onNext = { engine.proceedToNextQuestion() }
                    )
                }

                DuelPhase.END -> {
                    EndPanel(
                        modifier = contentModifier,
                        duel = duel,
                        onDone = {
                            engine.endDuel()
                            onNavigateBack()
                        }
                    )
                }
            }
        }
    }
}

private fun applyAnswerToProfile(profile: PlayerProfile, topic: String, isCorrect: Boolean, newStreak: Int): PlayerProfile {
    val mastered = updateMastery(profile, topic, isCorrect)
    val answered = mastered.totalAnswered + 1
    val correct = mastered.totalCorrect + if (isCorrect) 1 else 0
    val longest = max(mastered.longestStreak, newStreak)
    return mastered.copy(
        totalAnswered = answered,
        totalCorrect = correct,
        longestStreak = longest
    )
}

private fun applyCompletedDuelToProfile(
    profile: PlayerProfile,
    enemyId: String,
    won: Boolean,
    xpEarned: Long,
    maxStreak: Int
): PlayerProfile {
    val newXP = profile.xp + xpEarned
    val newLevel = PlayerProfile.levelForXP(newXP)
    val duelsWon = profile.duelsWon + if (won) 1 else 0
    val duelsLost = profile.duelsLost + if (won) 0 else 1
    val defeated = if (won) profile.defeatedEnemies + enemyId else profile.defeatedEnemies
    val longest = max(profile.longestStreak, maxStreak)
    return profile.copy(
        xp = newXP,
        level = newLevel,
        duelsWon = duelsWon,
        duelsLost = duelsLost,
        defeatedEnemies = defeated,
        longestStreak = longest
    )
}

@Composable
private fun IntroPanel(
    modifier: Modifier,
    enemyName: String,
    enemyDescription: String,
    onStart: () -> Unit
) {
    Column(
        modifier = modifier,
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        Text(enemyName, style = MaterialTheme.typography.headlineMedium, fontWeight = FontWeight.Bold)
        if (enemyDescription.isNotEmpty()) {
            Text(enemyDescription, style = MaterialTheme.typography.bodyMedium, color = MaterialTheme.colorScheme.onSurfaceVariant)
        }
        Spacer(modifier = Modifier.weight(1f))
        Button(onClick = onStart, modifier = Modifier.fillMaxWidth()) {
            Text("Begin Duel")
        }
    }
}

@Composable
private fun QuestionPanel(
    modifier: Modifier,
    duel: com.russellmiller.iprep.shared.models.DuelState?,
    isResolving: Boolean,
    onHint: () -> Unit,
    onShield: () -> Unit,
    onDoubleTap: () -> Unit,
    onAnswer: (Boolean) -> Unit
) {
    val q = duel?.currentQuestion
    if (duel == null || q == null) {
        Box(modifier = modifier, contentAlignment = Alignment.Center) {
            Text("No questions available")
        }
        return
    }

    Column(modifier = modifier, verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween) {
            Text("Streak: ${duel.currentStreak}", style = MaterialTheme.typography.labelLarge)
            Text("XP: ${duel.xpEarned}", style = MaterialTheme.typography.labelLarge)
        }

        Card(modifier = Modifier.fillMaxWidth()) {
            Column(modifier = Modifier.padding(16.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text(q.topic, style = MaterialTheme.typography.labelMedium, color = MaterialTheme.colorScheme.onSurfaceVariant)
                Text(q.statement, style = MaterialTheme.typography.titleLarge)
                if (duel.showingHint) {
                    Text(q.hint, style = MaterialTheme.typography.bodySmall, color = MaterialTheme.colorScheme.onSurfaceVariant)
                }
            }
        }

        Row(horizontalArrangement = Arrangement.spacedBy(10.dp), modifier = Modifier.fillMaxWidth()) {
            OutlinedButton(
                onClick = onHint,
                enabled = !duel.lifelines.hintUsed,
                modifier = Modifier.weight(1f)
            ) { Text("Hint") }

            OutlinedButton(
                onClick = onShield,
                enabled = !duel.lifelines.shieldUsed,
                modifier = Modifier.weight(1f)
            ) { Text(if (duel.lifelines.shieldActive) "Shield (Armed)" else "Shield") }

            OutlinedButton(
                onClick = onDoubleTap,
                enabled = !duel.lifelines.doubleTapUsed,
                modifier = Modifier.weight(1f)
            ) { Text(if (duel.lifelines.doubleTapActive) "Double (Armed)" else "Double") }
        }

        Row(horizontalArrangement = Arrangement.spacedBy(12.dp), modifier = Modifier.fillMaxWidth()) {
            Button(
                onClick = { onAnswer(true) },
                enabled = !isResolving,
                modifier = Modifier.weight(1f)
            ) { Text("TRUE") }
            Button(
                onClick = { onAnswer(false) },
                enabled = !isResolving,
                modifier = Modifier.weight(1f)
            ) { Text("FALSE") }
        }

        if (isResolving) {
            LinearProgressIndicator(modifier = Modifier.fillMaxWidth())
        }
    }
}

@Composable
private fun FeedbackPanel(
    modifier: Modifier,
    duel: com.russellmiller.iprep.shared.models.DuelState?,
    onNext: () -> Unit
) {
    val q = duel?.currentQuestion
    val last = duel?.lastAnswer
    if (duel == null || q == null || last == null) {
        Box(modifier = modifier, contentAlignment = Alignment.Center) {
            Text("Loading…")
        }
        return
    }

    Column(modifier = modifier, verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Text(if (last.isCorrect) "Correct" else "Incorrect", style = MaterialTheme.typography.headlineSmall, fontWeight = FontWeight.Bold)
        Text(q.explanation, style = MaterialTheme.typography.bodyMedium)
        Spacer(modifier = Modifier.weight(1f))
        Button(onClick = onNext, modifier = Modifier.fillMaxWidth()) {
            Text("Next Question")
        }
    }
}

@Composable
private fun EndPanel(
    modifier: Modifier,
    duel: com.russellmiller.iprep.shared.models.DuelState?,
    onDone: () -> Unit
) {
    if (duel == null) {
        Box(modifier = modifier, contentAlignment = Alignment.Center) {
            Text("Duel complete")
        }
        return
    }

    Column(modifier = modifier, verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Text(
            if (duel.isPlayerVictory) "Victory!" else "Defeat",
            style = MaterialTheme.typography.headlineMedium,
            fontWeight = FontWeight.Bold
        )
        Text("XP Earned: ${duel.xpEarned}", style = MaterialTheme.typography.bodyMedium)
        Text("Correct: ${duel.correctCount} • Incorrect: ${duel.incorrectCount}", style = MaterialTheme.typography.bodyMedium)
        Text("Max Streak: ${duel.maxStreak}", style = MaterialTheme.typography.bodyMedium)
        Spacer(modifier = Modifier.weight(1f))
        Button(onClick = onDone, modifier = Modifier.fillMaxWidth()) {
            Text("Done")
        }
    }
}

@Composable
private fun DuelArena(
    duel: com.russellmiller.iprep.shared.models.DuelState,
    enemy: Enemy,
    battleEvent: BattleEvent
) {
    val enemyTheme = remember(enemy.themeColor) { parseColorOrFallback(enemy.themeColor, fallback = Color(0xFFE63946)) }
    val arenaBg = rememberKenneyImageBitmap("bg.arena.clinic_01")
    val enemySprite = rememberKenneyImageBitmap("char.enemy.virus_01")
    val heroSprite = rememberKenneyImageBitmap("char.hero.medic")
    val hitVfx = rememberKenneyImageBitmap("vfx.hit.small")
    val healVfx = rememberKenneyImageBitmap("vfx.heal.burst")

    val infinite = rememberInfiniteTransition(label = "arena-parallax")
    val pFar by infinite.animateFloat(
        initialValue = 0f,
        targetValue = 1f,
        animationSpec = infiniteRepeatable(animation = tween(durationMillis = 24000, easing = LinearEasing)),
        label = "pFar"
    )
    val pMid by infinite.animateFloat(
        initialValue = 0f,
        targetValue = 1f,
        animationSpec = infiniteRepeatable(animation = tween(durationMillis = 18000, easing = LinearEasing)),
        label = "pMid"
    )
    val pNear by infinite.animateFloat(
        initialValue = 0f,
        targetValue = 1f,
        animationSpec = infiniteRepeatable(animation = tween(durationMillis = 12000, easing = LinearEasing)),
        label = "pNear"
    )

    val shakePhase = remember { Animatable(0f) }
    var shakeAmount by remember { mutableStateOf(0f) }
    LaunchedEffect(battleEvent) {
        val intensity = when (battleEvent) {
            is BattleEvent.EnemyHit -> {
                val e = battleEvent as BattleEvent.EnemyHit
                (e.damage / 10f) + (if (e.isCrit) 2.5f else 0f)
            }
            is BattleEvent.PlayerHit -> (battleEvent as BattleEvent.PlayerHit).damage / 10f + 1f
            else -> 0f
        }
        if (intensity > 0.1f) {
            shakeAmount = intensity.coerceAtMost(8f)
            shakePhase.snapTo(0f)
            shakePhase.animateTo(1f, animationSpec = tween(durationMillis = 450, easing = LinearEasing))
        }
    }
    val shakeX = (sin(shakePhase.value.toDouble() * PI * 2.0 * 6.0) * shakeAmount).toFloat()
    val shakeY = (sin(shakePhase.value.toDouble() * PI * 2.0 * 4.0) * (shakeAmount * 0.7f)).toFloat()

    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(280.dp)
            .graphicsLayer {
                translationX = shakeX
                translationY = shakeY
            }
    ) {
        if (arenaBg != null) {
            val farX = (sin(pFar.toDouble() * PI * 2.0) * 14.0).toFloat()
            val farY = (cos(pFar.toDouble() * PI * 2.0) * 10.0).toFloat()
            Image(
                bitmap = arenaBg,
                contentDescription = null,
                contentScale = ContentScale.FillBounds,
                modifier = Modifier
                    .matchParentSize()
                    .graphicsLayer {
                        translationX = farX
                        translationY = farY
                        scaleX = 1.6f
                        scaleY = 1.6f
                        rotationZ = 0.35f
                    }
                    .alpha(0.12f)
            )

            val midX = (sin((pMid + 0.2f).toDouble() * PI * 2.0) * 10.0).toFloat()
            val midY = (cos((pMid + 0.2f).toDouble() * PI * 2.0) * 8.0).toFloat()
            Image(
                bitmap = arenaBg,
                contentDescription = null,
                contentScale = ContentScale.FillBounds,
                modifier = Modifier
                    .matchParentSize()
                    .graphicsLayer {
                        translationX = midX
                        translationY = midY
                        scaleX = 1.35f
                        scaleY = 1.35f
                        rotationZ = -0.2f
                    }
                    .alpha(0.16f)
            )

            val nearX = (sin((pNear + 0.45f).toDouble() * PI * 2.0) * 6.0).toFloat()
            val nearY = (cos((pNear + 0.45f).toDouble() * PI * 2.0) * 5.0).toFloat()
            Image(
                bitmap = arenaBg,
                contentDescription = null,
                contentScale = ContentScale.FillBounds,
                modifier = Modifier
                    .matchParentSize()
                    .graphicsLayer {
                        translationX = nearX
                        translationY = nearY
                        scaleX = 1.15f
                        scaleY = 1.15f
                    }
                    .alpha(0.22f)
            )
        }

        Box(
            modifier = Modifier
                .matchParentSize()
                .background(
                    brush = Brush.linearGradient(
                        colors = listOf(enemyTheme.copy(alpha = 0.35f), Color.Black.copy(alpha = 0.85f)),
                        start = androidx.compose.ui.geometry.Offset(0f, 0f),
                        end = androidx.compose.ui.geometry.Offset(800f, 600f)
                    )
                )
        )

        // Light source (top-left) + vignette
        Box(
            modifier = Modifier
                .matchParentSize()
                .background(
                    Brush.radialGradient(
                        colors = listOf(enemyTheme.copy(alpha = 0.28f), Color.Transparent),
                        center = androidx.compose.ui.geometry.Offset(0f, 0f),
                        radius = 600f
                    )
                )
        )
        Box(
            modifier = Modifier
                .matchParentSize()
                .background(
                    Brush.radialGradient(
                        colors = listOf(Color.Transparent, Color.Black.copy(alpha = 0.55f)),
                        radius = 650f
                    )
                )
        )

        Column(
            modifier = Modifier
                .align(Alignment.TopEnd)
                .padding(top = 32.dp, end = 24.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(10.dp)) {
                KenneyHPBar(current = duel.enemyHP, max = duel.enemyMaxHP, tint = Color.Red)
                PortraitBadge(
                    bitmap = enemySprite,
                    tint = enemyTheme,
                    fallback = Icons.Filled.Bolt
                )
            }
            Spacer(Modifier.height(8.dp))

            val attackOffset by animateDpAsState(if (battleEvent is BattleEvent.EnemyAttack) 50.dp else 0.dp)
            val hitAlpha by animateFloatAsState(if (battleEvent is BattleEvent.EnemyHit) 0.5f else 1f)

            Box(
                modifier = Modifier
                    .offset(x = -attackOffset, y = attackOffset)
                    .alpha(hitAlpha)
            ) {
                GroundPlane(tint = enemyTheme, modifier = Modifier.align(Alignment.BottomCenter).offset(y = 22.dp))
                if (enemySprite != null) {
                    Image(
                        bitmap = enemySprite,
                        contentDescription = null,
                        contentScale = ContentScale.Fit,
                        modifier = Modifier.size(88.dp)
                    )
                } else {
                    Icon(
                        imageVector = Icons.Filled.Bolt,
                        contentDescription = null,
                        tint = enemyTheme,
                        modifier = Modifier.size(80.dp)
                    )
                }
            }
        }

        Column(
            modifier = Modifier
                .align(Alignment.BottomStart)
                .padding(bottom = 24.dp, start = 24.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            val attackOffset by animateDpAsState(if (battleEvent is BattleEvent.PlayerAttack) 50.dp else 0.dp)
            val hitAlpha by animateFloatAsState(if (battleEvent is BattleEvent.PlayerHit) 0.5f else 1f)

            Box(
                modifier = Modifier
                    .offset(x = attackOffset, y = -attackOffset)
                    .alpha(hitAlpha)
            ) {
                GroundPlane(tint = Color.Blue, modifier = Modifier.align(Alignment.BottomCenter).offset(y = 18.dp))
                if (heroSprite != null) {
                    Image(
                        bitmap = heroSprite,
                        contentDescription = null,
                        contentScale = ContentScale.Fit,
                        modifier = Modifier.size(80.dp)
                    )
                } else {
                    Icon(
                        imageVector = Icons.Filled.Person,
                        contentDescription = null,
                        tint = Color.Blue,
                        modifier = Modifier.size(70.dp)
                    )
                }
            }
            Spacer(Modifier.height(8.dp))
            Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(10.dp)) {
                PortraitBadge(
                    bitmap = heroSprite,
                    tint = Color.Blue,
                    fallback = Icons.Filled.Person
                )
                KenneyHPBar(current = duel.playerHP, max = 100, tint = Color.Blue)
            }
        }

        val enemyHit = battleEvent as? BattleEvent.EnemyHit
        AnimatedVisibility(
            visible = enemyHit != null,
            modifier = Modifier
                .align(Alignment.CenterEnd)
                .padding(end = 60.dp, bottom = 20.dp),
            enter = fadeIn(),
            exit = fadeOut()
        ) {
            val vfx = if (enemyHit?.isCrit == true) healVfx else hitVfx
            if (vfx != null) {
                Image(
                    bitmap = vfx,
                    contentDescription = null,
                    contentScale = ContentScale.Fit,
                    modifier = Modifier.size(if (enemyHit?.isCrit == true) 180.dp else 150.dp)
                )
            }
        }

        val playerHit = battleEvent as? BattleEvent.PlayerHit
        AnimatedVisibility(
            visible = playerHit != null,
            modifier = Modifier
                .align(Alignment.CenterStart)
                .padding(start = 60.dp, top = 20.dp),
            enter = fadeIn(),
            exit = fadeOut()
        ) {
            if (hitVfx != null) {
                Image(
                    bitmap = hitVfx,
                    contentDescription = null,
                    contentScale = ContentScale.Fit,
                    modifier = Modifier.size(150.dp)
                )
            }
        }

        AnimatedVisibility(
            visible = enemyHit != null,
            modifier = Modifier
                .align(Alignment.CenterEnd)
                .padding(end = 80.dp, bottom = 40.dp),
            enter = slideInVertically { 50 } + fadeIn(),
            exit = fadeOut()
        ) {
            if (enemyHit != null) {
                Text(
                    text = if (enemyHit.isCrit) "CRIT ${enemyHit.damage}!" else "-${enemyHit.damage}",
                    fontSize = if (enemyHit.isCrit) 32.sp else 24.sp,
                    color = if (enemyHit.isCrit) Color.Yellow else Color.White,
                    fontWeight = FontWeight.Bold
                )
            }
        }

        AnimatedVisibility(
            visible = playerHit != null,
            modifier = Modifier
                .align(Alignment.CenterStart)
                .padding(start = 80.dp, top = 40.dp),
            enter = slideInVertically { -50 } + fadeIn(),
            exit = fadeOut()
        ) {
            if (playerHit != null) {
                Text(
                    text = "-${playerHit.damage}",
                    color = Color.Red,
                    fontSize = 24.sp,
                    fontWeight = FontWeight.Bold
                )
            }
        }
    }
}

@Composable
private fun GroundPlane(tint: Color, modifier: Modifier = Modifier) {
    Canvas(
        modifier = modifier
            .size(width = 140.dp, height = 26.dp)
            .alpha(0.9f)
    ) {
        drawOval(
            brush = Brush.radialGradient(
                colors = listOf(Color.Black.copy(alpha = 0.35f), Color.Transparent),
                radius = size.maxDimension
            )
        )
        drawOval(
            color = tint.copy(alpha = 0.25f),
            style = androidx.compose.ui.graphics.drawscope.Stroke(width = 2f)
        )
    }
}

@Composable
private fun PortraitBadge(
    bitmap: androidx.compose.ui.graphics.ImageBitmap?,
    tint: Color,
    fallback: androidx.compose.ui.graphics.vector.ImageVector
) {
    Box(
        modifier = Modifier
            .size(36.dp)
            .clip(CircleShape)
            .background(tint.copy(alpha = 0.22f))
            .border(1.dp, Color.White.copy(alpha = 0.35f), CircleShape),
        contentAlignment = Alignment.Center
    ) {
        if (bitmap != null) {
            Image(
                bitmap = bitmap,
                contentDescription = null,
                contentScale = ContentScale.Fit,
                modifier = Modifier
                    .padding(6.dp)
                    .fillMaxSize()
            )
        } else {
            Icon(
                imageVector = fallback,
                contentDescription = null,
                tint = Color.White.copy(alpha = 0.85f),
                modifier = Modifier.size(18.dp)
            )
        }
    }
}

@Composable
private fun KenneyHPBar(current: Int, max: Int, tint: Color) {
    val progress = if (max > 0) (current.toFloat() / max.toFloat()).coerceIn(0f, 1f) else 0f
    val frame = rememberKenneyImageBitmap("ui.hp.frame")
    val fill = rememberKenneyImageBitmap("ui.hp.fill")

    if (frame == null || fill == null) {
        LinearProgressIndicator(
            progress = progress,
            color = tint,
            modifier = Modifier
                .width(120.dp)
                .height(10.dp)
                .clip(RoundedCornerShape(5.dp))
        )
        return
    }

    Box(
        modifier = Modifier
            .width(140.dp)
            .height(14.dp)
    ) {
        Image(
            bitmap = frame,
            contentDescription = null,
            contentScale = ContentScale.FillBounds,
            modifier = Modifier.matchParentSize()
        )
        Image(
            bitmap = fill,
            contentDescription = null,
            contentScale = ContentScale.FillBounds,
            colorFilter = ColorFilter.tint(tint),
            modifier = Modifier
                .fillMaxHeight()
                .fillMaxWidth(progress)
                .clipToBounds()
        )
    }
}

private fun parseColorOrFallback(hex: String, fallback: Color): Color {
    return try {
        Color(android.graphics.Color.parseColor(hex))
    } catch (_: IllegalArgumentException) {
        fallback
    }
}

```

---
### `iosApp/iprep/Persistence/PersistencePlaceholder.swift`
- Size: `50` bytes
```
import Foundation

enum PersistencePlaceholder {}

```

---
### `iosApp/iprep/Services/QuestionStudyState 2.swift`
- Size: `80` bytes
```
// Deprecated placeholder; see QuestionStudyState.swift for the implementation.

```

---
### `iosApp/iprep/Models/FeatureFlagKey.swift`
- Size: `232` bytes
```
import Foundation

enum FeatureFlagKey: String, CaseIterable {
    case peerComparisonEnabled
    case spacedRepetitionEnabled
    case timedModeEnabled
    case streaksEnabled
    case pencilAnnotEnabled
    case activeReleaseId
}

```

---
### `iosApp/iprep/Support/Bundle+Module.swift`
- Size: `232` bytes
```
import Foundation

extension Bundle {
    /// Replacement for Swift Package Manager's `Bundle.module` so the code
    /// continues to work now that everything lives in the main app target.
    static var module: Bundle { .main }
}

```

---
### `iosApp/iprep/Components/Typography.swift`
- Size: `370` bytes
```
import SwiftUI

enum Typography {
    static func heading(size: Font.TextStyle = .title2) -> Font {
        Font.system(size, design: .rounded).weight(.semibold)
    }

    static func bodyEmphasis() -> Font {
        Font.system(.body, design: .default).weight(.medium)
    }

    static func caption() -> Font {
        Font.system(.caption, design: .default)
    }
}

```

---
### `iosApp/iprep/Components/Color+Theme.swift`
- Size: `414` bytes
```
import SwiftUI

extension Color {
    static var ipBackground: Color { Color("Background", bundle: .module) }
    static var ipSurface: Color { Color("Surface", bundle: .module) }
    static var ipSurfaceElevated: Color { Color("SurfaceElevated", bundle: .module) }
    static var ipAccent: Color { Color("Accent", bundle: .module) }
    static var ipMutedAccent: Color { Color("MutedAccent", bundle: .module) }
}

```

---
### `iosApp/iprep/Resources/RemoteConfigDefaults.plist`
- Size: `476` bytes
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>peerComparisonEnabled</key>
    <true/>
    <key>spacedRepetitionEnabled</key>
    <true/>
    <key>timedModeEnabled</key>
    <false/>
    <key>streaksEnabled</key>
    <false/>
    <key>pencilAnnotEnabled</key>
    <false/>
    <key>activeReleaseId</key>
    <string></string>
</dict>
</plist>

```

---
### `iosApp/iprep/Models/AppRoute.swift`
- Size: `485` bytes
```
import Foundation

public enum QuizMode: Hashable {
    case quickStart(resume: Bool)
    case module(id: String, title: String)
    case incorrectOnly
}

public enum AppRoute: Hashable {
    case dashboard
    case quiz(QuizMode)
    case progressReport
    case review
    case analytics
    case settings
    case questionExplorer
    case leaderboard
    case crosswords
    case crossword(puzzleId: String, title: String)
    case duelEnemySelect
    case duel(enemyId: String)
}

```

---
### `iosApp/iprep/Services/SyncManager.swift`
- Size: `586` bytes
```
import Foundation

protocol SyncManagerType: AnyObject {
    func scheduleSync()
}

final class SyncManager: SyncManagerType {
    private let localStore: LocalStoreType
    private let firestore: FirestoreServiceType
    private let queue = DispatchQueue(label: "SyncManager.queue", qos: .background)

    init(localStore: LocalStoreType, firestore: FirestoreServiceType) {
        self.localStore = localStore
        self.firestore = firestore
    }

    func scheduleSync() {
        queue.async { [localStore] in
            Task { await localStore.warmStart() }
        }
    }
}

```

---
### `iosApp/iprep/iprepApp.swift`
- Size: `605` bytes
```
//
//  iprepApp.swift
//  iprep
//
//  Created by Russell Miller on 9/20/25.
//

import SwiftUI

@main
struct iprepApp: App {
    @StateObject private var environment: AppEnvironment

    init() {
        print("[iprepApp] init starting...")
        _environment = StateObject(wrappedValue: AppEnvironment.shared)
        print("[iprepApp] init complete")
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(environment)
                .onAppear {
                    print("[iprepApp] RootView appeared")
                }
        }
    }
}

```

---
### `iosApp/iprep/Models/Module.swift`
- Size: `608` bytes
```
import Foundation
import Shared

typealias Module = Shared.Module

extension Module: Identifiable {}

extension Module.Difficulty {
    static var allCases: [Module.Difficulty] {
        entries
    }

    var rawValue: String {
        value
    }

    static func from(rawValue: String) -> Module.Difficulty? {
        let normalized = rawValue.lowercased()
        if normalized == Module.Difficulty.easy.value { return .easy }
        if normalized == Module.Difficulty.moderate.value { return .moderate }
        if normalized == Module.Difficulty.hard.value { return .hard }
        return nil
    }
}

```

---
### `iosApp/iprep/Models/QuizQuestion.swift`
- Size: `715` bytes
```
import Foundation
import Shared

typealias QuizOption = Shared.QuizOption
typealias QuizQuestion = Shared.QuizQuestion
typealias QuizModule = Shared.QuizModule
typealias QuizSessionQuestion = Shared.QuizSessionQuestion

extension QuizOption: Identifiable {}

extension QuizQuestion: Identifiable {}

extension QuizModule: Identifiable {}

extension QuizSessionQuestion: Identifiable {}

extension QuizOption {
    var imageURLValue: URL? {
        imageURL.flatMap(URL.init(string:))
    }
}

extension QuizQuestion {
    var imageURLValues: [URL] {
        imageURLs.compactMap(URL.init(string:))
    }

    var explanationImageURLValues: [URL] {
        explanationImageURLs.compactMap(URL.init(string:))
    }
}

```

---
### `iosApp/iprep/Services/StorageService.swift`
- Size: `792` bytes
```
import Foundation

protocol StorageMetadata {
    var etag: String? { get }
    var lastModified: Date? { get }
}

protocol StorageServiceType: AnyObject {
    func signedURL(for path: String) async throws -> URL
    func metadata(for path: String) async throws -> StorageMetadata?
}

struct StubStorageMetadata: StorageMetadata {
    let etag: String?
    let lastModified: Date?
}

final class StorageService: StorageServiceType {
    func signedURL(for path: String) async throws -> URL {
        guard let url = URL(string: "https://example.com/\(path)") else {
            throw URLError(.badURL)
        }
        return url
    }

    func metadata(for path: String) async throws -> StorageMetadata? {
        StubStorageMetadata(etag: UUID().uuidString, lastModified: Date())
    }
}

```

---
### `iosApp/iprep/Models/QuizSessionConfiguration.swift`
- Size: `809` bytes
```
import Foundation

struct QuizSessionConfiguration: Codable, Equatable {
    var mode: QuizSessionMode
    var perQuestionTimerEnabled: Bool
    var autoPauseOnBackground: Bool

    static let `default` = QuizSessionConfiguration(mode: .study, perQuestionTimerEnabled: false, autoPauseOnBackground: true)
}

enum QuizSessionMode: String, Codable, CaseIterable, Identifiable {
    case study
    case exam

    var id: String { rawValue }

    var title: String {
        switch self {
        case .study:
            return "Study"
        case .exam:
            return "Exam"
        }
    }

    var description: String {
        switch self {
        case .study:
            return "See rationales immediately"
        case .exam:
            return "Hide rationales until completion"
        }
    }
}

```

---
### `iosApp/iprep/Services/AuthService.swift`
- Size: `849` bytes
```
import Combine
import Foundation

protocol AuthServiceType: AnyObject {
    var currentUser: AuthUser? { get }
    var userDidChange: AnyPublisher<AuthUser?, Never> { get }
    func signInIfNeeded()
}

struct AuthUser: Equatable {
    let id: String
    let displayName: String?
}

final class AuthService: AuthServiceType {
    private let subject = CurrentValueSubject<AuthUser?, Never>(nil)
    private var cancellables: Set<AnyCancellable> = []

    init() {
        signInIfNeeded()
    }

    var currentUser: AuthUser? {
        subject.value
    }

    var userDidChange: AnyPublisher<AuthUser?, Never> {
        subject.eraseToAnyPublisher()
    }

    func signInIfNeeded() {
        guard subject.value == nil else { return }
        let anonUser = AuthUser(id: UUID().uuidString, displayName: nil)
        subject.send(anonUser)
    }
}

```

---
### `iosApp/iprep/Features/Landing/ModulePickerView.swift`
- Size: `1102` bytes
```
import SwiftUI
import Shared

struct ModulePickerView: View {
    let modules: [Module]
    let onSelect: (Module) -> Void
    let onCancel: () -> Void

    var body: some View {
        NavigationStack {
            List(modules, id: \.id) { module in
                Button {
                    onSelect(module)
                } label: {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(module.title)
                            .font(.headline)
                            .foregroundStyle(Color.primary)
                        Text("\(module.questionCount) questions • ~\(module.estimatedTimeMinutes) min")
                            .font(.subheadline)
                            .foregroundStyle(Color.secondary)
                    }
                    .padding(.vertical, 6)
                }
            }
            .navigationTitle("Choose Category")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close", action: onCancel)
                }
            }
        }
    }
}

```

---
### `iosApp/iprep/Services/FeatureFlags.swift`
- Size: `1298` bytes
```
import Combine
import Foundation

@MainActor
final class FeatureFlags: ObservableObject {
    @Published private(set) var peerComparisonEnabled: Bool = true
    @Published private(set) var spacedRepetitionEnabled: Bool = true
    @Published private(set) var timedModeEnabled: Bool = false
    @Published private(set) var streaksEnabled: Bool = false
    @Published private(set) var pencilAnnotEnabled: Bool = false
    @Published private(set) var activeReleaseId: String = ""

    private let remoteConfig: RemoteConfigServiceType

    init(remoteConfig: RemoteConfigServiceType) {
        self.remoteConfig = remoteConfig
        applyValues()
    }

    func refresh() async {
        await remoteConfig.refresh()
        await MainActor.run {
            applyValues()
        }
    }

    private func applyValues() {
        peerComparisonEnabled = remoteConfig.boolValue(for: .peerComparisonEnabled)
        spacedRepetitionEnabled = remoteConfig.boolValue(for: .spacedRepetitionEnabled)
        timedModeEnabled = remoteConfig.boolValue(for: .timedModeEnabled)
        streaksEnabled = remoteConfig.boolValue(for: .streaksEnabled)
        pencilAnnotEnabled = remoteConfig.boolValue(for: .pencilAnnotEnabled)
        activeReleaseId = remoteConfig.stringValue(for: .activeReleaseId)
    }
}

```

---
### `iosApp/iprep/Features/Settings/SettingsView.swift`
- Size: `1396` bytes
```
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @State private var showResetAlert = false

    var body: some View {
        Form {
            Section("Practice History") {
                Button(role: .destructive) {
                    showResetAlert = true
                } label: {
                    Label("Reset completed questions", systemImage: "arrow.counterclockwise")
                }
                .accessibilityHint(Text("Clears saved sessions so questions can appear again."))
            }

            Section("Preferences") {
                Toggle(isOn: .constant(true)) {
                    Text("Enable reminders")
                }
                .disabled(true)
                .accessibilityHint(Text("Coming soon"))
            }

            Section("About") {
                Text("AABIP iPREP early build")
                Text("Version 0.1")
            }
        }
        .navigationTitle("Settings")
        .alert("Reset practice history?", isPresented: $showResetAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Reset", role: .destructive) {
                environment.resetPracticeProgress()
            }
        } message: {
            Text("This will clear completed quizzes and allow all questions to appear again. This cannot be undone.")
        }
    }
}

```

---
### `iosApp/iprep/Features/Crosswords/CrosswordPuzzleView.swift`
- Size: `1476` bytes
```
import SwiftUI
import WebKit

struct CrosswordPuzzleView: View {
    let puzzleId: String
    let title: String

    private var puzzleURL: URL? {
        Bundle.main.url(forResource: puzzleId, withExtension: "html")
    }

    var body: some View {
        Group {
            if let puzzleURL {
                CrosswordWebView(url: puzzleURL)
                    .ignoresSafeArea(edges: .bottom)
            } else {
                ContentUnavailableView(
                    "Puzzle not found",
                    systemImage: "questionmark.folder",
                    description: Text("Missing \(puzzleId).html from app resources.")
                )
                .padding()
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.ipBackground.ignoresSafeArea())
    }
}

private struct CrosswordWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard uiView.url != url else { return }
        uiView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
    }
}


```

---
### `iosApp/iprep/Services/FirestoreService.swift`
- Size: `1513` bytes
```
import Foundation
import Shared

protocol FirestoreServiceType: AnyObject {
    func fetchModules() async throws -> [Module]
    func fetchDashboardSnapshot() async throws -> DashboardSnapshot
}

struct DashboardSnapshot {
    let streakCount: Int
    let correctRate: Double
    let recentActivityDescription: String
}

final class FirestoreService: FirestoreServiceType {
    private let questionBank: QuestionBankService

    init(questionBank: QuestionBankService) {
        self.questionBank = questionBank
    }

    func fetchModules() async throws -> [Module] {
        try await Task.sleep(nanoseconds: 25_000_000)
        return questionBank.moduleSummaries()
    }

    func fetchDashboardSnapshot() async throws -> DashboardSnapshot {
        try await Task.sleep(nanoseconds: 25_000_000)
        let moduleCount = questionBank.moduleCount()
        let questionCount = questionBank.totalQuestionCount
        let estimatedMinutes = questionBank.moduleSummaries().reduce(0) { $0 + Int($1.estimatedTimeMinutes) }
        let activity = "\(moduleCount) modules • \(questionCount) questions ready • ~\(estimatedMinutes) min of study"
        // Use a deterministic derived rate to avoid feeling random between launches.
        let baselineRate = min(0.92, max(0.55, Double(questionCount % 100) / 100.0 + 0.6))
        return DashboardSnapshot(
            streakCount: max(3, moduleCount + 1),
            correctRate: baselineRate,
            recentActivityDescription: activity
        )
    }
}

```

---
### `iosApp/iprep/Info.plist`
- Size: `1697` bytes
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleDevelopmentRegion</key>
    <string>$(DEVELOPMENT_LANGUAGE)</string>
    <key>CFBundleDisplayName</key>
    <string>IPREP</string>
    <key>CFBundleExecutable</key>
    <string>$(EXECUTABLE_NAME)</string>
    <key>CFBundleIdentifier</key>
    <string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
    <key>CFBundleInfoDictionaryVersion</key>
    <string>6.0</string>
    <key>CFBundleName</key>
    <string>$(PRODUCT_NAME)</string>
    <key>CFBundlePackageType</key>
    <string>$(PRODUCT_BUNDLE_PACKAGE_TYPE)</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
    <key>CFBundleVersion</key>
    <string>1</string>
    <key>CFBundleIconName</key>
    <string>AppIcon</string>
    <key>LSRequiresIPhoneOS</key>
    <true/>
    <key>UIApplicationSceneManifest</key>
    <dict>
        <key>UIApplicationSupportsMultipleScenes</key>
        <true/>
    </dict>
    <key>UILaunchScreen</key>
    <dict/>
    <key>UISupportedInterfaceOrientations</key>
    <array>
        <string>UIInterfaceOrientationPortrait</string>
        <string>UIInterfaceOrientationLandscapeLeft</string>
        <string>UIInterfaceOrientationLandscapeRight</string>
    </array>
    <key>UISupportedInterfaceOrientations~ipad</key>
    <array>
        <string>UIInterfaceOrientationPortrait</string>
        <string>UIInterfaceOrientationPortraitUpsideDown</string>
        <string>UIInterfaceOrientationLandscapeLeft</string>
        <string>UIInterfaceOrientationLandscapeRight</string>
    </array>
</dict>
</plist>

```

---
### `iosApp/iprep/Services/MediaCache.swift`
- Size: `1901` bytes
```
import Foundation

protocol MediaCacheType: AnyObject {
    func cachedFileURL(for remotePath: String) -> URL?
    func cache(data: Data, remotePath: String) throws -> URL
}

final class MediaCache: MediaCacheType {
    private let fileManager: FileManager
    private let cacheDirectory: URL
    private let queue = DispatchQueue(label: "MediaCache.queue", qos: .utility)

    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
        let directory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first ?? URL(fileURLWithPath: NSTemporaryDirectory())
        let cachePath = directory.appendingPathComponent("MediaCache", isDirectory: true)
        if !fileManager.fileExists(atPath: cachePath.path) {
            try? fileManager.createDirectory(at: cachePath, withIntermediateDirectories: true)
        }
        self.cacheDirectory = cachePath
    }

    func cachedFileURL(for remotePath: String) -> URL? {
        let filename = sanitizedFilename(from: remotePath)
        let destination = cacheDirectory.appendingPathComponent(filename)
        return fileManager.fileExists(atPath: destination.path) ? destination : nil
    }

    func cache(data: Data, remotePath: String) throws -> URL {
        let filename = sanitizedFilename(from: remotePath)
        let destination = cacheDirectory.appendingPathComponent(filename)
        var writeError: Error?
        queue.sync {
            do {
                try data.write(to: destination, options: [.atomic])
            } catch {
                writeError = error
            }
        }
        if let error = writeError {
            throw error
        }
        return destination
    }

    private func sanitizedFilename(from remotePath: String) -> String {
        Data(remotePath.utf8)
            .base64EncodedString()
            .replacingOccurrences(of: "/", with: "-")
    }
}

```

---
### `iosApp/iprep/Features/Crosswords/CrosswordsView.swift`
- Size: `1952` bytes
```
import SwiftUI

struct CrosswordPuzzle: Identifiable, Hashable {
    let id: String
    let title: String
    let subtitle: String

    static let all: [CrosswordPuzzle] = [
        CrosswordPuzzle(
            id: "crossword1",
            title: "Interventional Pulmonology Board Review",
            subtitle: "Interactive crossword • High-yield concepts"
        ),
        CrosswordPuzzle(
            id: "crossword2",
            title: "IP Board Review Crossword",
            subtitle: "Interactive crossword • Mixed topics"
        ),
        CrosswordPuzzle(
            id: "crossword3",
            title: "Interventional & Pleural Crossword",
            subtitle: "Interactive crossword • Interventional + pleural"
        )
    ]
}

struct CrosswordsView: View {
    private let puzzles = CrosswordPuzzle.all

    var body: some View {
        List {
            Section("Puzzles") {
                ForEach(puzzles) { puzzle in
                    NavigationLink(value: AppRoute.crossword(puzzleId: puzzle.id, title: puzzle.title)) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(puzzle.title)
                                .font(.headline)
                            Text(puzzle.subtitle)
                                .font(.subheadline)
                                .foregroundStyle(Color.secondary)
                        }
                    }
                    .listRowBackground(Color.ipSurface)
                }
            }

            Section {
                Text("Tip: Tap a clue to highlight its answer. Use Reveal All for study mode.")
                    .font(.footnote)
                    .foregroundStyle(Color.secondary)
            }
            .listRowBackground(Color.ipSurface)
        }
        .listStyle(.insetGrouped)
        .background(Color.ipBackground.ignoresSafeArea())
        .navigationTitle("Crossword Puzzles")
    }
}


```

---
### `iosApp/iprep/Components/ModuleCard.swift`
- Size: `2021` bytes
```
import SwiftUI
import Shared

struct ModuleCard: View {
    let module: Module
    let isDownloaded: Bool
    let onTapDownload: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(module.title)
                .font(Typography.heading())
                .foregroundStyle(Color.primary)

            Text(module.description_)
                .font(.body)
                .foregroundStyle(Color.secondary)
                .lineLimit(3)

            HStack(spacing: 16) {
                Label("\(module.questionCount) questions", systemImage: "questionmark.circle")
                    .font(Typography.caption())
                    .foregroundStyle(Color.secondary)
                Label("~\(module.estimatedTimeMinutes) min", systemImage: "clock")
                    .font(Typography.caption())
                    .foregroundStyle(Color.secondary)
            }

            Spacer(minLength: 0)

            Button(action: onTapDownload) {
                Label(isDownloaded ? "Downloaded" : "Download", systemImage: isDownloaded ? "checkmark.circle.fill" : "arrow.down.circle")
                    .font(Typography.bodyEmphasis())
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(isDownloaded ? Color.ipMutedAccent : Color.ipAccent)
            .disabled(isDownloaded)
            .opacity(isDownloaded ? 0.75 : 1.0)
            .accessibilityLabel(Text(isDownloaded ? "Module \(module.title) downloaded" : "Download module \(module.title)"))
            .accessibilityHint(Text(isDownloaded ? "Already available for offline study" : "Downloads all offline content"))
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 180)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .shadow(color: Color.black.opacity(0.04), radius: 6, x: 0, y: 2)
    }
}

```

---
### `iosApp/iprep/Models/QuizQuestion+Search.swift`
- Size: `2055` bytes
```
import Foundation
import Shared

extension String {
    /// Case and diacritic insensitive substring search.
    func containsInsensitive(_ other: String) -> Bool {
        guard !other.isEmpty else { return true }
        return range(of: other, options: [.caseInsensitive, .diacriticInsensitive]) != nil
    }
}

extension Collection where Element == String {
    /// Lowercases and joins string collections for easier search comparisons.
    func joinedLowercased(separator: String = " ") -> String {
        map { $0.lowercased() }.joined(separator: separator)
    }
}

extension QuizQuestion {
    /// Returns true when any searchable field contains the provided query.
    func matchesQuery(_ rawQuery: String) -> Bool {
        let query = rawQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else { return true }

        let searchableFields: [String] = [
            prompt,
            explanation,
            references.joined(separator: " "),
            options.map(\.text).joined(separator: " ")
        ]

        if searchableFields.contains(where: { $0.containsInsensitive(query) }) {
            return true
        }

        // Fallback by folding accents to ensure matches for diacritics-heavy content.
        return searchableFields
            .map { $0.folding(options: .diacriticInsensitive, locale: .current) }
            .contains(where: { $0.containsInsensitive(query) })
    }
}

extension QuizSessionQuestion {
    /// Leverages the underlying `QuizQuestion` matcher while considering module metadata.
    func matchesQuery(_ rawQuery: String) -> Bool {
        let query = rawQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else { return true }

        if question.matchesQuery(query) { return true }

        let moduleFields = [
            module.summary.title,
            module.summary.description_,
            module.summary.difficulty.rawValue
        ]

        return moduleFields.contains(where: { $0.containsInsensitive(query) })
    }
}

```

---
### `iosApp/iprep/Services/QuestionBankService.swift`
- Size: `2303` bytes
```
import Foundation
import OSLog
import Shared

final class QuestionBankService {
    private let core: Shared.QuestionBankService
    private let logger: Logger

    init(
        core: Shared.QuestionBankService,
        logger: Logger = Logger(
            subsystem: (Bundle.main.bundleIdentifier ?? "com.russellmiller.iprep"),
            category: "QuestionBankService"
        )
    ) {
        self.core = core
        self.logger = logger
        if core.moduleSummaries().isEmpty {
            logger.warning("Shared question bank returned no modules; check QuestionBank.json bundling")
        }
    }

    var totalQuestionCount: Int {
        Int(core.totalQuestionCount)
    }

    func moduleSummaries() -> [Module] {
        core.moduleSummaries()
    }

    func quizModule(for id: String) -> QuizModule? {
        core.quizModule(id: id)
    }

    func questions(forModule id: String) -> [QuizQuestion] {
        core.questions(moduleId: id)
    }

    func quickStartQuestions(limit: Int = 10, excluding excludedIDs: Set<String> = []) -> [QuizSessionQuestion] {
        core.quickStartQuestions(limit: Int32(limit), excluding: excludedIDs)
    }

    func allSessionQuestions() -> [QuizSessionQuestion] {
        core.allSessionQuestions()
    }

    func sessionQuestions(forModule id: String) -> [QuizSessionQuestion] {
        core.sessionQuestions(forModule: id)
    }

    func sessionQuestions(forModule id: String, excluding excludedIDs: Set<String>) -> [QuizSessionQuestion] {
        core.sessionQuestions(forModule: id, excluding: excludedIDs)
    }

    func sessionQuestion(for reference: QuizSessionQuestionReference) -> QuizSessionQuestion? {
        core.sessionQuestion(reference: sharedReference(from: reference))
    }

    func moduleCount() -> Int {
        Int(core.moduleCount())
    }

    func sessionQuestions(from references: [QuizSessionQuestionReference]) -> [QuizSessionQuestion] {
        let sharedReferences = references.map(sharedReference(from:))
        return core.sessionQuestions(from: sharedReferences)
    }

    private func sharedReference(from reference: QuizSessionQuestionReference) -> Shared.QuizSessionQuestionReference {
        Shared.QuizSessionQuestionReference(moduleID: reference.moduleID, questionID: reference.questionID)
    }
}

```

---
### `iosApp/iprep/Services/DuelStore.swift`
- Size: `2478` bytes
```
import Combine
import Foundation
import Shared

@MainActor
final class DuelStore: ObservableObject {
    @Published private(set) var data: Shared.DuelPersistenceData

    private let key = "AABIPIPREP.duelData"
    private let defaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.defaults = userDefaults
        if let blob = userDefaults.string(forKey: key), !blob.isEmpty {
            self.data = Shared.DuelPersistenceData.companion.decode(jsonString: blob)
        } else {
            self.data = Shared.DuelPersistenceData.companion.empty
        }
    }

    func save() {
        let encoded = Shared.DuelPersistenceData.companion.encode(data: data)
        defaults.set(encoded, forKey: key)
    }

    func updateProfile(_ profile: Shared.PlayerProfile) {
        data = Shared.DuelPersistenceData(
            playerProfile: profile,
            recentDuels: data.recentDuels,
            recentlySeenQuestionIds: data.recentlySeenQuestionIds,
            recentlyMissedQuestionIds: data.recentlyMissedQuestionIds
        )
        save()
    }

    func updateRecentQuestionIds(seen: [String], missed: [String]) {
        data = Shared.DuelPersistenceData(
            playerProfile: data.playerProfile,
            recentDuels: data.recentDuels,
            recentlySeenQuestionIds: seen,
            recentlyMissedQuestionIds: missed
        )
        save()
    }

    func addCompletedDuel(_ duel: Shared.CompletedDuel) {
        var updated = data.recentDuels
        updated.insert(duel, at: 0)
        if updated.count > 20 {
            updated = Array(updated.prefix(20))
        }

        data = Shared.DuelPersistenceData(
            playerProfile: data.playerProfile,
            recentDuels: updated,
            recentlySeenQuestionIds: data.recentlySeenQuestionIds,
            recentlyMissedQuestionIds: data.recentlyMissedQuestionIds
        )
        save()
    }

    func weakTopics(limit: Int = 3) -> [String] {
        // Kotlin Map<String, Float> bridges as [String: KotlinFloat] (NSNumber).
        let map = data.playerProfile.topicMastery
        let pairs: [(String, Float)] = map.compactMap { key, value in
            guard let key = key as? String else { return nil }
            let number = value as? NSNumber
            return (key, number?.floatValue ?? 0.5)
        }

        return pairs
            .sorted(by: { $0.1 < $1.1 })
            .prefix(limit)
            .map { $0.0 }
    }
}

```

---
### `iosApp/iprep/Services/FlowPublisher.swift`
- Size: `2500` bytes
```
import Combine
import Foundation
import OSLog
#if canImport(Shared)
import Shared
#endif

#if canImport(Shared)
/// Bridges a Kotlin `StateFlow` into a Combine publisher.
final class FlowPublisher<Output> {
    private let flow: Kotlinx_coroutines_coreStateFlow
    private let transform: (Any?) -> Output
    private let logger: Logger
    private let subject = PassthroughSubject<Output, Never>()
    private var collector: FlowCollector?
    private var started = false

    init(
        flow: Kotlinx_coroutines_coreStateFlow,
        logger: Logger = Logger(
            subsystem: (Bundle.main.bundleIdentifier ?? "com.russellmiller.iprep"),
            category: "FlowPublisher"
        ),
        transform: @escaping (Any?) -> Output
    ) {
        self.flow = flow
        self.transform = transform
        self.logger = logger
    }

    var publisher: AnyPublisher<Output, Never> {
        startIfNeeded()
        return subject.eraseToAnyPublisher()
    }

    private func startIfNeeded() {
        guard !started else { return }
        started = true

        // Emit the current state synchronously.
        subject.send(transform(flow.value))

        let collector = FlowCollector { [weak self] value in
            guard let self else { return }
            self.subject.send(self.transform(value))
        }
        self.collector = collector

        let logger = logger

        // Kotlin suspend functions bridged to Swift must be invoked on the main thread.
        if Thread.isMainThread {
            flow.collect(collector: collector) { error in
                if let error {
                    logger.error("StateFlow collection finished with error: \(error.localizedDescription, privacy: .public)")
                }
            }
        } else {
            DispatchQueue.main.async { [flow, logger, collector] in
                flow.collect(collector: collector) { error in
                    if let error {
                        logger.error("StateFlow collection finished with error: \(error.localizedDescription, privacy: .public)")
                    }
                }
            }
        }
    }
}

private final class FlowCollector: NSObject, Kotlinx_coroutines_coreFlowCollector {
    private let onEmit: (Any?) -> Void

    init(onEmit: @escaping (Any?) -> Void) {
        self.onEmit = onEmit
    }

    func emit(value: Any?, completionHandler: @escaping (Error?) -> Void) {
        onEmit(value)
        completionHandler(nil)
    }
}
#endif

```

---
### `iosApp/iprep/Services/RemoteConfigService.swift`
- Size: `2584` bytes
```
import Foundation

protocol RemoteConfigServiceType: AnyObject {
    func boolValue(for key: FeatureFlagKey) -> Bool
    func stringValue(for key: FeatureFlagKey) -> String
    func refresh() async
}

final class RemoteConfigService: RemoteConfigServiceType {
    private let defaults: [FeatureFlagKey: Any]
    private var overrides: [FeatureFlagKey: Any]

    init(defaultsLoader: RemoteConfigDefaultsLoading = RemoteConfigDefaultsLoader()) {
        self.defaults = defaultsLoader.loadDefaults()
        self.overrides = [:]
    }

    func boolValue(for key: FeatureFlagKey) -> Bool {
        readValue(for: key) as? Bool ?? false
    }

    func stringValue(for key: FeatureFlagKey) -> String {
        readValue(for: key) as? String ?? ""
    }

    func refresh() async {
        // Stub: In production this would call Firebase Remote Config.
    }

    private func readValue(for key: FeatureFlagKey) -> Any {
        if let override = overrides[key] {
            return override
        }
        if let defaultValue = defaults[key] {
            return defaultValue
        }
        return false
    }
}

protocol RemoteConfigDefaultsLoading {
    func loadDefaults() -> [FeatureFlagKey: Any]
}

struct RemoteConfigDefaultsLoader: RemoteConfigDefaultsLoading {
    private let resourceName: String
    private let bundle: Bundle

    init(resourceName: String = "RemoteConfigDefaults", bundle: Bundle = .module) {
        self.resourceName = resourceName
        self.bundle = bundle
    }

    func loadDefaults() -> [FeatureFlagKey: Any] {
        guard let url = bundle.url(forResource: resourceName, withExtension: "plist"),
              let data = try? Data(contentsOf: url),
              let plist = try? PropertyListSerialization.propertyList(from: data, format: nil),
              let dictionary = plist as? [String: Any] else {
            return FeatureFlagKey.allCases.reduce(into: [:]) { partialResult, key in
                partialResult[key] = defaultFallback(for: key)
            }
        }

        return dictionary.reduce(into: [:]) { partialResult, element in
            guard let key = FeatureFlagKey(rawValue: element.key) else { return }
            partialResult[key] = element.value
        }
    }

    private func defaultFallback(for key: FeatureFlagKey) -> Any {
        switch key {
        case .peerComparisonEnabled, .spacedRepetitionEnabled:
            return true
        case .timedModeEnabled, .streaksEnabled, .pencilAnnotEnabled:
            return false
        case .activeReleaseId:
            return ""
        }
    }
}

```

---
### `iosApp/iprep/Models/QuestionStudyState.swift`
- Size: `3626` bytes
```
import Foundation

struct QuestionStudyState: Codable, Equatable, Hashable {
    enum Confidence: String, CaseIterable, Codable, Identifiable {
        case guess
        case low
        case medium
        case high

        var id: String { rawValue }

        var title: String {
            switch self {
            case .guess:
                return "Guess"
            case .low:
                return "Low"
            case .medium:
                return "Medium"
            case .high:
                return "High"
            }
        }

        var iconName: String {
            switch self {
            case .guess:
                return "questionmark"
            case .low:
                return "exclamationmark"
            case .medium:
                return "hand.raised"
            case .high:
                return "checkmark"
            }
        }

        /// Suggested spaced-repetition interval multiplier.
        var intervalMultiplier: Double {
            switch self {
            case .guess:
                return 0.5
            case .low:
                return 1
            case .medium:
                return 2
            case .high:
                return 4
            }
        }
    }

    var flagged: Bool
    var confidence: Confidence?
    var noteMarkdown: String
    var lastReviewedAt: Date?
    var dueAt: Date?
    var totalReviews: Int
    var correctCount: Int
    var incorrectCount: Int
    var averageSecondsSpent: TimeInterval

    init(
        flagged: Bool = false,
        confidence: Confidence? = nil,
        noteMarkdown: String = "",
        lastReviewedAt: Date? = nil,
        dueAt: Date? = nil,
        totalReviews: Int = 0,
        correctCount: Int = 0,
        incorrectCount: Int = 0,
        averageSecondsSpent: TimeInterval = 0
    ) {
        self.flagged = flagged
        self.confidence = confidence
        self.noteMarkdown = noteMarkdown
        self.lastReviewedAt = lastReviewedAt
        self.dueAt = dueAt
        self.totalReviews = totalReviews
        self.correctCount = correctCount
        self.incorrectCount = incorrectCount
        self.averageSecondsSpent = averageSecondsSpent
    }

    mutating func registerReview(correct: Bool, secondsSpent: TimeInterval, referenceDate: Date = Date()) {
        totalReviews += 1
        if correct {
            correctCount += 1
        } else {
            incorrectCount += 1
        }
        if averageSecondsSpent <= 0 {
            averageSecondsSpent = secondsSpent
        } else {
            let totalSeconds = averageSecondsSpent * Double(totalReviews - 1) + secondsSpent
            averageSecondsSpent = totalSeconds / Double(totalReviews)
        }
        lastReviewedAt = referenceDate
        updateDueDate(referenceDate: referenceDate)
    }

    mutating func updateDueDate(referenceDate: Date = Date()) {
        guard let confidence else {
            dueAt = referenceDate
            return
        }
        let baseInterval: TimeInterval
        if totalReviews <= 1 {
            baseInterval = 60 * 60 * 24 // 1 day for first review
        } else {
            baseInterval = pow(2, Double(totalReviews - 1)) * 60 * 60 * 24
        }
        let adjustedInterval = baseInterval * confidence.intervalMultiplier
        dueAt = referenceDate.addingTimeInterval(adjustedInterval)
    }

    var needsReview: Bool {
        guard let dueAt else { return true }
        return dueAt <= Date()
    }

    var successRate: Double {
        guard totalReviews > 0 else { return 0 }
        return Double(correctCount) / Double(totalReviews)
    }
}

```

---
### `iosApp/iprep/Support/KenneyAssets.swift`
- Size: `3994` bytes
```
import Foundation
import Shared
import SwiftUI
import UIKit

@MainActor
final class KenneyAssets {
    static let shared = KenneyAssets()

    private let registry: Shared.AssetRegistry?
    private var imageCache: [String: UIImage] = [:]

    private init() {
        self.registry = AssetRegistryKt.tryLoadAssetRegistry()
    }

    func resourcePath(for id: String) -> String? {
        registry?.tryPath(id: id)
    }

    func url(for id: String) -> URL? {
        guard let path = resourcePath(for: id) else { return nil }
        return Bundle.main.resourceURL?.appendingPathComponent(path)
    }

    func uiImage(id: String) -> UIImage? {
        if let cached = imageCache[id] { return cached }
        guard let url = url(for: id) else { return nil }
        guard let image = UIImage(contentsOfFile: url.path) else { return nil }
        imageCache[id] = image
        return image
    }
}

struct KenneyImage: View {
    let id: String
    var capInsets: EdgeInsets = .init()
    var resizingMode: Image.ResizingMode = .stretch
    var template: Bool = false

    var body: some View {
        if let uiImage = KenneyAssets.shared.uiImage(id: id) {
            Image(uiImage: uiImage)
                .renderingMode(template ? .template : .original)
                .resizable(capInsets: capInsets, resizingMode: resizingMode)
                .interpolation(.none)
        } else {
            Color.clear
        }
    }
}

struct KenneyButtonStyle: ButtonStyle {
    enum Variant {
        case primary
        case secondary
    }

    enum Size {
        case regular
        case compact
    }

    let variant: Variant
    let size: Size
    @Environment(\.isEnabled) private var isEnabled

    init(variant: Variant, size: Size = .regular) {
        self.variant = variant
        self.size = size
    }

    private var foreground: Color {
        switch variant {
        case .primary:
            return Color.black.opacity(0.92)
        case .secondary:
            return Color.white
        }
    }

    private var verticalPadding: CGFloat {
        switch size {
        case .regular:
            return 14
        case .compact:
            return 10
        }
    }

    private var horizontalPadding: CGFloat {
        switch size {
        case .regular:
            return 18
        case .compact:
            return 14
        }
    }

    private var labelFont: Font {
        switch size {
        case .regular:
            return .headline.weight(.bold)
        case .compact:
            return .subheadline.weight(.bold)
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(labelFont)
            .foregroundStyle(foreground)
            .shadow(color: Color.black.opacity(variant == .primary ? 0.1 : 0.25), radius: 1, y: 1)
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .frame(maxWidth: .infinity)
            .background {
                buttonBackground(isPressed: configuration.isPressed)
            }
            .opacity(isEnabled ? 1.0 : 0.55)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }

    @ViewBuilder
    private func buttonBackground(isPressed: Bool) -> some View {
        let id = variant == .primary ? "ui.button.primary" : "ui.button.secondary"

        if KenneyAssets.shared.uiImage(id: id) != nil {
            KenneyImage(
                id: id,
                capInsets: EdgeInsets(top: 18, leading: 18, bottom: 18, trailing: 18),
                resizingMode: .stretch
            )
            .opacity(isPressed ? 0.9 : 1.0)
        } else {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(variant == .primary ? Color(red: 0.22, green: 0.55, blue: 0.95) : Color.gray)
                .opacity(isPressed ? 0.9 : 1.0)
        }
    }
}

```

---
### `iosApp/iprep/Services/LeaderboardService.swift`
- Size: `4008` bytes
```
import Foundation
import Shared

struct LeaderboardSnapshot: Equatable {
    struct DomainScore: Identifiable, Equatable {
        let id: String
        let title: String
        let percentile: Double
        let accuracy: Double
    }

    let participantID: String
    let alias: String
    let domains: [DomainScore]
}

protocol LeaderboardServiceType: AnyObject {
    var isOptedIn: Bool { get }
    var participantID: String { get }
    var participantAlias: String { get }
    func setOptIn(_ newValue: Bool)
    func setAlias(_ alias: String)
    func refreshSnapshot(questionBank: QuestionBankService, sessions: [CompletedQuizSession]) -> LeaderboardSnapshot?
}

final class LeaderboardService: LeaderboardServiceType {
    private enum Constants {
        static let optInKey = "AABIPIPREP.leaderboard.optIn"
        static let idKey = "AABIPIPREP.leaderboard.participant"
        static let aliasKey = "AABIPIPREP.leaderboard.alias"
    }

    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    var isOptedIn: Bool {
        defaults.bool(forKey: Constants.optInKey)
    }

    var participantID: String {
        if let stored = defaults.string(forKey: Constants.idKey) {
            return stored
        }
        let id = UUID().uuidString
        defaults.set(id, forKey: Constants.idKey)
        return id
    }

    var participantAlias: String {
        if let stored = defaults.string(forKey: Constants.aliasKey), !stored.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return stored
        }
        let alias = defaultAlias()
        defaults.set(alias, forKey: Constants.aliasKey)
        return alias
    }

    func setOptIn(_ newValue: Bool) {
        defaults.set(newValue, forKey: Constants.optInKey)
    }

    func setAlias(_ alias: String) {
        let trimmed = alias.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.isEmpty {
            defaults.set(defaultAlias(), forKey: Constants.aliasKey)
        } else {
            defaults.set(String(trimmed.prefix(24)), forKey: Constants.aliasKey)
        }
    }

    func refreshSnapshot(questionBank: QuestionBankService, sessions: [CompletedQuizSession]) -> LeaderboardSnapshot? {
        guard isOptedIn else { return nil }
        var domainStats: [String: (correct: Int, total: Int, title: String)] = [:]
        for module in questionBank.moduleSummaries() {
            domainStats[module.id] = (0, 0, module.title)
        }

        for session in sessions.prefix(25) {
            for reference in session.questionReferences {
                guard var stats = domainStats[reference.moduleID],
                      let question = questionBank.sessionQuestion(for: reference) else { continue }
                stats.total += 1
                if session.selections[question.question.id] == question.question.correctOptionId {
                    stats.correct += 1
                }
                domainStats[reference.moduleID] = stats
            }
        }

        let domains: [LeaderboardSnapshot.DomainScore] = domainStats.compactMap { key, value in
            guard value.total > 0 else { return nil }
            let accuracy = Double(value.correct) / Double(value.total)
            // Deterministic percentile approximation comparing against a synthetic cohort.
            let percentile = max(0.05, min(0.99, 0.45 + accuracy * 0.5 + Double(participantID.hashValue & 0xFF) / 1024.0))
            return LeaderboardSnapshot.DomainScore(id: key, title: value.title, percentile: percentile, accuracy: accuracy)
        }
        .sorted { lhs, rhs in lhs.percentile > rhs.percentile }

        return LeaderboardSnapshot(participantID: participantID, alias: participantAlias, domains: domains)
    }

    private func defaultAlias() -> String {
        let suffix = participantID.replacingOccurrences(of: "-", with: "").prefix(6)
        return "Learner-\(suffix.uppercased())"
    }
}

```

---
### `iosApp/iprep/Services/QuestionStudyState.swift`
- Size: `4195` bytes
```
import Foundation

/// Tracks a learner's personal study metadata for a specific question.
/// Persisted locally via `LocalStore` and used by study planning and UI.
struct QuestionStudyState: Codable, Equatable {
    /// Self-assessed confidence levels after answering a question.
    enum Confidence: String, CaseIterable, Identifiable, Codable {
        case guess
        case low
        case medium
        case high

        var id: String { rawValue }

        /// Human-readable title for UI.
        var title: String {
            switch self {
            case .guess: return "Guess"
            case .low: return "Low"
            case .medium: return "Medium"
            case .high: return "High"
            }
        }

        /// SF Symbol name for use in chips/buttons.
        var iconName: String {
            switch self {
            case .guess: return "questionmark.circle"
            case .low: return "hand.thumbsdown"
            case .medium: return "hand.raised"
            case .high: return "hand.thumbsup"
            }
        }
    }

    /// Whether the question is flagged for later review.
    var flagged: Bool = false
    /// Optional confidence rating set by the user.
    var confidence: Confidence? = nil
    /// Free-form markdown notes authored by the user.
    var noteMarkdown: String = ""

    /// Last time the question was reviewed in a session.
    var lastReviewedAt: Date? = nil
    /// Total number of reviews across sessions.
    var reviewCount: Int = 0
    /// Number of times answered correctly.
    var correctCount: Int = 0
    /// Total time spent on this question (seconds).
    var totalSeconds: TimeInterval = 0

    /// Next suggested review date (spaced repetition heuristic).
    var dueDate: Date? = nil

    init(
        flagged: Bool = false,
        confidence: Confidence? = nil,
        noteMarkdown: String = "",
        lastReviewedAt: Date? = nil,
        reviewCount: Int = 0,
        correctCount: Int = 0,
        totalSeconds: TimeInterval = 0,
        dueDate: Date? = nil
    ) {
        self.flagged = flagged
        self.confidence = confidence
        self.noteMarkdown = noteMarkdown
        self.lastReviewedAt = lastReviewedAt
        self.reviewCount = reviewCount
        self.correctCount = correctCount
        self.totalSeconds = totalSeconds
        self.dueDate = dueDate
    }

    /// Register a review outcome and update scheduling metadata.
    /// - Parameters:
    ///   - correct: Whether the user's selection was correct.
    ///   - secondsSpent: Time spent on the question during this interaction.
    mutating func registerReview(correct: Bool, secondsSpent: TimeInterval) {
        reviewCount += 1
        if correct { correctCount += 1 }
        totalSeconds += max(0, secondsSpent)
        lastReviewedAt = Date()
        updateDueDate()
    }

    /// Recompute the next due date based on current confidence and performance.
    /// Uses a simple spaced repetition heuristic that lengthens intervals as
    /// confidence and correctness improve.
    mutating func updateDueDate() {
        let baseDate = lastReviewedAt ?? Date()
        let baseInterval: TimeInterval
        switch confidence {
        case .guess:
            baseInterval = 12 * 60 * 60 // 12 hours
        case .low:
            baseInterval = 24 * 60 * 60 // 1 day
        case .medium:
            baseInterval = 3 * 24 * 60 * 60 // 3 days
        case .high:
            baseInterval = 7 * 24 * 60 * 60 // 1 week
        case .none:
            baseInterval = 2 * 24 * 60 * 60 // default 2 days
        }
        // Scale interval modestly with performance (more correct answers => longer interval).
        let performanceRatio = Double(correctCount) / Double(max(1, reviewCount))
        let scaling = 1.0 + min(2.0, performanceRatio) // cap growth
        dueDate = baseDate.addingTimeInterval(baseInterval * scaling)
    }
}

extension QuestionStudyState {
    var needsReview: Bool {
        if flagged { return true }
        if reviewCount == 0 { return true }
        guard let dueDate else { return false }
        return dueDate <= Date()
    }

    var dueAt: Date? {
        dueDate
    }
}

```

---
### `iosApp/iprep/Features/Duel/EnemySelectView.swift`
- Size: `4712` bytes
```
import SwiftUI
import Shared

struct EnemySelectView: View {
    @EnvironmentObject private var duelStore: DuelStore

    let onSelect: (String) -> Void

    private let columns = [
        GridItem(.adaptive(minimum: 160), spacing: 16)
    ]

    var body: some View {
        let profile = duelStore.data.playerProfile
        let enemies = Shared.EnemyDefinitions.shared.allEnemies

        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                header(profile: profile)

                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(enemies, id: \.id) { enemy in
                        EnemyCard(enemy: enemy, profile: profile) {
                            onSelect(enemy.id)
                        }
                    }
                }
            }
            .padding(16)
        }
        .navigationTitle("Clinical Duel")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func header(profile: Shared.PlayerProfile) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Choose your opponent")
                .font(.title2.weight(.bold))

            HStack(spacing: 12) {
                Text("Level \(profile.level)")
                    .font(.subheadline.weight(.semibold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(.thinMaterial, in: Capsule())

                ProgressView(value: profile.levelProgress)
                    .tint(.blue)
                    .frame(maxWidth: 220)

                Text("\(profile.xpToNextLevel) XP")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

private struct EnemyCard: View {
    let enemy: Shared.Enemy
    let profile: Shared.PlayerProfile
    let onTap: () -> Void

    private var isUnlocked: Bool {
        enemy.isUnlocked(profile: profile)
    }

    private var lockReason: String? {
        enemy.lockReason(profile: profile)
    }

    var body: some View {
        Button {
            if isUnlocked { onTap() }
        } label: {
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .center, spacing: 12) {
                    ZStack {
                        Circle()
                            .fill(color(from: enemy.themeColor).opacity(0.16))
                            .frame(width: 44, height: 44)
                        Image(systemName: enemy.iconName)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(color(from: enemy.themeColor))
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text(enemy.name)
                            .font(.headline)
                        Text(enemy.title)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                    }
                    Spacer()
                    if !isUnlocked {
                        Image(systemName: "lock.fill")
                            .foregroundStyle(.secondary)
                    }
                }

                Text(enemy.description_)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)

                if let reason = lockReason {
                    Text(reason)
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)
                        .padding(.top, 4)
                }
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(.ultraThinMaterial)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(isUnlocked ? color(from: enemy.themeColor).opacity(0.25) : Color.secondary.opacity(0.2), lineWidth: 1)
            )
            .opacity(isUnlocked ? 1 : 0.6)
        }
        .buttonStyle(.plain)
    }

    private func color(from hex: String) -> Color {
        let cleaned = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        guard cleaned.count == 6, let intValue = Int(cleaned, radix: 16) else { return .blue }
        let r = Double((intValue >> 16) & 0xFF) / 255.0
        let g = Double((intValue >> 8) & 0xFF) / 255.0
        let b = Double(intValue & 0xFF) / 255.0
        return Color(red: r, green: g, blue: b)
    }
}


```

---
### `iosApp/iprep/ContentView.swift`
- Size: `4993` bytes
```
import SwiftUI

#if canImport(Shared)
import Shared
#endif

/// Entry point view that replicates the original IPREP navigation flow.
struct RootView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @State private var navigationPath: [AppRoute] = []
    @StateObject private var duelStore = DuelStore()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            LandingView(
                onStartPractice: { navigationPath.append(.quiz(.quickStart(resume: false))) },
                onContinueSession: { navigationPath.append(.quiz(.quickStart(resume: true))) },
                onShowProgress: { navigationPath.append(.analytics) },
                onShowDashboard: { navigationPath.append(.dashboard) },
                onSelectModule: { module in
                    navigationPath.append(.quiz(.module(id: module.id, title: module.title)))
                },
                onRetryIncorrect: {
                    navigationPath.append(.quiz(.incorrectOnly))
                },
                onExploreQuestions: {
                    navigationPath.append(.questionExplorer)
                },
                onShowCrosswords: {
                    navigationPath.append(.crosswords)
                },
                onShowLeaderboard: {
                    navigationPath.append(.leaderboard)
                },
                onShowDuel: {
                    navigationPath.append(.duelEnemySelect)
                }
            )
            .environmentObject(environment)
            .environmentObject(duelStore)
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .dashboard:
                    DashboardView { destination in
                        navigationPath.append(destination)
                    }
                    .environmentObject(environment)
                    .environmentObject(duelStore)
                case let .quiz(mode):
                    QuizView(mode: mode)
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case .progressReport:
                    ProgressReportView()
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case .review:
                    ReviewView()
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case .analytics:
                    AnalyticsView()
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case .settings:
                    SettingsView()
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case .questionExplorer:
                    QuestionExplorerView()
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case .leaderboard:
                    LeaderboardView()
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case .crosswords:
                    CrosswordsView()
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case let .crossword(puzzleId, title):
                    CrosswordPuzzleView(puzzleId: puzzleId, title: title)
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case .duelEnemySelect:
                    EnemySelectView { enemyId in
                        navigationPath.append(.duel(enemyId: enemyId))
                    }
                    .environmentObject(environment)
                    .environmentObject(duelStore)
                case let .duel(enemyId):
                    DuelView(enemyId: enemyId, engine: environment.duelEngineCore, store: duelStore)
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                }
            }
        }
    }
}

/// Convenience wrapper so previews continue to work with Xcode's template expectation.
struct ContentView: View {
    var body: some View {
        RootView()
            .environmentObject(AppEnvironment.shared)
#if DEBUG && canImport(Shared)
            .overlay(alignment: .bottom) {
                KMPGreetingBanner()
            }
#endif
    }
}

#Preview {
    ContentView()
}

#if canImport(Shared)
private struct KMPGreetingBanner: View {
    private let greeting = Greeter().hello(name: "AABIP")

    var body: some View {
        Text(greeting)
            .font(.footnote)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(.thinMaterial)
    }
}
#endif

```

---
### `iosApp/iprep/Services/StudyPlanner.swift`
- Size: `5131` bytes
```
import Foundation
import Shared

protocol StudyPlannerType: AnyObject {
    func reviewQueue(limit: Int) -> [QuizSessionQuestion]
    func adaptiveDrill(limit: Int) -> [QuizSessionQuestion]
}

final class StudyPlanner: StudyPlannerType {
    private let questionBank: QuestionBankService
    private let localStore: LocalStoreType
    private var questionReferenceLookup: [String: QuizSessionQuestionReference]

    init(questionBank: QuestionBankService, localStore: LocalStoreType) {
        self.questionBank = questionBank
        self.localStore = localStore
        var lookup: [String: QuizSessionQuestionReference] = [:]
        for module in questionBank.moduleSummaries() {
            let sessionQuestions = questionBank.sessionQuestions(forModule: module.id)
            for question in sessionQuestions {
                lookup[question.question.id] = QuizSessionQuestionReference(moduleID: module.id, questionID: question.question.id)
            }
        }
        self.questionReferenceLookup = lookup
    }

    func reviewQueue(limit: Int) -> [QuizSessionQuestion] {
        let states = localStore.allStudyStates()
        let dueQuestions = Array(
            states
                .filter { $0.value.needsReview }
                .sorted(by: { (lhs: (key: String, value: QuestionStudyState), rhs: (key: String, value: QuestionStudyState)) -> Bool in
                    let leftDate = lhs.value.dueAt ?? Date.distantPast
                    let rightDate = rhs.value.dueAt ?? Date.distantPast
                    return leftDate < rightDate
                })
                .prefix(limit)
        )
        if dueQuestions.isEmpty {
            // Fall back to unseen questions to seed the queue.
            let answered = localStore.answeredQuestionIDs()
            return questionBank.quickStartQuestions(limit: limit, excluding: answered)
        }
        let references = dueQuestions.compactMap { reference(for: $0.key) }
        let restored = questionBank.sessionQuestions(from: references)
        if restored.count < limit {
            let remaining = limit - restored.count
            let topUp = questionBank.quickStartQuestions(limit: remaining)
            return restored + topUp
        }
        return restored
    }

    func adaptiveDrill(limit: Int) -> [QuizSessionQuestion] {
        let sessions = localStore.completedQuizSessions()
        guard !sessions.isEmpty else {
            return questionBank.quickStartQuestions(limit: limit)
        }
        var moduleScores: [String: (correct: Int, total: Int)] = [:]
        for session in sessions {
            for reference in session.questionReferences {
                guard let sessionQuestion = questionBank.sessionQuestion(for: reference) else { continue }
                let questionID = sessionQuestion.question.id
                let selected = session.selections[questionID]
                var entry = moduleScores[reference.moduleID, default: (0, 0)]
                entry.total += 1
                if selected == sessionQuestion.question.correctOptionId {
                    entry.correct += 1
                }
                moduleScores[reference.moduleID] = entry
            }
        }

        let sortedModules = moduleScores
            .map { key, value -> (moduleID: String, accuracy: Double) in
                let accuracy = value.total == 0 ? 0 : Double(value.correct) / Double(value.total)
                return (key, accuracy)
            }
            .sorted { lhs, rhs in
                lhs.accuracy < rhs.accuracy
            }

        var questions: [QuizSessionQuestion] = []
        for module in sortedModules {
            let moduleQuestions = questionBank.sessionQuestions(forModule: module.moduleID)
            for question in moduleQuestions.shuffled() {
                if questions.contains(where: { $0.id == question.id }) { continue }
                questions.append(question)
                if questions.count >= limit { break }
            }
            if questions.count >= limit { break }
        }

        if questions.count < limit {
            let topUp = questionBank.quickStartQuestions(limit: limit - questions.count)
            for question in topUp where !questions.contains(where: { $0.id == question.id }) {
                questions.append(question)
                if questions.count >= limit { break }
            }
        }

        return questions
    }

    private func reference(for questionID: String) -> QuizSessionQuestionReference? {
        if let existing = questionReferenceLookup[questionID] {
            return existing
        }
        for module in questionBank.moduleSummaries() {
            let sessionQuestions = questionBank.sessionQuestions(forModule: module.id)
            if let match = sessionQuestions.first(where: { $0.question.id == questionID }) {
                let reference = QuizSessionQuestionReference(moduleID: match.module.id, questionID: match.question.id)
                questionReferenceLookup[questionID] = reference
                return reference
            }
        }
        return nil
    }
}

```

---
### `iosApp/iprep/Features/Duel/DuelViewModel.swift`
- Size: `5224` bytes
```
import Combine
import Foundation
import Shared

@MainActor
final class DuelViewModel: ObservableObject {
    @Published private(set) var state: Shared.DuelState?
    @Published private(set) var isResolving = false

    private let engine: Shared.DuelEngineService
    private let store: DuelStore

    private var cancellables: Set<AnyCancellable> = []
    private var duelFlow: FlowPublisher<Shared.DuelState?>?
    private var recordedDuelId: String?

    init(engine: Shared.DuelEngineService, store: DuelStore) {
        self.engine = engine
        self.store = store
        bind()
    }

    private func bind() {
        let flow = FlowPublisher(flow: engine.currentDuel) { value in
            value as? Shared.DuelState
        }
        self.duelFlow = flow

        flow.publisher
            .receive(on: RunLoop.main)
            .sink { [weak self] duel in
                self?.state = duel
            }
            .store(in: &cancellables)
    }

    func startDuel(enemyId: String) {
        guard let enemy = Shared.EnemyDefinitions.shared.enemy(id: enemyId) else { return }

        engine.setPlayerContext(
            recentSeen: store.data.recentlySeenQuestionIds,
            recentMissed: store.data.recentlyMissedQuestionIds,
            weakTopics: store.weakTopics()
        )
        recordedDuelId = nil
        _ = engine.startDuel(enemy: enemy)
    }

    func proceedToQuestion() {
        engine.proceedToQuestion()
    }

    func useHint() {
        _ = engine.useHint()
    }

    func useShield() {
        _ = engine.useShield()
    }

    func useDoubleTap() {
        _ = engine.useDoubleTap()
    }

    func submitAnswer(_ answer: Bool) {
        guard let state, let question = state.currentQuestion else { return }
        guard state.phase == .question else { return }

        let topic = question.topic
        let priorStreak = Int(state.currentStreak)
        let newStreak = answer == question.answer ? priorStreak + 1 : 0

        guard let result = engine.submitAnswer(playerAnswer: answer) else { return }

        applyAnswerToProfile(topic: topic, isCorrect: result.isCorrect, streak: newStreak)
        store.updateRecentQuestionIds(
            seen: engine.recentlySeenQuestionIds(),
            missed: engine.recentlyMissedQuestionIds()
        )

        // UI can animate locally before we advance the shared phase.
        isResolving = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            guard let self else { return }
            self.engine.showFeedback()
            self.isResolving = false
            self.maybeRecordCompletedDuel()
        }
    }

    func proceedAfterFeedback() {
        engine.proceedToNextQuestion()
    }

    func endDuel() {
        engine.endDuel()
    }

    private func applyAnswerToProfile(topic: String, isCorrect: Bool, streak: Int) {
        let base = store.data.playerProfile
        let mastered = DuelPersistenceKt.updateMastery(profile: base, topic: topic, isCorrect: isCorrect)

        let totalAnswered = mastered.totalAnswered + 1
        let totalCorrect = mastered.totalCorrect + (isCorrect ? 1 : 0)
        let longestStreak = max(Int(mastered.longestStreak), streak)

        let updated = mastered.doCopy(
            id: mastered.id,
            xp: mastered.xp,
            level: mastered.level,
            duelsWon: mastered.duelsWon,
            duelsLost: mastered.duelsLost,
            totalCorrect: totalCorrect,
            totalAnswered: totalAnswered,
            longestStreak: Int32(longestStreak),
            defeatedEnemies: mastered.defeatedEnemies,
            topicMastery: mastered.topicMastery
        )

        store.updateProfile(updated)
    }

    private func maybeRecordCompletedDuel() {
        guard let completed = engine.getCompletedDuel() else { return }
        guard recordedDuelId != completed.id else { return }
        recordedDuelId = completed.id

        applyCompletedDuel(completed)
        store.addCompletedDuel(completed)
        store.updateRecentQuestionIds(
            seen: engine.recentlySeenQuestionIds(),
            missed: engine.recentlyMissedQuestionIds()
        )
    }

    private func applyCompletedDuel(_ duel: Shared.CompletedDuel) {
        let base = store.data.playerProfile
        let newXP = base.xp + duel.xpEarned
        let newLevel = Shared.PlayerProfile.companion.levelForXP(xp: newXP)

        let won = duel.won
        let duelsWon = base.duelsWon + (won ? 1 : 0)
        let duelsLost = base.duelsLost + (!won ? 1 : 0)

        var defeated = Set(base.defeatedEnemies)
        if won {
            defeated.insert(duel.enemyId)
        }

        let longestStreak = max(Int(base.longestStreak), Int(duel.maxStreak))

        let updated = base.doCopy(
            id: base.id,
            xp: newXP,
            level: newLevel,
            duelsWon: duelsWon,
            duelsLost: duelsLost,
            totalCorrect: base.totalCorrect,
            totalAnswered: base.totalAnswered,
            longestStreak: Int32(longestStreak),
            defeatedEnemies: defeated,
            topicMastery: base.topicMastery
        )

        store.updateProfile(updated)
    }
}

```

---
### `iosApp/iprep/Features/Leaderboard/LeaderboardView.swift`
- Size: `5234` bytes
```
import SwiftUI
import Shared

struct LeaderboardView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @State private var isOptedIn: Bool = false
    @State private var alias: String = ""

    private var snapshot: LeaderboardSnapshot? {
        environment.leaderboardSnapshot()
    }

    var body: some View {
        List {
            Section(header: Text("Participation")) {
                Toggle(isOn: $isOptedIn) {
                    Label("Opt into weekly leaderboards", systemImage: "trophy")
                }
                .toggleStyle(SwitchToggleStyle(tint: Color.ipAccent))

                VStack(alignment: .leading, spacing: 12) {
                    Text("Choose the display name shown on the leaderboard.")
                        .font(.footnote.weight(.semibold))
                    TextField("Display name", text: $alias)
                        .textInputAutocapitalization(.words)
                        .disableAutocorrection(true)
                        .disabled(!isOptedIn)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(Color.ipSurface)
                        )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("We use a pseudonymous ID and aggregate data only. No personal identifiers are shared.")
                        .font(.footnote)
                        .foregroundStyle(Color.secondary)
                }
                .listRowBackground(Color.clear)
            }

            if isOptedIn {
                resultsSection
            } else {
                Section {
                    ContentUnavailableView(
                        "Leaderboards disabled",
                        systemImage: "lock.slash",
                        description: Text("Enable the toggle above to see your weekly percentile by domain."))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .listRowInsets(EdgeInsets())
                }
            }
        }
        .listStyle(.insetGrouped)
        .background(Color.ipBackground.ignoresSafeArea())
        .navigationTitle("Leaderboards")
        .onAppear {
            isOptedIn = environment.leaderboardOptIn()
            alias = environment.leaderboardAlias()
        }
        .onChange(of: isOptedIn) { _, newValue in
            environment.setLeaderboardOptIn(newValue)
            if newValue {
                alias = environment.leaderboardAlias()
            }
        }
        .onChange(of: alias) { oldValue, newValue in
            guard isOptedIn, newValue != oldValue else { return }
            environment.setLeaderboardAlias(newValue)
            let stored = environment.leaderboardAlias()
            if stored != newValue {
                alias = stored
            }
        }
    }

    private var resultsSection: some View {
        Section(header: resultsHeader) {
            if let snapshot, !snapshot.domains.isEmpty {
                ForEach(snapshot.domains) { domain in
                    LeaderboardRow(domain: domain)
                        .listRowBackground(Color.ipSurface)
                }
            } else {
                ContentUnavailableView(
                    "No data yet",
                    systemImage: "chart.line.uptrend.xyaxis",
                    description: Text("Complete a quiz to start building your leaderboard stats."))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .listRowInsets(EdgeInsets())
            }
        }
    }

    private var resultsHeader: some View {
        HStack {
            Text("Weekly percentiles")
            Spacer()
            if let snapshot {
                VStack(alignment: .trailing, spacing: 2) {
                    Text(snapshot.alias)
                        .font(.footnote.weight(.semibold))
                    Text("ID: \(snapshot.participantID.prefix(8))…")
                        .font(.caption.monospacedDigit())
                        .foregroundStyle(Color.secondary)
                }
            }
        }
    }
}

private struct LeaderboardRow: View {
    let domain: LeaderboardSnapshot.DomainScore

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(domain.title)
                    .font(.headline)
                Spacer()
                Text("\(Int(domain.percentile * 100))th")
                    .font(.caption.weight(.semibold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Capsule().fill(Color.ipAccent.opacity(0.18)))
            }
            ProgressView(value: domain.accuracy, total: 1.0) {
                Text("Accuracy")
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
            }
            .tint(Color.ipAccent)
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    NavigationStack {
        LeaderboardView()
            .environmentObject(AppEnvironment.shared)
    }
}

```

---
### `iosApp/iprep/Models/QuizSessionState.swift`
- Size: `5263` bytes
```
import Foundation

struct QuizSessionQuestionReference: Codable, Hashable {
    let moduleID: String
    let questionID: String
}

struct QuizSessionState: Codable, Equatable {
    let id: UUID
    let startedAt: Date
    var lastUpdatedAt: Date
    var currentIndex: Int
    var questionReferences: [QuizSessionQuestionReference]
    var selections: [String: String]
    var elapsedSeconds: TimeInterval
    var perQuestionSeconds: [String: TimeInterval]
    var configuration: QuizSessionConfiguration

    init(
        id: UUID,
        startedAt: Date,
        lastUpdatedAt: Date,
        currentIndex: Int,
        questionReferences: [QuizSessionQuestionReference],
        selections: [String: String],
        elapsedSeconds: TimeInterval = 0,
        perQuestionSeconds: [String: TimeInterval] = [:],
        configuration: QuizSessionConfiguration = .default
    ) {
        self.id = id
        self.startedAt = startedAt
        self.lastUpdatedAt = lastUpdatedAt
        self.currentIndex = currentIndex
        self.questionReferences = questionReferences
        self.selections = selections
        self.elapsedSeconds = elapsedSeconds
        self.perQuestionSeconds = perQuestionSeconds
        self.configuration = configuration
    }

    var totalQuestions: Int { questionReferences.count }
    var answeredQuestionIDs: Set<String> { Set(selections.keys) }
    var isCompleted: Bool { currentIndex >= totalQuestions }
}

extension QuizSessionState {
    private enum CodingKeys: String, CodingKey {
        case id
        case startedAt
        case lastUpdatedAt
        case currentIndex
        case questionReferences
        case selections
        case elapsedSeconds
        case perQuestionSeconds
        case configuration
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(UUID.self, forKey: .id)
        let startedAt = try container.decode(Date.self, forKey: .startedAt)
        let lastUpdatedAt = try container.decode(Date.self, forKey: .lastUpdatedAt)
        let currentIndex = try container.decode(Int.self, forKey: .currentIndex)
        let questionReferences = try container.decode([QuizSessionQuestionReference].self, forKey: .questionReferences)
        let selections = try container.decode([String: String].self, forKey: .selections)
        let elapsedSeconds = try container.decodeIfPresent(TimeInterval.self, forKey: .elapsedSeconds) ?? 0
        let perQuestionSeconds = try container.decodeIfPresent([String: TimeInterval].self, forKey: .perQuestionSeconds) ?? [:]
        let configuration = try container.decodeIfPresent(QuizSessionConfiguration.self, forKey: .configuration) ?? .default

        self.init(
            id: id,
            startedAt: startedAt,
            lastUpdatedAt: lastUpdatedAt,
            currentIndex: currentIndex,
            questionReferences: questionReferences,
            selections: selections,
            elapsedSeconds: elapsedSeconds,
            perQuestionSeconds: perQuestionSeconds,
            configuration: configuration
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(startedAt, forKey: .startedAt)
        try container.encode(lastUpdatedAt, forKey: .lastUpdatedAt)
        try container.encode(currentIndex, forKey: .currentIndex)
        try container.encode(questionReferences, forKey: .questionReferences)
        try container.encode(selections, forKey: .selections)
        if elapsedSeconds != 0 {
            try container.encode(elapsedSeconds, forKey: .elapsedSeconds)
        }
        if !perQuestionSeconds.isEmpty {
            try container.encode(perQuestionSeconds, forKey: .perQuestionSeconds)
        }
        if configuration != .default {
            try container.encode(configuration, forKey: .configuration)
        }
    }
}

extension QuizSessionState {
    static func == (lhs: QuizSessionState, rhs: QuizSessionState) -> Bool {
        lhs.id == rhs.id &&
            lhs.startedAt == rhs.startedAt &&
            lhs.lastUpdatedAt == rhs.lastUpdatedAt &&
            lhs.currentIndex == rhs.currentIndex &&
            lhs.questionReferences == rhs.questionReferences &&
            lhs.selections == rhs.selections &&
            lhs.elapsedSeconds == rhs.elapsedSeconds &&
            lhs.perQuestionSeconds == rhs.perQuestionSeconds &&
            lhs.configuration == rhs.configuration
    }
}

struct CompletedQuizSession: Codable, Identifiable, Equatable, Hashable {
    let id: UUID
    let startedAt: Date
    let completedAt: Date
    let duration: TimeInterval
    let totalQuestions: Int
    let correctCount: Int
    let questionReferences: [QuizSessionQuestionReference]
    let selections: [String: String]

    var accuracy: Double {
        guard totalQuestions > 0 else { return 0 }
        return Double(correctCount) / Double(totalQuestions)
    }

    static func == (lhs: CompletedQuizSession, rhs: CompletedQuizSession) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

```

---
### `iosApp/iprep/Services/LocalStore.swift`
- Size: `7244` bytes
```
import Combine
import Foundation
import Shared

protocol LocalStoreType: AnyObject {
    func warmStart() async
    var downloadedModuleIDsPublisher: AnyPublisher<Set<String>, Never> { get }
    func isModuleDownloaded(_ id: String) -> Bool
    func markModuleDownloaded(_ id: String)
    func removeDownload(for id: String)
    var activeQuizSessionPublisher: AnyPublisher<QuizSessionState?, Never> { get }
    func activeQuizSession() -> QuizSessionState?
    func saveActiveQuizSession(_ session: QuizSessionState?)
    var completedQuizSessionsPublisher: AnyPublisher<[CompletedQuizSession], Never> { get }
    func completedQuizSessions() -> [CompletedQuizSession]
    func addCompletedQuizSession(_ session: CompletedQuizSession)
    func answeredQuestionIDs() -> Set<String>
    var studyStatesPublisher: AnyPublisher<[String: QuestionStudyState], Never> { get }
    func studyState(for questionID: String) -> QuestionStudyState?
    func updateStudyState(_ state: QuestionStudyState, for questionID: String)
    func updateStudyStates(_ states: [String: QuestionStudyState])
    func allStudyStates() -> [String: QuestionStudyState]
    func resetProgress()
}

final class LocalStore: LocalStoreType {
    private enum Constants {
        static let downloadedKey = "AABIPIPREP.downloadedModules"
        static let activeQuizKey = "AABIPIPREP.activeQuizSession"
        static let completedQuizKey = "AABIPIPREP.completedQuizSessions"
        static let studyStatesKey = "AABIPIPREP.questionStudyStates"
    }

    private let defaults: UserDefaults
    private let subject: CurrentValueSubject<Set<String>, Never>
    private let activeSessionSubject: CurrentValueSubject<QuizSessionState?, Never>
    private let completedSessionsSubject: CurrentValueSubject<[CompletedQuizSession], Never>
    private let studyStatesSubject: CurrentValueSubject<[String: QuestionStudyState], Never>
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        let initial = Set(defaults.stringArray(forKey: Constants.downloadedKey) ?? [])
        self.subject = CurrentValueSubject<Set<String>, Never>(initial)

        if let data = defaults.data(forKey: Constants.activeQuizKey),
           let session = try? decoder.decode(QuizSessionState.self, from: data) {
            self.activeSessionSubject = CurrentValueSubject<QuizSessionState?, Never>(session)
        } else {
            self.activeSessionSubject = CurrentValueSubject<QuizSessionState?, Never>(nil)
        }

        if let data = defaults.data(forKey: Constants.completedQuizKey),
           let sessions = try? decoder.decode([CompletedQuizSession].self, from: data) {
            self.completedSessionsSubject = CurrentValueSubject<[CompletedQuizSession], Never>(sessions)
        } else {
            self.completedSessionsSubject = CurrentValueSubject<[CompletedQuizSession], Never>([])
        }

        if let data = defaults.data(forKey: Constants.studyStatesKey),
           let states = try? decoder.decode([String: QuestionStudyState].self, from: data) {
            self.studyStatesSubject = CurrentValueSubject<[String: QuestionStudyState], Never>(states)
        } else {
            self.studyStatesSubject = CurrentValueSubject<[String: QuestionStudyState], Never>([:])
        }
    }

    func warmStart() async {
        subject.send(subject.value)
        activeSessionSubject.send(activeSessionSubject.value)
        completedSessionsSubject.send(completedSessionsSubject.value)
        studyStatesSubject.send(studyStatesSubject.value)
    }

    var downloadedModuleIDsPublisher: AnyPublisher<Set<String>, Never> {
        subject.eraseToAnyPublisher()
    }

    func isModuleDownloaded(_ id: String) -> Bool {
        subject.value.contains(id)
    }

    func markModuleDownloaded(_ id: String) {
        var current = subject.value
        guard !current.contains(id) else { return }
        current.insert(id)
        subject.send(current)
        defaults.set(Array(current), forKey: Constants.downloadedKey)
    }

    func removeDownload(for id: String) {
        var current = subject.value
        guard current.contains(id) else { return }
        current.remove(id)
        subject.send(current)
        defaults.set(Array(current), forKey: Constants.downloadedKey)
    }

    var activeQuizSessionPublisher: AnyPublisher<QuizSessionState?, Never> {
        activeSessionSubject.eraseToAnyPublisher()
    }

    func activeQuizSession() -> QuizSessionState? {
        activeSessionSubject.value
    }

    func saveActiveQuizSession(_ session: QuizSessionState?) {
        activeSessionSubject.send(session)
        if let session {
            if let data = try? encoder.encode(session) {
                defaults.set(data, forKey: Constants.activeQuizKey)
            }
        } else {
            defaults.removeObject(forKey: Constants.activeQuizKey)
        }
    }

    var completedQuizSessionsPublisher: AnyPublisher<[CompletedQuizSession], Never> {
        completedSessionsSubject.eraseToAnyPublisher()
    }

    func completedQuizSessions() -> [CompletedQuizSession] {
        completedSessionsSubject.value
    }

    func answeredQuestionIDs() -> Set<String> {
        let sessions = completedSessionsSubject.value
        var ids: Set<String> = []
        for session in sessions {
            for questionID in session.selections.keys {
                ids.insert(questionID)
            }
        }
        return ids
    }

    var studyStatesPublisher: AnyPublisher<[String: QuestionStudyState], Never> {
        studyStatesSubject.eraseToAnyPublisher()
    }

    func studyState(for questionID: String) -> QuestionStudyState? {
        studyStatesSubject.value[questionID]
    }

    func allStudyStates() -> [String: QuestionStudyState] {
        studyStatesSubject.value
    }

    func updateStudyState(_ state: QuestionStudyState, for questionID: String) {
        var states = studyStatesSubject.value
        states[questionID] = state
        updateStudyStates(states)
    }

    func updateStudyStates(_ states: [String: QuestionStudyState]) {
        studyStatesSubject.send(states)
        if let data = try? encoder.encode(states) {
            defaults.set(data, forKey: Constants.studyStatesKey)
        }
    }

    func resetProgress() {
        completedSessionsSubject.send([])
        defaults.removeObject(forKey: Constants.completedQuizKey)
        saveActiveQuizSession(nil)
        defaults.removeObject(forKey: Constants.studyStatesKey)
        studyStatesSubject.send([:])
    }

    func addCompletedQuizSession(_ session: CompletedQuizSession) {
        var current = completedSessionsSubject.value
        current.append(session)
        current.sort { $0.completedAt > $1.completedAt }
        if current.count > 50 {
            current = Array(current.prefix(50))
        }
        completedSessionsSubject.send(current)
        if let data = try? encoder.encode(current) {
            defaults.set(data, forKey: Constants.completedQuizKey)
        }
        // Clearing any active session when a completion is recorded ensures consistency.
        saveActiveQuizSession(nil)
    }
}

```

---
### `iosApp/iprep/Features/Dashboard/DashboardView.swift`
- Size: `9423` bytes
```
import SwiftUI
import Shared

public struct DashboardView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @State private var modules: [Module] = []
    @State private var snapshot: DashboardSnapshot = DashboardSnapshot(
        streakCount: 0,
        correctRate: 0.0,
        recentActivityDescription: "Loading..."
    )
    @State private var downloadAlert: DownloadAlert?
    private let navigate: (AppRoute) -> Void

    public init(navigate: @escaping (AppRoute) -> Void = { _ in }) {
        self.navigate = navigate
    }

    private var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 260), spacing: 20)]
    }

    private var hasActiveQuiz: Bool {
        environment.activeQuizSession != nil
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                header
                performance
                moduleGrid
                Divider()
                featureLinks
            }
            .padding(.vertical, 32)
            .padding(.horizontal, 20)
        }
        .background(Color.ipBackground.ignoresSafeArea())
        .navigationTitle("Dashboard")
#if os(iOS)
        .navigationBarTitleDisplayMode(.large)
#endif
        .dynamicTypeSize(.medium ... .accessibility3)
        .task {
            await loadContent()
        }
        .alert(item: $downloadAlert) { alert in
            Alert(
                title: Text("Download Complete"),
                message: Text(alert.message),
                dismissButton: .default(Text("OK"))
            )
        }
        .onAppear {
            if modules.isEmpty {
                modules = environment.questionBankService.moduleSummaries()
            }
            if snapshot.recentActivityDescription == "Loading..." {
                let moduleCount = environment.questionBankService.moduleCount()
                let questionCount = environment.questionBankService.totalQuestionCount
                let estimatedMinutes = modules.reduce(0) { $0 + Int($1.estimatedTimeMinutes) }
                snapshot = DashboardSnapshot(
                    streakCount: max(3, moduleCount + 1),
                    correctRate: 0.78,
                    recentActivityDescription: "\(moduleCount) modules • \(questionCount) questions • ~\(estimatedMinutes) min of content"
                )
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Ready to keep practicing?")
                .font(Typography.heading())
                .foregroundStyle(Color.primary)

            HStack(spacing: 14) {
                Button(action: startQuickQuiz) {
                    Label("Quick Start", systemImage: "bolt.fill")
                        .font(Typography.bodyEmphasis())
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.ipAccent)
                .accessibilityLabel(Text("Start quick quiz"))
                .accessibilityHint(Text("Opens a new mixed-topic quiz"))

                Button(action: continueQuiz) {
                    Label("Continue Quiz", systemImage: "play.circle")
                        .font(Typography.bodyEmphasis())
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                }
                .buttonStyle(.bordered)
                .tint(Color.ipMutedAccent)
                .disabled(!hasActiveQuiz)
                .opacity(hasActiveQuiz ? 1 : 0.6)
                .accessibilityLabel(Text("Continue saved quiz"))
                .accessibilityHint(Text(hasActiveQuiz ? "Resume your in-progress quiz" : "No quiz in progress"))
            }
        }
    }

    private var performance: some View {
        Button {
            navigate(.analytics)
        } label: {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .firstTextBaseline) {
                    Text("Performance Snapshot")
                        .font(Typography.heading(size: .title3))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(Color.secondary)
                }
                HStack(alignment: .top, spacing: 20) {
                    MetricTile(title: "Correct", value: snapshot.correctRate, format: .percent)
                    MetricTile(title: "Streak", value: Double(snapshot.streakCount), format: .integer)
                }
                Text(snapshot.recentActivityDescription)
                    .font(.footnote)
                    .foregroundStyle(Color.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.ipSurface)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            .shadow(color: Color.black.opacity(0.05), radius: 12, y: 8)
        }
        .buttonStyle(.plain)
        .accessibilityHint(Text("Opens analytics overview"))
    }

    private var moduleGrid: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Modules")
                .font(Typography.heading(size: .title3))
            if modules.isEmpty {
                Text("Question bank is warming up…")
                    .font(.callout)
                    .foregroundStyle(Color.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 32)
            } else {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(modules) { module in
                        ModuleCard(
                            module: module,
                            isDownloaded: environment.downloadedModuleIDs.contains(module.id)
                        ) {
                            handleDownload(for: module)
                        }
                        .accessibilityElement(children: .contain)
                    }
                }
            }
        }
    }

    private var featureLinks: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("More")
                .font(Typography.heading(size: .title3))
            VStack(alignment: .leading, spacing: 12) {
                Button {
                    navigate(.review)
                } label: {
                    Label("Review", systemImage: "bookmark")
                        .font(.body)
                }
                Button {
                    navigate(.analytics)
                } label: {
                    Label("Analytics", systemImage: "chart.line.uptrend.xyaxis")
                        .font(.body)
                }
                Button {
                    navigate(.settings)
                } label: {
                    Label("Settings", systemImage: "gearshape")
                        .font(.body)
                }
            }
            .buttonStyle(.plain)
        }
    }

    private func startQuickQuiz() {
        navigate(.quiz(.quickStart(resume: false)))
    }

    private func continueQuiz() {
        guard hasActiveQuiz else {
            startQuickQuiz()
            return
        }
        navigate(.quiz(.quickStart(resume: true)))
    }

    private func loadContent() async {
        async let modulesTask = environment.firestoreService.fetchModules()
        async let snapshotTask = environment.firestoreService.fetchDashboardSnapshot()

        if let fetchedModules = try? await modulesTask {
            modules = fetchedModules
        }
        if let fetchedSnapshot = try? await snapshotTask {
            snapshot = fetchedSnapshot
        }
    }

    private func handleDownload(for module: Module) {
        if environment.downloadedModuleIDs.contains(module.id) {
            downloadAlert = DownloadAlert(message: "\(module.title) is already available offline.")
            return
        }
        environment.markModuleDownloaded(module.id)
        downloadAlert = DownloadAlert(message: "\(module.title) questions are now available offline.")
    }
}

private struct DownloadAlert: Identifiable {
    let id = UUID()
    let message: String
}

private struct MetricTile: View {
    enum MetricFormat {
        case percent
        case integer
    }

    let title: String
    let value: Double
    let format: MetricFormat

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(formattedValue)
                .font(Typography.heading(size: .title))
            Text(title.uppercased())
                .font(.caption)
                .foregroundStyle(Color.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.ipSurfaceElevated)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text("\(title) \(formattedValue)"))
    }

    private var formattedValue: String {
        switch format {
        case .percent:
            value.formatted(.percent.precision(.fractionLength(0)))
        case .integer:
            Int(value).formatted()
        }
    }
}

```

---
### `iosApp/iprep/Features/Analytics/ProgressReportView.swift`
- Size: `12171` bytes
```
import SwiftUI
#if canImport(UIKit)
import UIKit
#endif
import Shared

struct ProgressReportView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @Environment(\.dismiss) private var dismiss

    @State private var startDate: Date = Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date()
    @State private var endDate: Date = Date()
    @State private var selectedCategories: Set<String> = []
    @State private var didInitialize = false
    @State private var didCopyReport = false

    private var modules: [Module] {
        environment.questionBankService.moduleSummaries().sorted { $0.title < $1.title }
    }

    private var activeCategoryIDs: Set<String> {
        let all = Set(modules.map(\.id))
        let filtered = selectedCategories.isEmpty ? all : selectedCategories
        return filtered.isEmpty ? all : filtered
    }

    private var reportData: ReportData {
        ReportBuilder.buildReport(
            sessions: environment.completedQuizSessions,
            questionBank: environment.questionBankService,
            startDate: startDate,
            endDate: endDate,
            includedCategoryIDs: activeCategoryIDs
        )
    }

    private var reportText: String {
        ReportBuilder.makeShareText(report: reportData, startDate: startDate, endDate: endDate)
    }

    var body: some View {
        Form {
            timeframeSection
            categorySection
            summarySection
            if reportData.totalQuestions > 0 {
                categoryBreakdownSection
                reportPreviewSection
                shareSection
            } else {
                Section {
                    Text("No sessions found in the selected timeframe. Adjust your filters and try again.")
                        .font(.footnote)
                        .foregroundStyle(Color.secondary)
                }
            }
        }
        .navigationTitle("Progress Report")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: initializeIfNeeded)
        .onChange(of: startDate) { _, newValue in
            if newValue > endDate {
                endDate = newValue
            }
        }
        .onChange(of: endDate) { _, newValue in
            if newValue < startDate {
                startDate = newValue
            }
        }
        .alert("Copied", isPresented: $didCopyReport) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Report text copied to the clipboard.")
        }
    }

    private var timeframeSection: some View {
        Section("Timeframe") {
            DatePicker("From", selection: $startDate, displayedComponents: .date)
            DatePicker("To", selection: $endDate, in: startDate...Date(), displayedComponents: .date)
            quickRangeButtons
        }
    }

    private var quickRangeButtons: some View {
        HStack {
            Button("7 days") { applyQuickRange(days: 7) }
            Button("30 days") { applyQuickRange(days: 30) }
            Button("90 days") { applyQuickRange(days: 90) }
        }
        .buttonStyle(.bordered)
    }

    private var categorySection: some View {
        Section("Categories") {
            if modules.isEmpty {
                Text("Question bank is still loading modules.")
                    .font(.footnote)
                    .foregroundStyle(Color.secondary)
            } else {
                ForEach(modules, id: \.id) { module in
                    Toggle(isOn: Binding(
                        get: { activeCategoryIDs.contains(module.id) },
                        set: { newValue in
                            if newValue {
                                selectedCategories.insert(module.id)
                            } else {
                                selectedCategories.remove(module.id)
                            }
                        }
                    )) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(module.title)
                                .font(.body)
                            Text("\(module.questionCount) questions • \(module.difficulty.rawValue.capitalized)")
                                .font(.caption)
                                .foregroundStyle(Color.secondary)
                        }
                    }
                }
                Button("Select All") {
                    selectedCategories = Set(modules.map(\.id))
                }
                .buttonStyle(.borderless)
                Button("Clear Selection") {
                    selectedCategories.removeAll()
                }
                .buttonStyle(.borderless)
            }
        }
    }

    private var summarySection: some View {
        Section("Overview") {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Total Questions")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                    Text("\(reportData.totalQuestions)")
                        .font(.title2.weight(.semibold))
                }
                Spacer()
                VStack(alignment: .leading, spacing: 8) {
                    Text("Overall Score")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                    Text(reportData.accuracy.formatted(.percent.precision(.fractionLength(1))))
                        .font(.title2.weight(.semibold))
                }
                Spacer()
                VStack(alignment: .leading, spacing: 8) {
                    Text("Correct")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                    Text("\(reportData.correctQuestions)")
                        .font(.title2.weight(.semibold))
                }
            }
        }
    }

    private var categoryBreakdownSection: some View {
        Section("Scores by Category") {
            ForEach(reportData.categories) { category in
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text(category.module.title)
                            .font(.headline)
                        Spacer()
                        Text(category.accuracy.formatted(.percent.precision(.fractionLength(1))))
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(category.accuracy >= 0.75 ? Color.green : Color.orange)
                    }
                    ProgressView(value: Double(category.correct), total: Double(category.total))
                        .tint(Color.ipAccent)
                    Text("\(category.correct)/\(category.total) correct")
                        .font(.caption)
                        .foregroundStyle(Color.secondary)
                }
                .padding(.vertical, 4)
            }
        }
    }

    private var reportPreviewSection: some View {
        Section("Report Preview") {
            Text(reportText)
                .font(.footnote)
                .textSelection(.enabled)
        }
    }

    private var shareSection: some View {
        Section {
            ShareLink(item: reportText) {
                Label("Share Report", systemImage: "square.and.arrow.up")
            }
#if canImport(UIKit)
            Button {
                UIPasteboard.general.string = reportText
                didCopyReport = true
            } label: {
                Label("Copy to Clipboard", systemImage: "doc.on.doc")
            }
#endif
        }
    }

    private func applyQuickRange(days: Int) {
        if let newStart = Calendar.current.date(byAdding: .day, value: -days, to: Date()) {
            startDate = newStart
            endDate = Date()
        }
    }

    private func initializeIfNeeded() {
        guard !didInitialize else { return }
        didInitialize = true
        selectedCategories = Set(modules.map(\.id))
        if startDate > endDate {
            startDate = endDate
        }
    }
}

private struct ReportData {
    let totalQuestions: Int
    let correctQuestions: Int
    let categories: [CategorySummary]

    var accuracy: Double {
        guard totalQuestions > 0 else { return 0 }
        return Double(correctQuestions) / Double(totalQuestions)
    }
}

private struct CategorySummary: Identifiable {
    let module: Module
    var correct: Int
    var total: Int

    var id: String { module.id }

    var accuracy: Double {
        guard total > 0 else { return 0 }
        return Double(correct) / Double(total)
    }
}

private enum ReportBuilder {
    static func buildReport(
        sessions: [CompletedQuizSession],
        questionBank: QuestionBankService,
        startDate: Date,
        endDate: Date,
        includedCategoryIDs: Set<String>
    ) -> ReportData {
        let calendar = Calendar.current
        let normalizedStart = calendar.startOfDay(for: startDate)
        let normalizedEnd: Date = {
            guard let endOfDay = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: endDate) else {
                return endDate
            }
            return endOfDay
        }()

        let filteredSessions = sessions.filter { session in
            session.completedAt >= normalizedStart && session.completedAt <= normalizedEnd
        }

        var categoryMap: [String: CategorySummary] = [:]
        var totalCorrect = 0
        var totalQuestions = 0

        for session in filteredSessions {
            for reference in session.questionReferences {
                guard includedCategoryIDs.contains(reference.moduleID),
                      let sessionQuestion = questionBank.sessionQuestion(for: reference) else { continue }

                let isCorrect = session.selections[sessionQuestion.question.id] == sessionQuestion.question.correctOptionId
                totalQuestions += 1
                if isCorrect { totalCorrect += 1 }

                var summary = categoryMap[reference.moduleID] ?? CategorySummary(
                    module: sessionQuestion.module.summary,
                    correct: 0,
                    total: 0
                )
                summary.total += 1
                if isCorrect { summary.correct += 1 }
                categoryMap[reference.moduleID] = summary
            }
        }

        // Ensure every selected category appears even if zero questions were answered.
        for module in questionBank.moduleSummaries() where includedCategoryIDs.contains(module.id) {
            if categoryMap[module.id] == nil {
                categoryMap[module.id] = CategorySummary(module: module, correct: 0, total: 0)
            }
        }

        let categories = categoryMap.values.sorted { lhs, rhs in
            lhs.module.title < rhs.module.title
        }

        return ReportData(
            totalQuestions: totalQuestions,
            correctQuestions: totalCorrect,
            categories: categories
        )
    }

    static func makeShareText(report: ReportData, startDate: Date, endDate: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let dateRange = "Report: \(formatter.string(from: startDate)) - \(formatter.string(from: endDate))"
        var lines = [dateRange]
        if report.totalQuestions > 0 {
            let percent = report.accuracy.formatted(.percent.precision(.fractionLength(1)))
            lines.append("Overall: \(report.correctQuestions)/\(report.totalQuestions) correct (\(percent))")
            lines.append("\nBy Category:")
            for category in report.categories.sorted(by: { $0.module.title < $1.module.title }) {
                let accuracy = category.accuracy.formatted(.percent.precision(.fractionLength(1)))
                lines.append("• \(category.module.title): \(category.correct)/\(category.total) (\(accuracy))")
            }
        } else {
            lines.append("No completed questions in this timeframe.")
        }
        return lines.joined(separator: "\n")
    }
}

```

---
### `iosApp/iprep/AppEnvironment.swift`
- Size: `12312` bytes
```
import Combine
import Foundation
#if canImport(Shared)
import Shared
#endif

@MainActor
public final class AppEnvironment: ObservableObject {
    public static let shared = AppEnvironment()

    let authService: AuthServiceType
    let firestoreService: FirestoreServiceType
    let storageService: StorageServiceType
    let remoteConfigService: RemoteConfigServiceType
    let featureFlags: FeatureFlags
    let mediaCache: MediaCacheType
    let syncManager: SyncManagerType
    let localStore: LocalStoreType
    let questionBankService: QuestionBankService
    let studyPlanner: StudyPlannerType
    let leaderboardService: LeaderboardServiceType

    private var cancellables: Set<AnyCancellable> = []
#if canImport(Shared)
    private let sharedCore: Shared.AppEnvironment
    private var sharedSessionFlow: FlowPublisher<Shared.QuizSessionState?>?
    private var sharedStudyStatesFlow: FlowPublisher<[String: Shared.QuestionStudyState]>?
    private var sharedSessionID: UUID?
    private var sharedSessionStartedAt: Date?
    private var sharedSessionSignature: String?
#endif

    @Published public private(set) var downloadedModuleIDs: Set<String> = []
    @Published private(set) var activeQuizSession: QuizSessionState?
    @Published private(set) var completedQuizSessions: [CompletedQuizSession] = []
    @Published private(set) var studyStates: [String: QuestionStudyState] = [:]

    private init() {
        print("[AppEnvironment] Starting initialization...")
        let authService = AuthService()
        print("[AppEnvironment] AuthService created")
#if canImport(Shared)
        print("[AppEnvironment] Creating new Shared.AppEnvironment directly...")
        // Create Kotlin AppEnvironment directly instead of using companion singleton
        // to avoid potential threading/timing issues
        let sharedCore = Shared.AppEnvironment()
        print("[AppEnvironment] sharedCore created: \(sharedCore)")
        self.sharedCore = sharedCore
        print("[AppEnvironment] Creating QuestionBankService with core...")
        let questionBankService = QuestionBankService(core: sharedCore.questionBankService)
        print("[AppEnvironment] QuestionBankService created")
#else
        let questionBankService = QuestionBankService()
#endif
        let firestoreService = FirestoreService(questionBank: questionBankService)
        let storageService = StorageService()
        let remoteConfigService = RemoteConfigService()
        let mediaCache = MediaCache()
        let localStore = LocalStore()
        let syncManager = SyncManager(localStore: localStore, firestore: firestoreService)
        let studyPlanner = StudyPlanner(questionBank: questionBankService, localStore: localStore)
        let leaderboardService = LeaderboardService()

        self.authService = authService
        self.firestoreService = firestoreService
        self.storageService = storageService
        self.remoteConfigService = remoteConfigService
        self.mediaCache = mediaCache
        self.localStore = localStore
        self.syncManager = syncManager
        self.featureFlags = FeatureFlags(remoteConfig: remoteConfigService)
        self.questionBankService = questionBankService
        self.studyPlanner = studyPlanner
        self.leaderboardService = leaderboardService

        print("[AppEnvironment] All services assigned, binding triggers...")
        bindSyncTriggers()
        bindLocalStore()
        print("[AppEnvironment] Initialization complete!")
    }

    private func bindSyncTriggers() {
        authService.userDidChange
            .sink { [weak syncManager] _ in
                syncManager?.scheduleSync()
            }
            .store(in: &cancellables)
    }

    private func bindLocalStore() {
        localStore.downloadedModuleIDsPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] ids in
                self?.downloadedModuleIDs = ids
            }
            .store(in: &cancellables)

        localStore.activeQuizSessionPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] session in
                self?.activeQuizSession = session
            }
            .store(in: &cancellables)

        localStore.completedQuizSessionsPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] sessions in
                self?.completedQuizSessions = sessions
            }
            .store(in: &cancellables)

        localStore.studyStatesPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] states in
                self?.studyStates = states
            }
            .store(in: &cancellables)

#if canImport(Shared)
        bindSharedFlows()
#endif
    }

#if canImport(Shared)
    /// Expose the shared duel engine for SwiftUI screens.
    var duelEngineCore: Shared.DuelEngineService {
        sharedCore.duelEngineService
    }
#endif

#if canImport(Shared)
    private func bindSharedFlows() {
        let sessionFlow = FlowPublisher(flow: sharedCore.quizSessionService.currentSession) { value in
            value as? Shared.QuizSessionState
        }
        self.sharedSessionFlow = sessionFlow
        sessionFlow.publisher
            .receive(on: RunLoop.main)
            .sink { [weak self] sharedSession in
                guard let self else { return }
                let mapped = self.mapSharedSession(sharedSession)
                self.localStore.saveActiveQuizSession(mapped)
            }
            .store(in: &cancellables)

        let studyStatesFlow = FlowPublisher(flow: sharedCore.studyPlannerService.questionStudyStates) { [weak self] value in
            self?.sharedStudyStateMap(from: value) ?? [:]
        }
        self.sharedStudyStatesFlow = studyStatesFlow
        studyStatesFlow.publisher
            .receive(on: RunLoop.main)
            .sink { [weak self] sharedStates in
                self?.mergeSharedStudyStates(sharedStates)
            }
            .store(in: &cancellables)
    }

    private func mapSharedSession(_ sharedSession: Shared.QuizSessionState?) -> QuizSessionState? {
        guard let sharedSession else {
            sharedSessionID = nil
            sharedSessionStartedAt = nil
            sharedSessionSignature = nil
            return nil
        }

        let signature = sessionSignature(for: sharedSession)
        if sharedSessionSignature != signature {
            sharedSessionSignature = signature
            sharedSessionID = UUID()
            sharedSessionStartedAt = Date()
        }

        let references = sharedSession.questions.map {
            QuizSessionQuestionReference(moduleID: $0.module.id, questionID: $0.question.id)
        }
        let selections = swiftStringMap(from: sharedSession.answers)
        let existing = localStore.activeQuizSession()

        return QuizSessionState(
            id: sharedSessionID ?? existing?.id ?? UUID(),
            startedAt: existing?.startedAt ?? sharedSessionStartedAt ?? Date(),
            lastUpdatedAt: Date(),
            currentIndex: Int(sharedSession.currentQuestionIndex),
            questionReferences: references,
            selections: selections,
            elapsedSeconds: existing?.elapsedSeconds ?? 0,
            perQuestionSeconds: existing?.perQuestionSeconds ?? [:],
            configuration: existing?.configuration ?? .default
        )
    }

    private func mergeSharedStudyStates(_ sharedStates: [String: Shared.QuestionStudyState]) {
        guard !sharedStates.isEmpty else { return }
        var merged = localStore.allStudyStates()
        for (questionID, sharedState) in sharedStates {
            merged[questionID] = mergedStudyState(existing: merged[questionID], shared: sharedState)
        }
        localStore.updateStudyStates(merged)
    }

    private func mergedStudyState(existing: QuestionStudyState?, shared: Shared.QuestionStudyState) -> QuestionStudyState {
        var state = existing ?? QuestionStudyState()
        let timesAnswered = Int(shared.timesAnswered)
        let timesCorrect = Int(shared.timesCorrect)
        state.reviewCount = max(state.reviewCount, timesAnswered)
        state.correctCount = max(state.correctCount, timesCorrect)

        if state.lastReviewedAt == nil {
            state.lastReviewedAt = dateFromSharedMillis(shared.lastAnsweredAt)
        }
        if state.dueDate == nil, let lastReviewedAt = state.lastReviewedAt {
            state.dueDate = lastReviewedAt
        }
        return state
    }

    private func sessionSignature(for session: Shared.QuizSessionState) -> String {
        session.questions
            .map { "\($0.module.id):\($0.question.id)" }
            .joined(separator: "|")
    }

    private func sharedStudyStateMap(from value: Any?) -> [String: Shared.QuestionStudyState] {
        if let typed = value as? [String: Shared.QuestionStudyState] {
            return typed
        }
        guard let dictionary = value as? NSDictionary else { return [:] }
        var result: [String: Shared.QuestionStudyState] = [:]
        for (key, raw) in dictionary {
            guard let key = key as? String, let raw = raw as? Shared.QuestionStudyState else { continue }
            result[key] = raw
        }
        return result
    }

    private func swiftStringMap(from value: Any?) -> [String: String] {
        if let typed = value as? [String: String] {
            return typed
        }
        guard let dictionary = value as? NSDictionary else { return [:] }
        var result: [String: String] = [:]
        for (key, raw) in dictionary {
            guard let key = key as? String, let raw = raw as? String else { continue }
            result[key] = raw
        }
        return result
    }

    private func dateFromSharedMillis(_ millis: KotlinLong?) -> Date? {
        guard let millis else { return nil }
        let value = millis.int64Value
        guard value > 0 else { return nil }
        return Date(timeIntervalSince1970: TimeInterval(value) / 1000)
    }
#endif

    func incorrectQuestionCount() -> Int {
        let sessions = localStore.completedQuizSessions()
        var seen = Set<String>()
        var count = 0
        for session in sessions {
            for reference in session.questionReferences {
                guard let sessionQuestion = questionBankService.sessionQuestion(for: reference) else { continue }
                let questionID = sessionQuestion.question.id
                if session.selections[questionID] != sessionQuestion.question.correctOptionId,
                   seen.insert(questionID).inserted {
                    count += 1
                }
            }
        }
        return count
    }

    func hasIncorrectQuestions() -> Bool {
        incorrectQuestionCount() > 0
    }


    func answeredQuestionIDs() -> Set<String> {
        localStore.answeredQuestionIDs()
    }

    func studyState(for questionID: String) -> QuestionStudyState? {
        localStore.studyState(for: questionID)
    }

    func updateStudyState(_ state: QuestionStudyState, for questionID: String) {
        localStore.updateStudyState(state, for: questionID)
    }

    func reviewQueue(limit: Int) -> [QuizSessionQuestion] {
        studyPlanner.reviewQueue(limit: limit)
    }

    func adaptiveDrillQuestions(limit: Int) -> [QuizSessionQuestion] {
        studyPlanner.adaptiveDrill(limit: limit)
    }

    func leaderboardSnapshot() -> LeaderboardSnapshot? {
        leaderboardService.refreshSnapshot(questionBank: questionBankService, sessions: completedQuizSessions)
    }

    func leaderboardOptIn() -> Bool {
        leaderboardService.isOptedIn
    }

    func setLeaderboardOptIn(_ value: Bool) {
        leaderboardService.setOptIn(value)
    }

    func leaderboardAlias() -> String {
        leaderboardService.participantAlias
    }

    func setLeaderboardAlias(_ alias: String) {
        leaderboardService.setAlias(alias)
    }

    func resetPracticeProgress() {
        localStore.resetProgress()
    }

    func markModuleDownloaded(_ id: String) {
        localStore.markModuleDownloaded(id)
    }

    func removeDownloadedModule(_ id: String) {
        localStore.removeDownload(for: id)
    }

    func isModuleDownloaded(_ id: String) -> Bool {
        localStore.isModuleDownloaded(id)
    }
}

```

---
### `iosApp/iprep/Features/Landing/LandingView.swift`
- Size: `12562` bytes
```
import SwiftUI
import Shared

struct LandingView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    let onStartPractice: () -> Void
    let onContinueSession: () -> Void
    let onShowProgress: () -> Void
    let onShowDashboard: () -> Void
    let onSelectModule: (Module) -> Void
    let onRetryIncorrect: () -> Void
    let onExploreQuestions: () -> Void
    let onShowCrosswords: () -> Void
    let onShowLeaderboard: () -> Void
    let onShowDuel: () -> Void

    @State private var showModulePicker = false
    @State private var showNoIncorrectAlert = false

    private var hasActiveSession: Bool {
        environment.activeQuizSession != nil
    }

    private var canRetryIncorrect: Bool {
        environment.hasIncorrectQuestions()
    }

    private var isRegularWidth: Bool {
        horizontalSizeClass == .regular
    }

    private var latestSession: CompletedQuizSession? {
        environment.completedQuizSessions.first
    }

    var body: some View {
        GeometryReader { _ in
            ZStack {
                LandingBackground()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: isRegularWidth ? 32 : 24) {
                        Spacer(minLength: isRegularWidth ? 60 : 40)
                        content
                            .padding(.horizontal, isRegularWidth ? 0 : 24)
                        Spacer(minLength: isRegularWidth ? 40 : 20)
                        footer
                            .padding(.bottom, 40)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .ignoresSafeArea()
        }
        .sheet(isPresented: $showModulePicker) {
            ModulePickerView(
                modules: environment.questionBankService.moduleSummaries(),
                onSelect: { module in
                    showModulePicker = false
                    onSelectModule(module)
                },
                onCancel: { showModulePicker = false }
            )
        }
        .alert("No incorrect answers yet", isPresented: $showNoIncorrectAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Complete a quiz first so we can track which questions to retry.")
        }
    }

    private var content: some View {
        Group {
            if isRegularWidth, let session = latestSession {
                HStack(alignment: .center, spacing: 36) {
                    landingCard
                        .frame(maxWidth: 480)
                    LandingProgressSummary(session: session)
                        .frame(maxWidth: 320)
                        .onTapGesture { onShowProgress() }
                }
            } else {
                landingCard
                    .frame(maxWidth: 420)
            }
        }
    }

    private var landingCard: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text("AABIP-IPREP")
                    .font(.system(size: isRegularWidth ? 42 : 36, weight: .bold, design: .rounded))
                    .foregroundStyle(Color.white.opacity(0.95))
                Text("Interventional Pulmonary Exam Prep")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(Color.white.opacity(0.9))
                    .multilineTextAlignment(.center)
            }

            Image("AABIPLogo", bundle: .module)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.1), radius: 10, y: 6)

            VStack(spacing: 14) {
                Button(action: onStartPractice) {
                    Text("Start Practice")
                }
                .buttonStyle(LandingButtonStyle(variant: .primary))

                Button(action: onContinueSession) {
                    Text("Continue Last Session")
                }
                .buttonStyle(LandingButtonStyle(variant: .secondary))
                .disabled(!hasActiveSession)
                .opacity(hasActiveSession ? 1 : 0.6)

                Button(action: onShowDashboard) {
                    Text("Dashboard")
                }
                .buttonStyle(LandingButtonStyle(variant: .secondary))

                Button {
                    showModulePicker = true
                } label: {
                    Text("Study by Category")
                }
                .buttonStyle(LandingButtonStyle(variant: .secondary))

                Button(action: onExploreQuestions) {
                    Text("Question Explorer")
                }
                .buttonStyle(LandingButtonStyle(variant: .secondary))

                Button(action: onShowCrosswords) {
                    Text("Crossword Puzzles")
                }
                .buttonStyle(LandingButtonStyle(variant: .secondary))

                Button(action: onShowLeaderboard) {
                    Text("Leaderboards")
                }
                .buttonStyle(LandingButtonStyle(variant: .secondary))

                Button(action: onShowDuel) {
                    Text("Clinical Duel")
                }
                .buttonStyle(LandingButtonStyle(variant: .secondary))

                Button {
                    if canRetryIncorrect {
                        onRetryIncorrect()
                    } else {
                        showNoIncorrectAlert = true
                    }
                } label: {
                    Text("Retry Incorrect Questions")
                }
                .buttonStyle(LandingButtonStyle(variant: .secondary))
                .opacity(canRetryIncorrect ? 1 : 0.6)

                Button(action: onShowProgress) {
                    Text("My Progress")
                }
                .buttonStyle(LandingButtonStyle(variant: .secondary))
            }
        }
        .padding(.vertical, isRegularWidth ? 24 : 12)
        .background(
            RoundedRectangle(cornerRadius: isRegularWidth ? 36 : 28, style: .continuous)
                .fill(Color.white.opacity(isRegularWidth ? 0.08 : 0.12))
                .shadow(color: Color.black.opacity(0.12), radius: isRegularWidth ? 28 : 18, y: 24)
        )
        .overlay(
            RoundedRectangle(cornerRadius: isRegularWidth ? 36 : 28, style: .continuous)
                .stroke(Color.white.opacity(0.18), lineWidth: 1)
        )
    }

    private var footer: some View {
        VStack(spacing: 12) {
            if !isRegularWidth, let session = latestSession {
                LandingProgressSummary(session: session)
                    .onTapGesture { onShowProgress() }
            }
        }
    }
}

private struct LandingBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.76, green: 0.91, blue: 0.99),
                Color(red: 0.45, green: 0.69, blue: 0.91)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .overlay(HexagonPattern().opacity(0.16))
    }
}

private struct HexagonPattern: View {
    var body: some View {
        GeometryReader { proxy in
            Canvas { context, size in
                let step: CGFloat = 68
                let verticalStep = step * 0.75
                let rows = Int(ceil(size.height / verticalStep)) + 2
                let columns = Int(ceil(size.width / step)) + 3
                let hexPath = HexagonPattern.hexagonPath(radius: step / 2.4)

                for row in 0..<rows {
                    let y = CGFloat(row) * verticalStep
                    for column in 0..<columns {
                        let xOffset = CGFloat(column) * step + (row.isMultiple(of: 2) ? 0 : step / 2)
                        let transform = CGAffineTransform(translationX: xOffset, y: y)
                        let path = hexPath.applying(transform)
                        context.stroke(path, with: .color(Color.white.opacity(0.55)), lineWidth: 0.8)
                    }
                }
            }
        }
    }

    private static func hexagonPath(radius: CGFloat) -> Path {
        var path = Path()
        for side in 0..<6 {
            let angle = Double(side) * Double.pi / 3.0 + Double.pi / 6.0
            let point = CGPoint(
                x: radius * CGFloat(cos(angle)),
                y: radius * CGFloat(sin(angle))
            )
            if side == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.closeSubpath()
        return path
    }
}

private struct LandingButtonStyle: ButtonStyle {
    enum Variant { case primary, secondary }

    let variant: Variant

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Typography.bodyEmphasis())
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(background(for: configuration))
            .overlay(
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .stroke(borderColor, lineWidth: variant == .primary ? 1.2 : 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 26, style: .continuous))
            .shadow(color: shadowColor.opacity(configuration.isPressed ? 0.4 : 0.2), radius: 12, y: 10)
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
    }

    private var shadowColor: Color {
        switch variant {
        case .primary: return Color.blue.opacity(0.5)
        case .secondary: return Color.black.opacity(0.35)
        }
    }

    private var borderColor: Color {
        switch variant {
        case .primary: return Color.white.opacity(0.5)
        case .secondary: return Color.white.opacity(0.35)
        }
    }

    @ViewBuilder
    private func background(for configuration: Configuration) -> some View {
        let baseOpacity = configuration.isPressed ? 0.85 : 1.0
        switch variant {
        case .primary:
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.ipAccent.opacity(0.92 * baseOpacity),
                            Color.ipAccent.opacity(0.8 * baseOpacity)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        case .secondary:
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.32 * baseOpacity),
                            Color.white.opacity(0.24 * baseOpacity)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        }
    }
}

private struct LandingProgressSummary: View {
    let session: CompletedQuizSession

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()

    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Last Session")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(Color.white.opacity(0.8))
                Text(Self.dateFormatter.string(from: session.completedAt))
                    .font(.callout)
                    .foregroundStyle(Color.white.opacity(0.9))
                Text("Score: \(session.correctCount)/\(session.totalQuestions)")
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(Color.white.opacity(0.85))
            }
            Spacer()
            Image(systemName: "arrow.right.circle.fill")
                .font(.title)
                .foregroundStyle(Color.white.opacity(0.75))
        }
        .padding(18)
        .background(Color.white.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(color: Color.black.opacity(0.15), radius: 18, y: 12)
        .padding(.horizontal, 24)
    }
}

```

---
### `iosApp/iprep/Features/Analytics/AnalyticsView.swift`
- Size: `12963` bytes
```
import SwiftUI
import Charts
import Shared

struct AnalyticsView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    private var sessions: [CompletedQuizSession] { environment.completedQuizSessions }
    private var hasHistory: Bool { !sessions.isEmpty }
    private var isRegularWidth: Bool { horizontalSizeClass == .regular }

    var body: some View {
        Group {
            if hasHistory {
                ScrollView {
                    VStack(spacing: 24) {
                        summaryGrid
                        reportCTA
                        trendSection
                        modulePerformanceSection
                    }
                    .padding(20)
                }
            } else {
                emptyState
            }
        }
        .background(Color.ipBackground.ignoresSafeArea())
        .navigationTitle("Analytics")
    }

    private var summaryGrid: some View {
        let gridColumns = isRegularWidth ? [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())] : [GridItem(.flexible()), GridItem(.flexible())]
        return LazyVGrid(columns: gridColumns, spacing: 18) {
            SummaryCard(
                title: "Quizzes Completed",
                value: "\(sessions.count)",
                detail: "Across \(totalQuestions) questions"
            )
            SummaryCard(
                title: "Average Score",
                value: "\(formattedPercent(averageAccuracy))",
                detail: "Best \(formattedPercent(bestAccuracy))"
            )
            SummaryCard(
                title: "Practice Time",
                value: formattedDuration(totalDuration),
                detail: "Avg \(formattedDuration(averageDuration)) each"
            )
            SummaryCard(
                title: "Current Streak",
                value: "\(currentStreak) days",
                detail: "Longest \(longestStreak)"
            )
        }
    }


    private var reportCTA: some View {
        NavigationLink {
            ProgressReportView()
        } label: {
            HStack(spacing: 16) {
                Image(systemName: "doc.text.magnifyingglass")
                    .font(.system(size: 30))
                    .foregroundStyle(Color.ipAccent)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Generate Progress Report")
                        .font(Typography.heading(size: .title3))
                        .foregroundStyle(Color.primary)
                    Text("Create a shareable summary for your program director.")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.secondary)
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.ipSurface)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(color: Color.black.opacity(0.05), radius: 12, y: 8)
        }
        .buttonStyle(.plain)
    }

    private var trendSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Accuracy Trend")
                    .font(Typography.heading(size: .title3))
                Spacer()
                if let latest = sessions.first {
                    Text("Latest: \(formattedPercent(latest.accuracy))")
                        .font(.caption)
                        .foregroundStyle(Color.secondary)
                }
            }
            Chart(trendPoints) { point in
                LineMark(
                    x: .value("Date", point.date),
                    y: .value("Accuracy", point.accuracy)
                )
                .foregroundStyle(Color.ipAccent)
                PointMark(
                    x: .value("Date", point.date),
                    y: .value("Accuracy", point.accuracy)
                )
                .symbolSize(40)
                .foregroundStyle(Color.ipAccent)
            }
            .chartYScale(domain: 0.4...1.05)
            .frame(height: 220)
            .chartXAxis {
                AxisMarks(values: .automatic(desiredCount: isRegularWidth ? 6 : 4)) { _ in
                    AxisValueLabel()
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading) { value in
                    if let doubleValue = value.as(Double.self) {
                        AxisValueLabel("\(Int(doubleValue * 100))%")
                    }
                }
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }

    private var modulePerformanceSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Module Insights")
                .font(Typography.heading(size: .title3))
            if modulePerformances.isEmpty {
                Text("Answer more questions to unlock module insights.")
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            } else {
                ForEach(modulePerformances) { performance in
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(performance.module.title)
                                .font(.headline)
                            Spacer()
                            Text(formattedPercent(performance.accuracy))
                                .font(.subheadline.weight(.semibold))
                                .foregroundStyle(performance.accuracy >= 0.75 ? Color.green : Color.orange)
                        }
                        ProgressView(value: Double(performance.correct), total: Double(performance.total))
                            .progressViewStyle(.linear)
                            .tint(Color.ipAccent)
                        Text("\(performance.correct)/\(performance.total) correct • \(performance.sessionCount) sessions")
                            .font(.caption)
                            .foregroundStyle(Color.secondary)
                    }
                    .padding(16)
                    .background(Color.ipSurface)
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                }
            }
        }
    }

    private var emptyState: some View {
        VStack(spacing: 18) {
            Image(systemName: "chart.bar")
                .font(.system(size: 56))
                .foregroundStyle(Color.secondary)
            Text("Analytics coming to life")
                .font(Typography.heading(size: .title2))
            Text("Complete at least one practice session to view trends, streaks, and module insights.")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.secondary)
                .padding(.horizontal, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    // MARK: - Metrics

    private var totalQuestions: Int {
        sessions.reduce(into: 0) { $0 += $1.totalQuestions }
    }

    private var averageAccuracy: Double {
        guard !sessions.isEmpty else { return 0 }
        let total = sessions.reduce(0.0) { $0 + $1.accuracy }
        return total / Double(sessions.count)
    }

    private var bestAccuracy: Double {
        sessions.map(\.accuracy).max() ?? 0
    }

    private var totalDuration: TimeInterval {
        sessions.reduce(0) { $0 + $1.duration }
    }

    private var averageDuration: TimeInterval {
        guard !sessions.isEmpty else { return 0 }
        return totalDuration / Double(sessions.count)
    }

    private var currentStreak: Int {
        guard !sessions.isEmpty else { return 0 }
        let sorted = sessions.sorted { $0.completedAt > $1.completedAt }
        var streak = 0
        var previousDay: Date?
        let calendar = Calendar.current
        for session in sorted {
            let day = calendar.startOfDay(for: session.completedAt)
            if let previousDay {
                let difference = calendar.dateComponents([.day], from: day, to: previousDay).day ?? 0
                if difference == 0 {
                    continue
                } else if difference == 1 {
                    streak += 1
                } else {
                    break
                }
            } else {
                streak = 1
            }
            previousDay = day
        }
        return streak
    }

    private var longestStreak: Int {
        guard !sessions.isEmpty else { return 0 }
        let sorted = sessions.sorted { $0.completedAt < $1.completedAt }
        let calendar = Calendar.current
        var longest = 1
        var streak = 1
        for index in 1..<sorted.count {
            let current = calendar.startOfDay(for: sorted[index].completedAt)
            let previous = calendar.startOfDay(for: sorted[index - 1].completedAt)
            let diff = calendar.dateComponents([.day], from: previous, to: current).day ?? 0
            if diff == 0 {
                continue
            } else if diff == 1 {
                streak += 1
                longest = max(longest, streak)
            } else {
                streak = 1
            }
        }
        return longest
    }

    private var trendPoints: [AccuracyPoint] {
        sessions
            .sorted { $0.completedAt < $1.completedAt }
            .map { AccuracyPoint(date: $0.completedAt, accuracy: $0.accuracy) }
    }

    private var modulePerformances: [ModulePerformance] {
        var stats: [String: ModulePerformance] = [:]
        for session in sessions {
            let questions = environment.questionBankService.sessionQuestions(from: session.questionReferences)
            var seenModules: Set<String> = []
            for question in questions {
                let module = question.module.summary
                var entry = stats[module.id] ?? ModulePerformance(module: module, correct: 0, total: 0, sessionCount: 0)
                entry.total += 1
                if session.selections[question.id] == question.question.correctOptionId {
                    entry.correct += 1
                }
                if seenModules.insert(module.id).inserted {
                    entry.sessionCount += 1
                }
                stats[module.id] = entry
            }
        }
        return stats.values.sorted { lhs, rhs in
            lhs.accuracy == rhs.accuracy ? lhs.module.title < rhs.module.title : lhs.accuracy > rhs.accuracy
        }
    }

    private func formattedPercent(_ value: Double) -> String {
        NumberFormatter.percentFormatter.string(from: NSNumber(value: value)) ?? "0%"
    }

    private func formattedDuration(_ interval: TimeInterval) -> String {
        DateComponentsFormatter.practiceFormatter.string(from: interval) ?? "0s"
    }
}

private struct SummaryCard: View {
    let title: String
    let value: String
    let detail: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title.uppercased())
                .font(.caption.weight(.semibold))
                .foregroundStyle(Color.secondary)
            Text(value)
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundStyle(Color.primary)
            Text(detail)
                .font(.footnote)
                .foregroundStyle(Color.secondary)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

private struct AccuracyPoint: Identifiable {
    let id = UUID()
    let date: Date
    let accuracy: Double
}

private struct ModulePerformance: Identifiable {
    let module: Module
    var correct: Int
    var total: Int
    var sessionCount: Int

    var id: String { module.id }

    var accuracy: Double {
        guard total > 0 else { return 0 }
        return Double(correct) / Double(total)
    }
}

private extension NumberFormatter {
    static let percentFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 0
        return formatter
    }()
}

private extension DateComponentsFormatter {
    static let practiceFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()
}

```

---
### `iosApp/iprep/Features/Review/ReviewView.swift`
- Size: `13004` bytes
```
import SwiftUI
import Shared

struct ReviewView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State private var selectedSessionID: CompletedQuizSession.ID?

    private var sessions: [CompletedQuizSession] {
        environment.completedQuizSessions
    }

    private var hasHistory: Bool {
        !sessions.isEmpty
    }

    private var isRegularWidth: Bool {
        horizontalSizeClass == .regular
    }

    private var selectedSession: CompletedQuizSession? {
        guard let id = selectedSessionID else { return nil }
        return session(with: id)
    }

    private func session(with id: CompletedQuizSession.ID) -> CompletedQuizSession? {
        sessions.first(where: { $0.id == id })
    }

    var body: some View {
        Group {
            if hasHistory {
                if isRegularWidth {
                    regularLayout
                } else {
                    stackList
                }
            } else {
                emptyState
            }
        }
        .navigationTitle("Review")
        .background(Color.ipBackground.ignoresSafeArea())
    }

    private var stackList: some View {
        List(sessions, id: \.id) { session in
            NavigationLink {
                SessionReviewDetailView(session: session)
            } label: {
                ReviewSessionRow(session: session)
            }
        }
#if os(iOS)
        .listStyle(.insetGrouped)
#endif
    }

    private var regularLayout: some View {
        HStack(spacing: 0) {
            List(sessions, id: \.id, selection: $selectedSessionID) { session in
                ReviewSessionRow(session: session)
                    .tag(session.id)
            }
#if os(iOS)
            .listStyle(.insetGrouped)
#else
            .listStyle(.sidebar)
#endif
            .frame(minWidth: 280, idealWidth: 320, maxWidth: 360)

            Divider()

            Group {
                if let session = selectedSession {
                    SessionReviewDetailView(session: session)
                } else if let firstSession = sessions.first {
                    SessionReviewDetailView(session: firstSession)
                } else {
                    Text("Select a session to review details")
                        .font(.body)
                        .foregroundStyle(Color.secondary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.ipBackground.ignoresSafeArea())
        .onAppear {
            if selectedSessionID == nil && !sessions.isEmpty {
                selectedSessionID = sessions.first?.id
            }
        }
        .onChange(of: sessions) { _, newSessions in
            guard let currentID = selectedSessionID else {
                if !newSessions.isEmpty {
                    selectedSessionID = newSessions.first?.id
                }
                return
            }
            let stillExists = newSessions.contains { $0.id == currentID }
            if !stillExists && !newSessions.isEmpty {
                selectedSessionID = newSessions.first?.id
            }
        }
    }

    private var emptyState: some View {
        VStack(spacing: 18) {
            Image(systemName: "text.book.closed")
                .font(.system(size: 56))
                .foregroundStyle(Color.secondary)
            Text("Review workspace")
                .font(Typography.heading(size: .title2))
            Text("Complete a practice session to unlock detailed answer explanations and reference notes here.")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.secondary)
                .padding(.horizontal, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private struct ReviewSessionRow: View {
    let session: CompletedQuizSession

    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()

    static let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(Self.dateFormatter.string(from: session.completedAt))
                    .font(.headline)
                Spacer()
                Text("\(session.correctCount)/\(session.totalQuestions) correct")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(session.accuracy >= 0.7 ? Color.green : Color.orange)
            }
            Text(summaryLine)
                .font(.footnote)
                .foregroundStyle(Color.secondary)
        }
        .padding(.vertical, 4)
    }

    private var summaryLine: String {
        let duration = Self.durationFormatter.string(from: session.duration) ?? "—"
        let percent = Int((session.accuracy * 100).rounded())
        return "Score: \(percent)% • Time: \(duration)"
    }
}

private struct SessionReviewDetailView: View {
    let session: CompletedQuizSession
    @EnvironmentObject private var environment: AppEnvironment

    private var questions: [QuizSessionQuestion] {
        environment.questionBankService.sessionQuestions(from: session.questionReferences)
    }

    private var moduleBreakdown: [ModuleBreakdownItem] {
        let grouped = Dictionary(grouping: questions) { $0.module.id }
        return grouped.compactMap { key, questions in
            guard let module = questions.first?.module else { return nil }
            let correct = questions.reduce(into: 0) { partial, question in
                if session.selections[question.id] == question.question.correctOptionId {
                    partial += 1
                }
            }
            return ModuleBreakdownItem(module: module, correct: correct, total: questions.count)
        }.sorted { $0.module.summary.title < $1.module.summary.title }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                header
                if !moduleBreakdown.isEmpty {
                    breakdownSection
                }
                ForEach(questions) { question in
                    ReviewQuestionCard(question: question, selection: session.selections[question.id])
                }
            }
            .padding(20)
        }
        .background(Color.ipBackground.ignoresSafeArea())
        .navigationTitle("Session Review")
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Completed on \(ReviewSessionRow.dateFormatter.string(from: session.completedAt))")
                .font(.caption)
                .foregroundStyle(Color.secondary)
            HStack(alignment: .lastTextBaseline, spacing: 12) {
                Text("\(session.correctCount)")
                    .font(.system(size: 48, weight: .bold))
                Text("out of \(session.totalQuestions) correct")
                    .font(.title3.weight(.semibold))
            }
            Text(summaryMetrics)
                .font(.subheadline)
                .foregroundStyle(Color.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }

    private var summaryMetrics: String {
        let percent = Int((session.accuracy * 100).rounded())
        let duration = ReviewSessionRow.durationFormatter.string(from: session.duration) ?? "—"
        return "Score: \(percent)% • Time: \(duration)"
    }

    private var breakdownSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Module Breakdown")
                .font(.headline)
            ForEach(moduleBreakdown, id: \.module.id) { item in
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.module.summary.title)
                            .font(.body.weight(.semibold))
                        Text("\(item.correct)/\(item.total) correct")
                            .font(.caption)
                            .foregroundStyle(Color.secondary)
                    }
                    Spacer()
                    ProgressView(value: Double(item.correct), total: Double(item.total))
                        .progressViewStyle(.linear)
                        .frame(width: 120)
                        .tint(Color.ipAccent)
                }
            }
        }
        .padding(20)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

private struct ReviewQuestionCard: View {
    let question: QuizSessionQuestion
    let selection: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text(question.module.summary.title)
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
                Text(question.question.prompt)
                    .font(.headline)
            }
            VStack(alignment: .leading, spacing: 10) {
                ForEach(question.question.options) { option in
                    optionRow(for: option)
                }
            }
            if let explanation = explanationText {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Explanation")
                        .font(.subheadline.weight(.semibold))
                    Text(explanation)
                        .font(.body)
                    if !question.question.references.isEmpty {
                        Divider()
                        VStack(alignment: .leading, spacing: 4) {
                            Text("References")
                                .font(.subheadline.weight(.semibold))
                            ForEach(question.question.references, id: \.self) { reference in
                                Text(reference)
                                    .font(.footnote)
                                    .foregroundStyle(Color.secondary)
                            }
                        }
                    }
                }
                .foregroundStyle(Color.primary)
            }
        }
        .padding(20)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }

    private var explanationText: String? {
        selection == nil ? nil : question.question.explanation
    }

    private func optionRow(for option: QuizOption) -> some View {
        let isCorrect = option.id == question.question.correctOptionId
        let isSelected = selection == option.id
        return HStack(alignment: .top, spacing: 12) {
            Text(option.id.uppercased())
                .font(.headline)
                .frame(width: 28, height: 28)
                .background(Circle().fill(Color.ipSurfaceElevated))
            VStack(alignment: .leading, spacing: 4) {
                Text(option.text)
                    .font(.body)
                    .foregroundStyle(Color.primary)
                if isSelected {
                    Text(isCorrect ? "You selected • Correct" : "You selected • Incorrect")
                        .font(.caption)
                        .foregroundStyle(isCorrect ? Color.green : Color.red)
                }
            }
            Spacer()
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(optionBackground(isCorrect: isCorrect, isSelected: isSelected))
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(optionBorder(isCorrect: isCorrect, isSelected: isSelected), lineWidth: 1.5)
        )
    }

    private func optionBackground(isCorrect: Bool, isSelected: Bool) -> Color {
        if isCorrect { return Color.green.opacity(0.16) }
        if isSelected { return Color.red.opacity(0.14) }
        return Color.ipSurfaceElevated.opacity(0.4)
    }

    private func optionBorder(isCorrect: Bool, isSelected: Bool) -> Color {
        if isCorrect { return Color.green }
        if isSelected { return Color.red }
        return Color.clear
    }
}

private struct ModuleBreakdownItem: Identifiable {
    let module: QuizModule
    let correct: Int
    let total: Int

    var id: String { module.id }
}

```
