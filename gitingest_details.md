# AABIP_Qbank — gitingest (details)

Generated: `2026-01-26T14:04:29-08:00`
Git: `multiplatform` @ `6039302`

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
      198  shared/src/commonMain/kotlin/qbank/bridge/Greeter.kt
      569  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/FeatureFlag.kt
      610  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/AppRoute.kt
      876  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/AppEnvironment.kt
      925  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/QuizQuestion.kt
     1279  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/QuestionStudyState.kt
     1534  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/Module.kt
     1626  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/models/QuizSession.kt
     4229  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/FeatureFlagsService.kt
     4520  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/StudyPlannerService.kt
     5074  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/QuizSessionService.kt
     6200  shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/QuestionBankService.kt
       68  androidApp/src/main/res/values/strings.xml
      143  androidApp/src/main/res/xml/backup_rules.xml
      288  androidApp/src/main/java/com/russellmiller/iprep/ui/theme/Color.kt
      382  androidApp/src/main/res/xml/data_extraction_rules.xml
      424  androidApp/src/main/res/values/themes.xml
      806  androidApp/src/main/AndroidManifest.xml
      993  androidApp/src/main/java/com/russellmiller/iprep/ui/theme/Type.kt
     1026  androidApp/src/main/java/com/russellmiller/iprep/MainActivity.kt
     1135  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/SettingsScreen.kt
     1138  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/AnalyticsScreen.kt
     1144  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/LeaderboardScreen.kt
     2025  androidApp/src/main/java/com/russellmiller/iprep/ui/navigation/AppNavigation.kt
     2191  androidApp/src/main/java/com/russellmiller/iprep/ui/theme/Theme.kt
     3049  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/ReviewScreen.kt
     4234  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/DashboardScreen.kt
     5430  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/LandingScreen.kt
     6713  androidApp/src/main/java/com/russellmiller/iprep/ui/screens/QuizScreen.kt
       50  iosApp/iprep/Persistence/PersistencePlaceholder.swift
       63  iosApp/iprep/Assets.xcassets/Contents.json
       80  iosApp/iprep/Services/QuestionStudyState 2.swift
      123  iosApp/iprep/Assets.xcassets/AccentColor.colorset/Contents.json
      232  iosApp/iprep/Models/FeatureFlagKey.swift
      232  iosApp/iprep/Support/Bundle+Module.swift
      307  iosApp/iprep/Assets.xcassets/AABIPLogo.imageset/Contents.json
      330  iosApp/iprep/iprepApp.swift
      357  iosApp/iprep/Models/AppRoute.swift
      370  iosApp/iprep/Components/Typography.swift
      414  iosApp/iprep/Components/Color+Theme.swift
      476  iosApp/iprep/Resources/RemoteConfigDefaults.plist
      586  iosApp/iprep/Services/SyncManager.swift
      695  iosApp/iprep/Assets.xcassets/Accent.colorset/Contents.json
      695  iosApp/iprep/Assets.xcassets/Background.colorset/Contents.json
      695  iosApp/iprep/Assets.xcassets/MutedAccent.colorset/Contents.json
      695  iosApp/iprep/Assets.xcassets/Surface.colorset/Contents.json
      695  iosApp/iprep/Assets.xcassets/SurfaceElevated.colorset/Contents.json
      792  iosApp/iprep/Services/StorageService.swift
      806  iosApp/iprep/Models/QuizQuestion.swift
      809  iosApp/iprep/Models/QuizSessionConfiguration.swift
      849  iosApp/iprep/Services/AuthService.swift
      955  iosApp/iprepTests/QuizViewModelTests.swift
     1088  iosApp/iprep/Features/Landing/ModulePickerView.swift
     1123  iosApp/iprepTests/ServicesTests.swift
     1137  iosApp/iprepTests/ReviewViewCrashTests.swift
     1183  iosApp/iprepTests/iprepTests.swift
     1276  iosApp/iprepUITests/iprepUITests.swift
     1298  iosApp/iprep/Services/FeatureFlags.swift
     1396  iosApp/iprep/Features/Settings/SettingsView.swift
     1494  iosApp/iprep/Services/FirestoreService.swift
     1506  iosApp/iprepTests/ReviewViewCrashFixTests.swift
     1606  iosApp/iprepUITests/DashboardUITests.swift
     1697  iosApp/iprep/Info.plist
     1730  iosApp/iprepTests/ModelsTests.swift
     1758  iosApp/iprep/Models/Module.swift
     1901  iosApp/iprep/Services/MediaCache.swift
     2006  iosApp/iprep/Components/ModuleCard.swift
     2040  iosApp/iprep/Models/QuizQuestion+Search.swift
     2246  iosApp/iprep/Assets.xcassets/AppIcon.appiconset/Contents.json
     2584  iosApp/iprep/Services/RemoteConfigService.swift
     3297  iosApp/iprep/ContentView.swift
     3626  iosApp/iprep/Models/QuestionStudyState.swift
     3994  iosApp/iprep/Services/LeaderboardService.swift
     4195  iosApp/iprep/Services/QuestionStudyState.swift
     5117  iosApp/iprep/Services/StudyPlanner.swift
     5220  iosApp/iprep/Features/Leaderboard/LeaderboardView.swift
     5263  iosApp/iprep/Models/QuizSessionState.swift
     5647  iosApp/iprep/AppEnvironment.swift
     7230  iosApp/iprep/Services/LocalStore.swift
     9404  iosApp/iprep/Features/Dashboard/DashboardView.swift
     9509  iosApp/iprep/Services/QuestionBankService.swift
    12118  iosApp/iprep/Features/Landing/LandingView.swift
    12157  iosApp/iprep/Features/Analytics/ProgressReportView.swift
    12949  iosApp/iprep/Features/Analytics/AnalyticsView.swift
    12990  iosApp/iprep/Features/Review/ReviewView.swift
    14588  iosApp/iprep/Features/Search/QuestionExplorerView.swift
    17426  iosApp/iprep/Features/Quiz/QuizViewModel.swift
    37873  iosApp/iprep/Features/Quiz/QuizView.swift
    11186  docs/ARCHITECTURE.md
```

## Skipped (reason)

```
     too_large>200000B  shared/src/commonMain/resources/QuestionBank.json
     too_large>200000B  iosApp/iprep/Resources/QuestionBank.json
```

## Inlined file contents

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
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/AppEnvironment.kt`
- Size: `876` bytes
```
package com.russellmiller.iprep.shared

import com.russellmiller.iprep.shared.services.*

class AppEnvironment {
    val questionBankService: QuestionBankService
    val featureFlagsService: FeatureFlagsService
    val studyPlannerService: StudyPlannerService
    val quizSessionService: QuizSessionService
    
    init {
        questionBankService = QuestionBankService()
        featureFlagsService = FeatureFlagsService()
        studyPlannerService = StudyPlannerService()
        quizSessionService = QuizSessionService(questionBankService, studyPlannerService)
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
### `shared/src/commonMain/kotlin/com/russellmiller/iprep/shared/services/QuestionBankService.kt`
- Size: `6200` bytes
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
            // Load from resources
            // For now, use placeholder data since resource loading is complex in KMP
            val jsonString = """
                {
                    "modules": []
                }
            """.trimIndent()
            
            val json = Json { ignoreUnknownKeys = true }
            val dto = json.decodeFromString<QuestionBankDTO>(jsonString)
            
            val quizModules = dto.modules.map { moduleDTO ->
                val difficulty = Module.Difficulty.values().find { it.value == moduleDTO.difficulty } ?: Module.Difficulty.MODERATE
                val summary = Module(
                    id = moduleDTO.id,
                    title = moduleDTO.title,
                    description = moduleDTO.description,
                    questionCount = moduleDTO.questions.size,
                    estimatedTimeMinutes = moduleDTO.estimatedTimeMinutes,
                    difficulty = difficulty
                )
                
                val questions = moduleDTO.questions.map { questionDTO ->
                    val options = questionDTO.options.map { optionDTO ->
                        QuizOption(
                            id = optionDTO.id.lowercase(),
                            text = optionDTO.text,
                            imageURL = null
                        )
                    }
                    
                    QuizQuestion(
                        id = questionDTO.id,
                        number = questionDTO.number,
                        prompt = questionDTO.prompt,
                        options = options,
                        correctOptionId = questionDTO.correctOptionId.lowercase(),
                        explanation = questionDTO.explanation,
                        references = questionDTO.references,
                        imageURLs = questionDTO.imageURLs,
                        explanationImageURLs = emptyList()
                    )
                }
                
                QuizModule(summary = summary, questions = questions)
            }
            
            Triple(quizModules, quizModules.associateBy { it.id }, quizModules.sumOf { it.questions.size })
        } catch (e: Exception) {
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
### `androidApp/src/main/java/com/russellmiller/iprep/MainActivity.kt`
- Size: `1026` bytes
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

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
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
### `androidApp/src/main/java/com/russellmiller/iprep/ui/navigation/AppNavigation.kt`
- Size: `2025` bytes
```
package com.russellmiller.iprep.ui.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import com.russellmiller.iprep.ui.screens.*

@Composable
fun AppNavigation(navController: NavHostController) {
    NavHost(
        navController = navController,
        startDestination = "landing"
    ) {
        composable("landing") {
            LandingScreen(
                onNavigateToQuiz = { navController.navigate("quiz") },
                onNavigateToDashboard = { navController.navigate("dashboard") },
                onNavigateToAnalytics = { navController.navigate("analytics") },
                onNavigateToLeaderboard = { navController.navigate("leaderboard") }
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
        
        composable("settings") {
            SettingsScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }
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
### `androidApp/src/main/java/com/russellmiller/iprep/ui/screens/LandingScreen.kt`
- Size: `5430` bytes
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
    onNavigateToLeaderboard: () -> Unit
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
### `iosApp/iprep/iprepApp.swift`
- Size: `330` bytes
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
    @StateObject private var environment = AppEnvironment.shared

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(environment)
        }
    }
}

```

---
### `iosApp/iprep/Models/AppRoute.swift`
- Size: `357` bytes
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
### `iosApp/iprep/Models/QuizQuestion.swift`
- Size: `806` bytes
```
import Foundation

struct QuizOption: Identifiable, Hashable {
    let id: String
    let text: String
    let imageURL: URL?
}

struct QuizQuestion: Identifiable, Hashable {
    let id: String
    let number: Int
    let prompt: String
    let options: [QuizOption]
    let correctOptionId: String
    let explanation: String
    let references: [String]
    let imageURLs: [URL]
    let explanationImageURLs: [URL]

    func option(withId id: String) -> QuizOption? {
        options.first { $0.id == id }
    }
}

struct QuizModule: Identifiable, Hashable {
    let summary: Module
    let questions: [QuizQuestion]

    var id: String { summary.id }
}

struct QuizSessionQuestion: Identifiable, Hashable {
    let module: QuizModule
    let question: QuizQuestion

    var id: String { question.id }
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
- Size: `1088` bytes
```
import SwiftUI

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
### `iosApp/iprep/Services/FirestoreService.swift`
- Size: `1494` bytes
```
import Foundation

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
        let estimatedMinutes = questionBank.moduleSummaries().reduce(0) { $0 + $1.estimatedTimeMinutes }
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
### `iosApp/iprep/Models/Module.swift`
- Size: `1758` bytes
```
import Foundation

public struct Module: Identifiable, Hashable {
    public let id: String
    public let title: String
    public let description: String
    public let questionCount: Int
    public let estimatedTimeMinutes: Int
    public let difficulty: Difficulty

    public init(
        id: String,
        title: String,
        description: String,
        questionCount: Int,
        estimatedTimeMinutes: Int,
        difficulty: Difficulty
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.questionCount = questionCount
        self.estimatedTimeMinutes = estimatedTimeMinutes
        self.difficulty = difficulty
    }

    public enum Difficulty: String, CaseIterable {
        case easy
        case moderate
        case hard
    }
}

public extension Module {
    static let placeholder: [Module] = [
        Module(
            id: "advanced-bronchoscopy",
            title: "Advanced Therapeutic Bronchoscopy",
            description: "Latest interventional techniques and peri-procedural care.",
            questionCount: 42,
            estimatedTimeMinutes: 35,
            difficulty: .hard
        ),
        Module(
            id: "airway-disease",
            title: "Airway Disease",
            description: "Diagnosis and management pathways for airway disorders.",
            questionCount: 38,
            estimatedTimeMinutes: 30,
            difficulty: .moderate
        ),
        Module(
            id: "pleural-disease",
            title: "Pleural Disease",
            description: "Evidence-based approaches to pleural pathology.",
            questionCount: 24,
            estimatedTimeMinutes: 20,
            difficulty: .moderate
        )
    ]
}

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
### `iosApp/iprep/Components/ModuleCard.swift`
- Size: `2006` bytes
```
import SwiftUI

struct ModuleCard: View {
    let module: Module
    let isDownloaded: Bool
    let onTapDownload: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(module.title)
                .font(Typography.heading())
                .foregroundStyle(Color.primary)

            Text(module.description)
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
- Size: `2040` bytes
```
import Foundation

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
            module.summary.description,
            module.summary.difficulty.rawValue
        ]

        return moduleFields.contains(where: { $0.containsInsensitive(query) })
    }
}

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
### `iosApp/iprep/ContentView.swift`
- Size: `3297` bytes
```
import SwiftUI

#if canImport(Shared)
import Shared
#endif

/// Entry point view that replicates the original IPREP navigation flow.
struct RootView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @State private var navigationPath: [AppRoute] = []

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
                onShowLeaderboard: {
                    navigationPath.append(.leaderboard)
                }
            )
            .environmentObject(environment)
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .dashboard:
                    DashboardView { destination in
                        navigationPath.append(destination)
                    }
                    .environmentObject(environment)
                case let .quiz(mode):
                    QuizView(mode: mode)
                        .environmentObject(environment)
                case .progressReport:
                    ProgressReportView()
                        .environmentObject(environment)
                case .review:
                    ReviewView()
                        .environmentObject(environment)
                case .analytics:
                    AnalyticsView()
                        .environmentObject(environment)
                case .settings:
                    SettingsView()
                        .environmentObject(environment)
                case .questionExplorer:
                    QuestionExplorerView()
                        .environmentObject(environment)
                case .leaderboard:
                    LeaderboardView()
                        .environmentObject(environment)
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
### `iosApp/iprep/Services/LeaderboardService.swift`
- Size: `3994` bytes
```
import Foundation

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
### `iosApp/iprep/Services/StudyPlanner.swift`
- Size: `5117` bytes
```
import Foundation

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
### `iosApp/iprep/Features/Leaderboard/LeaderboardView.swift`
- Size: `5220` bytes
```
import SwiftUI

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
### `iosApp/iprep/AppEnvironment.swift`
- Size: `5647` bytes
```
import Combine
import Foundation

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

    @Published public private(set) var downloadedModuleIDs: Set<String> = []
    @Published private(set) var activeQuizSession: QuizSessionState?
    @Published private(set) var completedQuizSessions: [CompletedQuizSession] = []
    @Published private(set) var studyStates: [String: QuestionStudyState] = [:]

    private init() {
        let authService = AuthService()
        let questionBankService = QuestionBankService()
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

        bindSyncTriggers()
        bindLocalStore()
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
    }

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
### `iosApp/iprep/Services/LocalStore.swift`
- Size: `7230` bytes
```
import Combine
import Foundation

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
- Size: `9404` bytes
```
import SwiftUI

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
                let estimatedMinutes = modules.reduce(0) { $0 + $1.estimatedTimeMinutes }
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
### `iosApp/iprep/Services/QuestionBankService.swift`
- Size: `9509` bytes
```
import Foundation
import OSLog

final class QuestionBankService {
    private struct QuestionBankDTO: Decodable {
        let modules: [ModuleDTO]
    }

    private struct ModuleDTO: Decodable {
        let id: String
        let title: String
        let description: String
        let estimatedTimeMinutes: Int
        let difficulty: String
        let questionCount: Int
        let questions: [QuestionDTO]
    }

    private struct QuestionDTO: Decodable {
        struct OptionDTO: Decodable {
            let id: String
            let text: String
        }

        let id: String
        let number: Int
        let prompt: String
        let options: [OptionDTO]
        let correctOptionId: String
        let explanation: String
        let references: [String]
        let imageURLs: [String]
    }

    private let modules: [QuizModule]
    private let modulesById: [String: QuizModule]
    let totalQuestionCount: Int
    private let logger: Logger

    init(
        bundle: Bundle = .module,
        logger: Logger = Logger(
            subsystem: (Bundle.main.bundleIdentifier ?? "com.russellmiller.iprep"),
            category: "QuestionBankService"
        )
    ) {
        self.logger = logger
        do {
            guard let url = bundle.url(forResource: "QuestionBank", withExtension: "json") else {
                throw NSError(
                    domain: "QuestionBankService",
                    code: 1,
                    userInfo: [NSLocalizedDescriptionKey: "QuestionBank.json missing from resources"]
                )
            }
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let dto = try decoder.decode(QuestionBankDTO.self, from: data)
            let quizModules = dto.modules.map { moduleDTO -> QuizModule in
                let difficulty = Module.Difficulty(rawValue: moduleDTO.difficulty) ?? .moderate
                let summary = Module(
                    id: moduleDTO.id,
                    title: moduleDTO.title,
                    description: moduleDTO.description,
                    questionCount: moduleDTO.questions.count,
                    estimatedTimeMinutes: moduleDTO.estimatedTimeMinutes,
                    difficulty: difficulty
                )
                let questions = moduleDTO.questions.map { questionDTO -> QuizQuestion in
                    var promptText = questionDTO.prompt
                    var options = questionDTO.options.map {
                        QuizOption(id: $0.id.lowercased(), text: $0.text, imageURL: nil)
                    }
                    if options.isEmpty, let parsed = QuestionBankService.parseEmbeddedOptions(from: promptText) {
                        promptText = parsed.prompt
                        options = parsed.options
                    }

                    var promptImages: [URL] = []
                    var explanationImages: [URL] = []
                    var optionImageMap: [String: URL] = [:]

                    for urlString in questionDTO.imageURLs {
                        guard let url = URL(string: urlString) else { continue }
                        let lower = urlString.lowercased()
                        if let optionId = QuestionBankService.optionIdentifier(from: lower) {
                            optionImageMap[optionId] = url
                        } else if lower.contains("diss") || lower.contains("discuss") || lower.contains("explanation") {
                            explanationImages.append(url)
                        } else {
                            promptImages.append(url)
                        }
                    }

                    let normalizedOptions = options.map { option -> QuizOption in
                        let optionId = option.id.lowercased()
                        return QuizOption(
                            id: optionId,
                            text: option.text,
                            imageURL: optionImageMap[optionId]
                        )
                    }

                    return QuizQuestion(
                        id: questionDTO.id,
                        number: questionDTO.number,
                        prompt: promptText,
                        options: normalizedOptions,
                        correctOptionId: questionDTO.correctOptionId.lowercased(),
                        explanation: questionDTO.explanation,
                        references: questionDTO.references,
                        imageURLs: promptImages,
                        explanationImageURLs: explanationImages
                    )
                }
                return QuizModule(summary: summary, questions: questions)
            }
            self.modules = quizModules
            self.modulesById = Dictionary(uniqueKeysWithValues: quizModules.map { ($0.id, $0) })
            self.totalQuestionCount = quizModules.reduce(0) { $0 + $1.questions.count }
        } catch {
            self.logger.error("Failed to load question bank: \(error.localizedDescription, privacy: .public)")
            self.modules = []
            self.modulesById = [:]
            self.totalQuestionCount = 0
        }
    }

    private static func parseEmbeddedOptions(from prompt: String) -> (prompt: String, options: [QuizOption])? {
        let pattern = #" ([a-zA-Z])\)"#
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else { return nil }
        let nsPrompt = prompt as NSString
        let matches = regex.matches(in: prompt, range: NSRange(location: 0, length: nsPrompt.length))
        guard !matches.isEmpty else { return nil }

        var parsedOptions: [QuizOption] = []
        for (index, match) in matches.enumerated() {
            let labelRange = match.range(at: 1)
            let label = nsPrompt.substring(with: labelRange).lowercased()
            let start = match.range.location + match.range.length
            let end: Int
            if index + 1 < matches.count {
                end = matches[index + 1].range.location
            } else {
                end = nsPrompt.length
            }
            let optionText = nsPrompt.substring(with: NSRange(location: start, length: end - start)).trimmingCharacters(in: .whitespacesAndNewlines)
            parsedOptions.append(QuizOption(id: label, text: optionText, imageURL: nil))
        }

        let questionText = nsPrompt.substring(to: matches[0].range.location).trimmingCharacters(in: .whitespacesAndNewlines)
        guard !parsedOptions.isEmpty, !questionText.isEmpty else { return nil }
        return (questionText, parsedOptions)
    }

    private static func optionIdentifier(from filename: String) -> String? {
        guard let range = filename.range(of: #"\(([a-z])\)"#, options: .regularExpression) else { return nil }
        let substring = filename[range]
        return substring.trimmingCharacters(in: CharacterSet(charactersIn: "() ")).lowercased()
    }

    func moduleSummaries() -> [Module] {
        modules.map { $0.summary }
    }

    func quizModule(for id: String) -> QuizModule? {
        modulesById[id]
    }

    func questions(forModule id: String) -> [QuizQuestion] {
        modulesById[id]?.questions ?? []
    }

    func quickStartQuestions(limit: Int = 10, excluding excludedIDs: Set<String> = []) -> [QuizSessionQuestion] {
        guard !modules.isEmpty else { return [] }
        let allQuestions: [QuizSessionQuestion] = modules.flatMap { module in
            module.questions.map { QuizSessionQuestion(module: module, question: $0) }
        }
        let filtered = allQuestions.filter { !excludedIDs.contains($0.question.id) }
        guard !filtered.isEmpty else { return [] }
        var pool = filtered
        pool.shuffle()
        return Array(pool.prefix(max(1, min(limit, pool.count))))
    }

    func allSessionQuestions() -> [QuizSessionQuestion] {
        modules.flatMap { module in
            module.questions.map { QuizSessionQuestion(module: module, question: $0) }
        }
    }

    func sessionQuestions(forModule id: String) -> [QuizSessionQuestion] {
        guard let module = modulesById[id] else { return [] }
        return module.questions.map { QuizSessionQuestion(module: module, question: $0) }
    }

    func sessionQuestions(forModule id: String, excluding excludedIDs: Set<String>) -> [QuizSessionQuestion] {
        let base = sessionQuestions(forModule: id)
        guard !base.isEmpty else { return [] }
        let filtered = base.filter { !excludedIDs.contains($0.question.id) }
        return filtered.isEmpty ? [] : filtered
    }

    func sessionQuestion(for reference: QuizSessionQuestionReference) -> QuizSessionQuestion? {
        guard let module = modulesById[reference.moduleID],
              let question = module.questions.first(where: { $0.id == reference.questionID }) else {
            return nil
        }
        return QuizSessionQuestion(module: module, question: question)
    }

    func moduleCount() -> Int {
        modules.count
    }

    func sessionQuestions(from references: [QuizSessionQuestionReference]) -> [QuizSessionQuestion] {
        references.compactMap { reference in
            guard let module = modulesById[reference.moduleID],
                  let question = module.questions.first(where: { $0.id == reference.questionID }) else {
                return nil
            }
            return QuizSessionQuestion(module: module, question: question)
        }
    }
}

```

---
### `iosApp/iprep/Features/Landing/LandingView.swift`
- Size: `12118` bytes
```
import SwiftUI

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
    let onShowLeaderboard: () -> Void

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

                Button(action: onShowLeaderboard) {
                    Text("Leaderboards")
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
### `iosApp/iprep/Features/Analytics/ProgressReportView.swift`
- Size: `12157` bytes
```
import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

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
### `iosApp/iprep/Features/Analytics/AnalyticsView.swift`
- Size: `12949` bytes
```
import SwiftUI
import Charts

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
- Size: `12990` bytes
```
import SwiftUI

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

---
### `iosApp/iprep/Features/Search/QuestionExplorerView.swift`
- Size: `14588` bytes
```
import SwiftUI

struct QuestionExplorerView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @State private var questions: [QuizSessionQuestion] = []
    @State private var modules: [Module] = []

    @State private var selectedModuleID: String?
    @State private var selectedDifficulty: Module.Difficulty?
    @State private var flaggedOnly = false
    @State private var withNotesOnly = false
    @State private var needsReviewOnly = false
    @State private var confidenceSelection: Set<QuestionStudyState.Confidence> = []

    var body: some View {
        List {
            filterSection
            resultsSection
        }
        .listStyle(.insetGrouped)
        .background(Color.ipBackground.ignoresSafeArea())
        .navigationTitle("Question Explorer")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Reset", action: resetFilters)
                    .disabled(!areFiltersActive)
            }
        }
        .onAppear(perform: loadIfNeeded)
    }

    private var filterSection: some View {
        Section("Filters") {
            Picker("Domain", selection: $selectedModuleID) {
                Text("All domains").tag(String?.none)
                ForEach(modules) { module in
                    Text(module.title).tag(String?(module.id))
                }
            }

            Picker("Difficulty", selection: $selectedDifficulty) {
                Text("All difficulty levels").tag(Module.Difficulty?.none)
                ForEach(Module.Difficulty.allCases, id: \.self) { difficulty in
                    Text(difficulty.rawValue.capitalized).tag(Module.Difficulty?(difficulty))
                }
            }

            Toggle("Flagged only", isOn: $flaggedOnly)
            Toggle("With notes only", isOn: $withNotesOnly)
            Toggle("Due for review", isOn: $needsReviewOnly)

            VStack(alignment: .leading, spacing: 8) {
                Text("Confidence")
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(Color.secondary)
                confidenceChips
            }
            .padding(.top, 6)
        }
    }

    private var resultsSection: some View {
        Section(header: resultsHeader) {
            let matches = filteredQuestions
            if matches.isEmpty {
                ContentUnavailableView(
                    "No matches",
                    systemImage: "magnifyingglass",
                    description: Text("Adjust your filters to see questions here.")
                )
                .frame(maxWidth: .infinity, alignment: .center)
                .listRowInsets(EdgeInsets())
                .background(Color.clear)
            } else {
                ForEach(matches) { question in
                    let state = environment.studyState(for: question.id)
                    NavigationLink {
                        QuestionExplorerDetailView(question: question, state: state)
                    } label: {
                        QuestionExplorerRow(question: question, state: state)
                    }
                    .listRowBackground(Color.ipSurface)
                }
            }
        }
    }

    private var resultsHeader: some View {
        HStack {
            Text("Results")
            Spacer()
            Text("\(filteredQuestions.count)")
                .font(.footnote.monospacedDigit())
                .foregroundStyle(Color.secondary)
        }
    }

    private var filteredQuestions: [QuizSessionQuestion] {
        questions.filter { question in
            guard matchesDomain(question), matchesDifficulty(question) else { return false }
            let state = environment.studyState(for: question.id)
            if flaggedOnly && !(state?.flagged ?? false) { return false }
            if withNotesOnly && (state?.noteMarkdown.isEmpty ?? true) { return false }
            if needsReviewOnly && !(state?.needsReview ?? false) { return false }
            if !confidenceSelection.isEmpty {
                guard let confidence = state?.confidence, confidenceSelection.contains(confidence) else { return false }
            }
            return true
        }
        .sorted { lhs, rhs in
            if lhs.module.summary.title == rhs.module.summary.title {
                return lhs.question.number < rhs.question.number
            }
            return lhs.module.summary.title < rhs.module.summary.title
        }
    }

    private func matchesDomain(_ question: QuizSessionQuestion) -> Bool {
        guard let selectedModuleID else { return true }
        return question.module.id == selectedModuleID
    }

    private func matchesDifficulty(_ question: QuizSessionQuestion) -> Bool {
        guard let selectedDifficulty else { return true }
        return question.module.summary.difficulty == selectedDifficulty
    }

    private var areFiltersActive: Bool {
        selectedModuleID != nil ||
        selectedDifficulty != nil ||
        flaggedOnly ||
        withNotesOnly ||
        needsReviewOnly ||
        !confidenceSelection.isEmpty
    }

    private func resetFilters() {
        selectedModuleID = nil
        selectedDifficulty = nil
        flaggedOnly = false
        withNotesOnly = false
        needsReviewOnly = false
        confidenceSelection.removeAll()
    }

    private func loadIfNeeded() {
        guard questions.isEmpty else { return }
        modules = environment.questionBankService.moduleSummaries().sorted { $0.title < $1.title }
        questions = environment.questionBankService.allSessionQuestions()
    }

    private var confidenceChips: some View {
        let columns = [GridItem(.adaptive(minimum: 140), spacing: 10, alignment: .leading)]
        return LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
            ForEach(QuestionStudyState.Confidence.allCases) { confidence in
                let isSelected = confidenceSelection.contains(confidence)
                Button {
                    if isSelected {
                        confidenceSelection.remove(confidence)
                    } else {
                        confidenceSelection.insert(confidence)
                    }
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: confidence.iconName)
                        Text(confidence.title)
                    }
                    .font(.subheadline)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        Capsule()
                            .fill(isSelected ? Color.ipAccent.opacity(0.2) : Color.ipSurface)
                    )
                }
                .buttonStyle(.plain)
            }
        }
    }
}

private struct QuestionExplorerRow: View {
    let question: QuizSessionQuestion
    let state: QuestionStudyState?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(question.module.summary.title)
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
                Spacer()
                if let confidence = state?.confidence {
                    ConfidenceBadge(confidence: confidence)
                }
            }

            Text(question.question.prompt)
                .font(.headline)
                .foregroundStyle(Color.primary)
                .lineLimit(3)

            let tags = statusTags
            if !tags.isEmpty {
                HStack(spacing: 8) {
                    ForEach(Array(tags.enumerated()), id: \.offset) { _, tag in
                        TagBadge(label: tag.label, color: tag.color, systemImage: tag.icon)
                    }
                }
            }
        }
        .padding(16)
    }

    private var statusTags: [(label: String, icon: String, color: Color)] {
        var tags: [(String, String, Color)] = []
        if state?.flagged == true {
            tags.append(("Flagged", "flag.fill", .orange))
        }
        if let note = state?.noteMarkdown, !note.isEmpty {
            tags.append(("Note", "note.text", .blue))
        }
        if state?.needsReview == true {
            tags.append(("Due", "calendar", .pink))
        }
        return tags
    }
}

private struct QuestionExplorerDetailView: View {
    let question: QuizSessionQuestion
    let state: QuestionStudyState?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                header
                optionSection
                if let explanation = explanationText, !explanation.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Explanation")
                            .font(.headline)
                        Text(explanation)
                            .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                if let note = state?.noteMarkdown, !note.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Your note")
                            .font(.headline)
                        Text(note)
                            .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                if !question.question.references.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("References")
                            .font(.headline)
                        ForEach(question.question.references, id: \.self) { reference in
                            Text(reference)
                                .font(.footnote)
                                .foregroundStyle(Color.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
            .padding(20)
        }
        .background(Color.ipBackground.ignoresSafeArea())
        .navigationTitle("Question")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(question.module.summary.title)
                .font(.caption)
                .foregroundStyle(Color.secondary)
            Text(question.question.prompt)
                .font(Typography.heading(size: .title3))
                .foregroundStyle(Color.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
            if let state {
                HStack(spacing: 8) {
                    if state.flagged {
                        TagBadge(label: "Flagged", color: .orange, systemImage: "flag.fill")
                    }
                    if !state.noteMarkdown.isEmpty {
                        TagBadge(label: "Note", color: .blue, systemImage: "note.text")
                    }
                    if state.needsReview {
                        TagBadge(label: "Due", color: .pink, systemImage: "calendar")
                    }
                    if let confidence = state.confidence {
                        ConfidenceBadge(confidence: confidence)
                    }
                }
            }
        }
    }

    private var optionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Options")
                .font(.headline)
            VStack(alignment: .leading, spacing: 10) {
                ForEach(question.question.options) { option in
                    optionRow(for: option)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func optionRow(for option: QuizOption) -> some View {
        let isCorrect = option.id == question.question.correctOptionId
        return HStack(alignment: .top, spacing: 12) {
            Text(option.id.uppercased())
                .font(.headline)
                .frame(width: 28, height: 28)
                .background(Circle().fill(Color.ipSurfaceElevated))
            Text(option.text)
                .font(.body)
                .foregroundStyle(Color.primary)
            Spacer()
            if isCorrect {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(Color.green)
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(optionBackground(isCorrect: isCorrect))
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(optionBorder(isCorrect: isCorrect), lineWidth: 1.2)
        )
    }

    private func optionBackground(isCorrect: Bool) -> Color {
        isCorrect ? Color.green.opacity(0.16) : Color.ipSurfaceElevated.opacity(0.35)
    }

    private func optionBorder(isCorrect: Bool) -> Color {
        isCorrect ? Color.green.opacity(0.6) : Color.clear
    }

    private var explanationText: String? {
        let explanation = question.question.explanation.trimmingCharacters(in: .whitespacesAndNewlines)
        return explanation.isEmpty ? nil : explanation
    }
}

private struct ConfidenceBadge: View {
    let confidence: QuestionStudyState.Confidence

    var body: some View {
        Label(confidence.title, systemImage: confidence.iconName)
            .font(.caption.weight(.semibold))
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(color.opacity(0.18))
            )
            .foregroundStyle(color)
    }

    private var color: Color {
        switch confidence {
        case .guess: return .red
        case .low: return .orange
        case .medium: return .blue
        case .high: return .green
        }
    }
}

private struct TagBadge: View {
    let label: String
    let color: Color
    let systemImage: String

    var body: some View {
        Label(label, systemImage: systemImage)
            .font(.caption)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(
                Capsule()
                    .fill(color.opacity(0.18))
            )
            .foregroundStyle(color)
    }
}

#Preview {
    QuestionExplorerView()
        .environmentObject(AppEnvironment.shared)
}

```

---
### `iosApp/iprep/Features/Quiz/QuizViewModel.swift`
- Size: `17426` bytes
```
import Foundation
import Combine

@MainActor
final class QuizViewModel: ObservableObject {
    enum State: Equatable {
        case idle
        case loading
        case ready
        case completed
        case error(String)
    }

    enum InitialSessionAction {
        case startFresh
        case resumeIfAvailable
    }

    @Published private(set) var state: State = .idle
    @Published private(set) var questions: [QuizSessionQuestion] = []
    @Published private(set) var currentIndex: Int = 0
    @Published private(set) var selections: [String: String] = [:]
    @Published private(set) var configuration: QuizSessionConfiguration = .default
    @Published private(set) var questionStates: [String: QuestionStudyState] = [:]
    @Published private(set) var elapsedSeconds: TimeInterval = 0
    @Published private(set) var currentQuestionSeconds: TimeInterval = 0
    @Published private(set) var isTimerPaused: Bool = false

    private var questionLookup: [String: QuizSessionQuestion] = [:]
    private var startDate: Date?
    private var endDate: Date?
    private var questionBank: QuestionBankService?
    private var localStore: LocalStoreType?
    private var sessionState: QuizSessionState?
    private var studyPlanner: StudyPlannerType?
    private var timerCancellable: AnyCancellable?
    private var lastTickDate: Date?
    private var lastQuestionID: String?
    private var lastPersistedElapsed: TimeInterval = 0
    private var isConfigured = false

    var currentQuestion: QuizSessionQuestion? {
        guard currentIndex >= 0 && currentIndex < questions.count else { return nil }
        return questions[currentIndex]
    }

    var progressText: String {
        guard !questions.isEmpty else { return "" }
        return "Question \(min(currentIndex + 1, questions.count)) of \(questions.count)"
    }

    var score: Int {
        selections.reduce(into: 0) { partialResult, element in
            guard let question = questionLookup[element.key] else { return }
            if question.question.correctOptionId == element.value {
                partialResult += 1
            }
        }
    }

    var duration: TimeInterval {
        guard let startDate else { return 0 }
        return (endDate ?? Date()).timeIntervalSince(startDate)
    }

    func configure(questionBank: QuestionBankService, localStore: LocalStoreType, studyPlanner: StudyPlannerType?) {
        guard !isConfigured else { return }
        self.questionBank = questionBank
        self.localStore = localStore
        self.studyPlanner = studyPlanner
        self.questionStates = localStore.allStudyStates()
        isConfigured = true
    }

    func prepareQuickStart(limit: Int, resumePreference: InitialSessionAction) {
        guard let questionBank, let localStore else { return }
        switch resumePreference {
        case .resumeIfAvailable:
            if let stored = localStore.activeQuizSession(),
               !stored.isCompleted,
               loadSession(from: stored, using: questionBank) {
                return
            }
            fallthrough
        case .startFresh:
            startQuickStart(limit: limit)
        }
    }

    func startQuickStart(limit: Int) {
        guard let questionBank else { return }
        guard state != .loading else { return }
        state = .loading
        let answered = localStore?.answeredQuestionIDs() ?? []
        let sessionQuestions = questionBank.quickStartQuestions(limit: limit, excluding: answered)
        guard !sessionQuestions.isEmpty else {
            state = .error("You're all caught up! Reset progress in Settings to practice again.")
            return
        }
        beginNewSession(with: sessionQuestions, limit: nil)
    }

    func startModuleQuiz(moduleID: String, limit: Int) {
        guard let questionBank else { return }
        state = .loading
        let answered = localStore?.answeredQuestionIDs() ?? []
        var sessionQuestions = questionBank.sessionQuestions(forModule: moduleID, excluding: answered)
        guard !sessionQuestions.isEmpty else {
            state = .error("All questions in this category are complete. Reset progress in Settings to study it again.")
            return
        }
        sessionQuestions.shuffle()
        beginNewSession(with: sessionQuestions, limit: limit)
    }

    func startIncorrectOnly(limit: Int) {
        guard let questionBank, let localStore else { return }
        state = .loading
        let sessions = localStore.completedQuizSessions()
        var seen = Set<String>()
        var incorrectQuestions: [QuizSessionQuestion] = []

        for session in sessions {
            for reference in session.questionReferences {
                guard let sessionQuestion = questionBank.sessionQuestion(for: reference) else { continue }
                let questionID = sessionQuestion.question.id
                let selected = session.selections[questionID]
                if selected != sessionQuestion.question.correctOptionId, seen.insert(questionID).inserted {
                    incorrectQuestions.append(sessionQuestion)
                }
            }
        }

        guard !incorrectQuestions.isEmpty else {
            state = .error("No incorrect answers yet. Complete a quiz first.")
            return
        }

        incorrectQuestions.shuffle()
        beginNewSession(with: incorrectQuestions, limit: limit)
    }

    func restart(with mode: QuizMode, limit: Int) {
        switch mode {
        case .quickStart:
            startQuickStart(limit: limit)
        case let .module(id, _):
            startModuleQuiz(moduleID: id, limit: limit)
        case .incorrectOnly:
            startIncorrectOnly(limit: limit)
        }
    }

    func select(optionId: String) {
        guard state == .ready, let question = currentQuestion else { return }
        guard !isAnswered(question) else { return }
        synchronizeTimer()
        var updated = selections
        updated[question.id] = optionId
        selections = updated
        updateSession { session in
            session.selections = updated
        }
        registerReviewMetadata(for: question, selectedOptionId: optionId)
    }

    func isOptionSelected(_ optionId: String, for question: QuizSessionQuestion) -> Bool {
        selections[question.id] == optionId
    }

    func isOptionCorrect(_ optionId: String, for question: QuizSessionQuestion) -> Bool {
        question.question.correctOptionId == optionId
    }

    func isAnswered(_ question: QuizSessionQuestion) -> Bool {
        selections[question.id] != nil
    }


    var canGoBack: Bool { currentIndex > 0 }
    var canAdvance: Bool { currentIndex + 1 < questions.count }

    func goBack() {
        guard canGoBack else { return }
        commitCurrentQuestionTiming()
        currentIndex -= 1
        updateSession { session in
            session.currentIndex = currentIndex
        }
        restoreTimingForCurrentQuestion()
    }

    func jumpToQuestion(at index: Int) {
        guard index >= 0, index < questions.count else { return }
        commitCurrentQuestionTiming()
        currentIndex = index
        updateSession { session in
            session.currentIndex = currentIndex
        }
        restoreTimingForCurrentQuestion()
    }

    func advance() {
        guard state == .ready else { return }
        if currentIndex + 1 < questions.count {
            commitCurrentQuestionTiming()
            currentIndex += 1
            updateSession { session in
                session.currentIndex = currentIndex
            }
            restoreTimingForCurrentQuestion()
        } else {
            finishSession()
        }
    }

    func selection(for question: QuizSessionQuestion) -> String? {
        selections[question.id]
    }

    func isSelectionCorrect(for question: QuizSessionQuestion) -> Bool? {
        guard let choice = selections[question.id] else { return nil }
        return question.question.correctOptionId == choice
    }

    func toggleFlag(for question: QuizSessionQuestion) {
        var state = studyState(for: question.id)
        state.flagged.toggle()
        questionStates[question.id] = state
        localStore?.updateStudyState(state, for: question.id)
    }

    func setConfidence(_ confidence: QuestionStudyState.Confidence?, for question: QuizSessionQuestion) {
        var state = studyState(for: question.id)
        state.confidence = confidence
        state.updateDueDate()
        questionStates[question.id] = state
        localStore?.updateStudyState(state, for: question.id)
    }

    func updateNote(_ markdown: String, for question: QuizSessionQuestion) {
        var state = studyState(for: question.id)
        state.noteMarkdown = markdown
        questionStates[question.id] = state
        localStore?.updateStudyState(state, for: question.id)
    }

    func studyState(for questionID: String) -> QuestionStudyState {
        questionStates[questionID] ?? QuestionStudyState()
    }

    func studyState(for question: QuizSessionQuestion) -> QuestionStudyState {
        studyState(for: question.id)
    }

    func updateConfiguration(_ configuration: QuizSessionConfiguration) {
        self.configuration = configuration
        updateSession { session in
            session.configuration = configuration
        }
    }

    func pauseTimer() {
        isTimerPaused = true
        lastTickDate = nil
    }

    func resumeTimer() {
        guard state == .ready else { return }
        isTimerPaused = false
        lastTickDate = Date()
    }

    func synchronizeTimer() {
        guard !isTimerPaused else { return }
        handleTick()
    }

    func startReviewQueue(limit: Int) {
        guard let studyPlanner else { return }
        state = .loading
        let queue = studyPlanner.reviewQueue(limit: limit)
        guard !queue.isEmpty else {
            state = .error("No questions are due for review yet.")
            return
        }
        beginNewSession(with: queue, limit: nil)
    }

    func startAdaptiveDrill(limit: Int) {
        guard let studyPlanner else { return }
        state = .loading
        let questions = studyPlanner.adaptiveDrill(limit: limit)
        guard !questions.isEmpty else {
            state = .error("Unable to build an adaptive drill right now.")
            return
        }
        beginNewSession(with: questions, limit: nil)
    }

    private func beginNewSession(with sessionQuestions: [QuizSessionQuestion], limit: Int?, storeActiveSession: Bool = true) {
        guard !sessionQuestions.isEmpty else {
            state = .error("Question bank is unavailable.")
            return
        }
        var working = sessionQuestions
        if let limit {
            working = Array(working.prefix(max(1, min(limit, working.count))))
        }
        questionLookup = Dictionary(uniqueKeysWithValues: working.map { ($0.question.id, $0) })
        questions = working
        selections = [:]
        currentIndex = 0
        let now = Date()
        startDate = now
        endDate = nil
        let references = working.map { QuizSessionQuestionReference(moduleID: $0.module.id, questionID: $0.question.id) }
        let session = QuizSessionState(
            id: UUID(),
            startedAt: now,
            lastUpdatedAt: now,
            currentIndex: 0,
            questionReferences: references,
            selections: [:],
            elapsedSeconds: 0,
            perQuestionSeconds: [:],
            configuration: configuration
        )
        sessionState = session
        if storeActiveSession {
            localStore?.saveActiveQuizSession(session)
        }
        state = .ready
        elapsedSeconds = 0
        currentQuestionSeconds = 0
        lastQuestionID = currentQuestion?.id
        lastPersistedElapsed = 0
        resumeTimer()
        startTimer()
    }

    private func updateSession(_ block: (inout QuizSessionState) -> Void) {
        guard var state = sessionState else { return }
        block(&state)
        state.lastUpdatedAt = Date()
        sessionState = state
        localStore?.saveActiveQuizSession(state)
    }

    private func loadSession(from stored: QuizSessionState, using questionBank: QuestionBankService) -> Bool {
        let restoredQuestions: [QuizSessionQuestion] = stored.questionReferences.compactMap { reference in
            questionBank.sessionQuestion(for: reference)
        }

        guard !restoredQuestions.isEmpty, restoredQuestions.count == stored.questionReferences.count else {
            return false
        }

        questionLookup = Dictionary(uniqueKeysWithValues: restoredQuestions.map { ($0.id, $0) })
        questions = restoredQuestions
        selections = stored.selections
        sessionState = stored
        startDate = stored.startedAt
        configuration = stored.configuration
        elapsedSeconds = stored.elapsedSeconds
        lastPersistedElapsed = stored.elapsedSeconds
        if stored.isCompleted {
            endDate = stored.lastUpdatedAt
            currentIndex = max(restoredQuestions.count - 1, 0)
            state = .completed
            currentQuestionSeconds = stored.perQuestionSeconds[currentQuestion?.id ?? ""] ?? 0
            timerCancellable?.cancel()
        } else {
            endDate = nil
            let cappedIndex = max(0, min(stored.currentIndex, restoredQuestions.count - 1))
            currentIndex = cappedIndex
            state = .ready
            currentQuestionSeconds = stored.perQuestionSeconds[currentQuestion?.id ?? ""] ?? 0
            lastQuestionID = currentQuestion?.id
            resumeTimer()
            startTimer()
        }
        return true
    }

    private func finishSession() {
        guard let localStore else { return }
        let finishDate = Date()
        timerCancellable?.cancel()
        synchronizeTimer()
        updateSession { session in
            session.currentIndex = questions.count
            session.elapsedSeconds = elapsedSeconds
        }
        endDate = finishDate
        state = .completed
        let total = max(questions.count, 1)
        let correct = score
        if var session = sessionState {
            session.lastUpdatedAt = finishDate
            sessionState = session
        }
        if let session = sessionState {
            let completed = CompletedQuizSession(
                id: session.id,
                startedAt: session.startedAt,
                completedAt: finishDate,
                duration: finishDate.timeIntervalSince(session.startedAt),
                totalQuestions: total,
                correctCount: correct,
                questionReferences: session.questionReferences,
                selections: selections
            )
            localStore.addCompletedQuizSession(completed)
        }
    }

    private func registerReviewMetadata(for question: QuizSessionQuestion, selectedOptionId: String) {
        guard let localStore else { return }
        let isCorrect = question.question.correctOptionId == selectedOptionId
        var state = studyState(for: question.id)
        state.registerReview(correct: isCorrect, secondsSpent: currentQuestionSeconds)
        questionStates[question.id] = state
        localStore.updateStudyState(state, for: question.id)
        updateSession { session in
            session.perQuestionSeconds[question.id] = currentQuestionSeconds
        }
    }

    private func commitCurrentQuestionTiming() {
        guard let question = currentQuestion else { return }
        synchronizeTimer()
        updateSession { session in
            session.perQuestionSeconds[question.id] = currentQuestionSeconds
            session.elapsedSeconds = elapsedSeconds
        }
        lastQuestionID = question.id
        lastPersistedElapsed = elapsedSeconds
    }

    private func restoreTimingForCurrentQuestion() {
        guard let session = sessionState, let question = currentQuestion else { return }
        let stored = session.perQuestionSeconds[question.id] ?? 0
        currentQuestionSeconds = stored
        lastQuestionID = question.id
        resumeTimer()
    }

    private func startTimer() {
        timerCancellable?.cancel()
        lastTickDate = Date()
        isTimerPaused = false
        timerCancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.handleTick()
            }
    }

    private func handleTick() {
        guard !isTimerPaused else { return }
        let now = Date()
        guard let last = lastTickDate else {
            lastTickDate = now
            return
        }
        let delta = now.timeIntervalSince(last)
        lastTickDate = now
        elapsedSeconds += delta
        currentQuestionSeconds += delta
        if let questionID = currentQuestion?.id {
            sessionState?.perQuestionSeconds[questionID] = currentQuestionSeconds
        }
        sessionState?.elapsedSeconds = elapsedSeconds
        if elapsedSeconds - lastPersistedElapsed >= 5 {
            updateSession { session in
                session.elapsedSeconds = elapsedSeconds
                if let questionID = currentQuestion?.id {
                    session.perQuestionSeconds[questionID] = currentQuestionSeconds
                }
            }
            lastPersistedElapsed = elapsedSeconds
        }
    }
}

```

---
### `iosApp/iprep/Features/Quiz/QuizView.swift`
- Size: `37873` bytes
```
import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

struct QuizView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @Environment(\.scenePhase) private var scenePhase
    @StateObject private var viewModel: QuizViewModel
    @State private var didConfigure = false
    @State private var didPrepareInitialSession = false
    @State private var quickStartCount: Int = 10
    @State private var isNoteSheetPresented = false
    @State private var noteDraft: String = ""
    @State private var noteQuestionID: String?
    @State private var leaderboardOptIn = false

    private let mode: QuizMode

    init(mode: QuizMode = .quickStart(resume: false)) {
        self.mode = mode
        self._viewModel = StateObject(wrappedValue: QuizViewModel())
    }

    private var navigationTitle: String {
        switch mode {
        case .quickStart:
            return "Quiz"
        case let .module(_, title):
            return title
        case .incorrectOnly:
            return "Retry Incorrect"
        }
    }

    private var questionCountOptions: [Int] {
        func sanitizedOptions(upTo total: Int) -> [Int] {
            guard total > 0 else { return [5, 10, 15, 20] }
            let seeds = [5, 10, 15, 20, total]
            let filtered = Array(Set(seeds)).sorted().filter { $0 <= total }
            return filtered.isEmpty ? [total] : filtered
        }

        switch mode {
        case .quickStart:
            return [5, 10, 15, 20]
        case let .module(id, _):
            let total = environment.questionBankService.questions(forModule: id).count
            return sanitizedOptions(upTo: total)
        case .incorrectOnly:
            let total = environment.incorrectQuestionCount()
            return sanitizedOptions(upTo: total)
        }
    }

    var body: some View {
        Group {
            switch viewModel.state {
            case .idle, .loading:
                ProgressView("Loading quiz…")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.ipBackground)
            case .error(let message):
                VStack(spacing: 16) {
                    Image(systemName: "exclamationmark.triangle")
                        .font(.system(size: 46))
                        .foregroundStyle(Color.orange)
                    Text(message)
                        .font(.body)
                        .multilineTextAlignment(.center)
                    Button("Try Again") {
                        startQuiz(initial: false)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.ipBackground)
            case .completed:
                summaryView
            case .ready:
                if let question = viewModel.currentQuestion {
                    quizQuestionView(question)
                } else {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.ipBackground)
                }
            }
        }
        .navigationTitle(navigationTitle)
        .background(Color.ipBackground.ignoresSafeArea())
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                timerSummaryView
            }
            ToolbarItemGroup(placement: .topBarTrailing) {
                if !viewModel.questions.isEmpty {
                    Menu {
                        ForEach(Array(viewModel.questions.indices), id: \.self) { index in
                            let question = viewModel.questions[index]
                            Button {
                                viewModel.jumpToQuestion(at: index)
                            } label: {
                                let status = viewModel.isAnswered(question) ? "✓" : ""
                                Text("Question \(index + 1) \(status)")
                            }
                        }
                    } label: {
                        Image(systemName: "list.number")
                    }
                }
                Menu {
                    Picker("Number of Questions", selection: $quickStartCount) {
                        ForEach(questionCountOptions, id: \.self) { count in
                            Text("\(count) questions").tag(count)
                        }
                    }
                    Divider()
                    Button("Start Over", role: .none) {
                        viewModel.restart(with: normalizedModeForRestart, limit: quickStartCount)
                    }
                    Button("Daily review queue") {
                        viewModel.startReviewQueue(limit: quickStartCount)
                    }
                    Button("Fix my weak spots") {
                        viewModel.startAdaptiveDrill(limit: max(15, quickStartCount))
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
                Menu {
                    Picker("Study Mode", selection: modeBinding) {
                        ForEach(QuizSessionMode.allCases) { mode in
                            Text(mode.title).tag(mode)
                        }
                    }
                    Toggle(isOn: perQuestionTimerBinding) {
                        Label("Per-question timer", systemImage: "clock.arrow.circlepath")
                    }
                    Toggle(isOn: autoPauseBinding) {
                        Label("Auto-pause on background", systemImage: "pause.circle")
                    }
                    Toggle(isOn: $leaderboardOptIn) {
                        Label("Opt into leaderboards", systemImage: "trophy")
                    }
                } label: {
                    Image(systemName: "gearshape")
                }
            }
        }
        .task {
            if !didConfigure {
                viewModel.configure(
                    questionBank: environment.questionBankService,
                    localStore: environment.localStore,
                    studyPlanner: environment.studyPlanner
                )
                leaderboardOptIn = environment.leaderboardOptIn()
                didConfigure = true
            }
            if !didPrepareInitialSession {
                adjustQuestionCountForMode()
                startQuiz(initial: true)
                didPrepareInitialSession = true
            }
        }
        .onChange(of: scenePhase) { _, newPhase in
            guard viewModel.configuration.autoPauseOnBackground else { return }
            switch newPhase {
            case .background, .inactive:
                viewModel.pauseTimer()
            case .active:
                viewModel.resumeTimer()
            default:
                break
            }
        }
        .onChange(of: leaderboardOptIn) { _, newValue in
            environment.setLeaderboardOptIn(newValue)
        }
        .sheet(isPresented: $isNoteSheetPresented) {
            if let questionID = noteQuestionID,
               let question = viewModel.questions.first(where: { $0.question.id == questionID }) {
                NoteEditor(
                    note: $noteDraft,
                    question: question,
                    onSave: {
                        viewModel.updateNote(noteDraft, for: question)
                    },
                    exportHandler: { format in
                        exportURL(for: question, format: format)
                    }
                )
            } else {
                Text("No question selected")
                    .presentationDetents([.medium])
            }
        }
    }

    private var normalizedModeForRestart: QuizMode {
        switch mode {
        case .quickStart:
            return .quickStart(resume: false)
        case let .module(id, title):
            return .module(id: id, title: title)
        case .incorrectOnly:
            return .incorrectOnly
        }
    }

    private func adjustQuestionCountForMode() {
        guard let maxOption = questionCountOptions.max() else { return }
        quickStartCount = min(quickStartCount, maxOption)
    }

    private func startQuiz(initial: Bool) {
        adjustQuestionCountForMode()
        switch mode {
        case let .quickStart(resume):
            let action: QuizViewModel.InitialSessionAction = initial ? (resume ? .resumeIfAvailable : .startFresh) : .startFresh
            viewModel.prepareQuickStart(limit: quickStartCount, resumePreference: action)
        case let .module(id, _):
            viewModel.startModuleQuiz(moduleID: id, limit: quickStartCount)
        case .incorrectOnly:
            viewModel.startIncorrectOnly(limit: quickStartCount)
        }
    }

    private func quizQuestionView(_ sessionQuestion: QuizSessionQuestion) -> some View {
        VStack(spacing: 16) {
            sessionControls
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    header(for: sessionQuestion)
                    prompt(for: sessionQuestion)
                    if !sessionQuestion.question.imageURLs.isEmpty {
                        imageCarousel(for: sessionQuestion)
                    }
                    optionsList(for: sessionQuestion)
                    confidenceChips(for: sessionQuestion)
                    noteToolbar(for: sessionQuestion)
                    if shouldShowExplanation(for: sessionQuestion) {
                        explanation(for: sessionQuestion)
                    }
                    controlBar(for: sessionQuestion)
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal, 16)
    }

    private func header(for sessionQuestion: QuizSessionQuestion) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(sessionQuestion.module.summary.title)
                .font(.headline)
                .foregroundStyle(Color.secondary)
            ProgressView(value: Double(viewModel.currentIndex + 1), total: Double(viewModel.questions.count))
                .tint(Color.ipAccent)
            Text(viewModel.progressText)
                .font(.caption)
                .foregroundStyle(Color.secondary)
        }
    }

    private var sessionControls: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                Label(formattedTime(viewModel.elapsedSeconds), systemImage: "clock")
                    .font(.headline)
                if viewModel.configuration.perQuestionTimerEnabled {
                    Text("Question: \(formattedTime(viewModel.currentQuestionSeconds))")
                        .font(.subheadline)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Capsule().fill(Color.ipSurface))
                }
                Spacer()
                Button {
                    if viewModel.isTimerPaused {
                        viewModel.resumeTimer()
                    } else {
                        viewModel.pauseTimer()
                    }
                } label: {
                    Label(viewModel.isTimerPaused ? "Resume" : "Pause", systemImage: viewModel.isTimerPaused ? "play.fill" : "pause.fill")
                }
                .buttonStyle(.bordered)
                .disabled(viewModel.state != .ready)
            }

            Text(viewModel.configuration.mode.description)
                .font(.footnote)
                .foregroundStyle(Color.secondary)
        }
        .padding(16)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }

    private func shouldShowExplanation(for sessionQuestion: QuizSessionQuestion) -> Bool {
        guard viewModel.isAnswered(sessionQuestion) else { return false }
        return viewModel.configuration.mode == .study || viewModel.state == .completed
    }

    private func flagButton(for sessionQuestion: QuizSessionQuestion) -> some View {
        let studyState = viewModel.studyState(for: sessionQuestion)
        let isFlagged = studyState.flagged
        return Button {
            viewModel.toggleFlag(for: sessionQuestion)
        } label: {
            Image(systemName: isFlagged ? "flag.fill" : "flag")
                .foregroundStyle(isFlagged ? Color.orange : Color.secondary)
                .padding(8)
        }
        .accessibilityLabel(isFlagged ? "Remove flag" : "Flag question")
    }

    private func confidenceChips(for sessionQuestion: QuizSessionQuestion) -> some View {
        let current = viewModel.studyState(for: sessionQuestion).confidence
        return VStack(alignment: .leading, spacing: 12) {
            Text("Confidence")
                .font(.headline)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 110), spacing: 12)], spacing: 12) {
                ForEach(QuestionStudyState.Confidence.allCases) { confidence in
                    ConfidenceChip(
                        confidence: confidence,
                        isSelected: confidence == current,
                        action: {
                            let newValue = confidence == current ? nil : confidence
                            viewModel.setConfidence(newValue, for: sessionQuestion)
                        }
                    )
                }
            }
        }
    }

    private func noteToolbar(for sessionQuestion: QuizSessionQuestion) -> some View {
        let note = viewModel.studyState(for: sessionQuestion).noteMarkdown
        return VStack(alignment: .leading, spacing: 8) {
            HStack {
                Label("Notes", systemImage: "note.text")
                    .font(.headline)
                Spacer()
                Button {
                    noteQuestionID = sessionQuestion.question.id
                    noteDraft = note
                    isNoteSheetPresented = true
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "square.and.pencil")
                        Text(note.isEmpty ? "Add" : "Edit")
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.ipAccent)
            }
            if !note.isEmpty {
               Text(note)
                    .font(.footnote)
                    .foregroundStyle(Color.secondary)
                    .lineLimit(4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(Color.ipSurface)
                    )
            }
        }
    }

    private func makeTimerStatusView() -> some View {
        HStack(spacing: 8) {
            Label(formattedShortTime(viewModel.elapsedSeconds), systemImage: "clock")
                .font(.subheadline)
            if viewModel.configuration.perQuestionTimerEnabled {
                Text(formattedShortTime(viewModel.currentQuestionSeconds))
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Capsule().fill(Color.ipSurface))
            }
        }
    }

    private var timerSummaryView: some View {
        makeTimerStatusView()
    }

    private var modeBinding: Binding<QuizSessionMode> {
        Binding(
            get: { viewModel.configuration.mode },
            set: { newValue in
                var configuration = viewModel.configuration
                configuration.mode = newValue
                viewModel.updateConfiguration(configuration)
            }
        )
    }

    private var perQuestionTimerBinding: Binding<Bool> {
        Binding(
            get: { viewModel.configuration.perQuestionTimerEnabled },
            set: { newValue in
                var configuration = viewModel.configuration
                configuration.perQuestionTimerEnabled = newValue
                viewModel.updateConfiguration(configuration)
            }
        )
    }

    private var autoPauseBinding: Binding<Bool> {
        Binding(
            get: { viewModel.configuration.autoPauseOnBackground },
            set: { newValue in
                var configuration = viewModel.configuration
                configuration.autoPauseOnBackground = newValue
                viewModel.updateConfiguration(configuration)
            }
        )
    }

    private func formattedTime(_ seconds: TimeInterval) -> String {
        let totalSeconds = Int(seconds.rounded())
        let minutes = totalSeconds / 60
        let secs = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, secs)
    }

    private func formattedShortTime(_ seconds: TimeInterval) -> String {
        formattedTime(seconds)
    }

    private enum NotesExportFormat: String, CaseIterable, Identifiable {
        case markdown
        case csv
        case pdf

        var id: String { rawValue }

        var title: String {
            switch self {
            case .markdown:
                return "Markdown"
            case .csv:
                return "CSV"
            case .pdf:
                return "PDF"
            }
        }

        var fileExtension: String {
            switch self {
            case .markdown:
                return "md"
            case .csv:
                return "csv"
            case .pdf:
                return "pdf"
            }
        }
    }

    private func exportURL(for question: QuizSessionQuestion, format: NotesExportFormat) -> URL? {
        let note = viewModel.studyState(for: question).noteMarkdown
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("AABIPNotes", isDirectory: true)
        do {
            try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        } catch {
            return nil
        }
        let sanitized = question.question.id.replacingOccurrences(of: " ", with: "-")
        let url = directory.appendingPathComponent("\(sanitized).\(format.fileExtension)")
        let markdown = markdownExport(for: question, note: note)
        switch format {
        case .markdown:
            do {
                try markdown.write(to: url, atomically: true, encoding: .utf8)
                return url
            } catch {
                return nil
            }
        case .csv:
            let escapedPrompt = csvEscape(question.question.prompt)
            let escapedNote = csvEscape(note)
            let csv = "Question,Module,Confidence,Note\n\(escapedPrompt),\(csvEscape(question.module.summary.title)),\(viewModel.studyState(for: question).confidence?.title ?? ""),\(escapedNote)\n"
            do {
                try csv.write(to: url, atomically: true, encoding: .utf8)
                return url
            } catch {
                return nil
            }
        case .pdf:
#if canImport(UIKit)
            let renderer = UIGraphicsPDFRenderer(bounds: CGRect(x: 0, y: 0, width: 612, height: 792))
            let data = renderer.pdfData { context in
                context.beginPage()
                let textRect = CGRect(x: 32, y: 32, width: 548, height: 728)
                let paragraph = NSMutableParagraphStyle()
                paragraph.lineBreakMode = .byWordWrapping
                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.preferredFont(forTextStyle: .body),
                    .paragraphStyle: paragraph
                ]
                let attributed = NSAttributedString(string: markdown, attributes: attributes)
                attributed.draw(in: textRect)
            }
            do {
                try data.write(to: url)
                return url
            } catch {
                return nil
            }
#else
            do {
                try markdown.write(to: url, atomically: true, encoding: .utf8)
                return url
            } catch {
                return nil
            }
#endif
        }
    }

    private func markdownExport(for question: QuizSessionQuestion, note: String) -> String {
        let confidence = viewModel.studyState(for: question).confidence?.title ?? "Unrated"
        return """
        # Question \(question.question.number)
        Module: \(question.module.summary.title)
        Confidence: \(confidence)

        ## Prompt
        \(question.question.prompt)

        ## Notes
        \(note.isEmpty ? "No notes yet." : note)
        """
    }

    private func csvEscape(_ value: String) -> String {
        let escaped = value.replacingOccurrences(of: "\"", with: "\"\"")
        return "\"\(escaped)\""
    }

    private struct NoteEditor: View {
        @Environment(\.dismiss) private var dismiss
        @Binding var note: String
        let question: QuizSessionQuestion
        let onSave: () -> Void
        let exportHandler: (NotesExportFormat) -> URL?

        var body: some View {
            NavigationStack {
                VStack(alignment: .leading, spacing: 16) {
                    formattingToolbar
                    TextEditor(text: $note)
                        .frame(minHeight: 220)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.ipSurface, lineWidth: 1)
                        )
                    Spacer(minLength: 12)
                    exportMenu
                }
                .padding()
                .navigationTitle("Notes")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") { dismiss() }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            onSave()
                            dismiss()
                        }
                    }
                }
            }
            .presentationDetents([.medium, .large])
        }

        private var formattingToolbar: some View {
            HStack(spacing: 12) {
                Button {
                    note.append("**Bold text**")
                } label: {
                    Label("Bold", systemImage: "bold")
                }
                Button {
                    note.append("*Italic text*")
                } label: {
                    Label("Italic", systemImage: "italic")
                }
                Button {
                    note.append("==Highlight==")
                } label: {
                    Label("Highlight", systemImage: "highlighter")
                }
#if canImport(UIKit)
                Button {
                    UIPasteboard.general.string = note
                } label: {
                    Label("Copy", systemImage: "doc.on.doc")
                }
#endif
            }
            .labelStyle(.iconOnly)
            .buttonStyle(.bordered)
        }

        private var exportMenu: some View {
            Menu {
                ForEach(NotesExportFormat.allCases) { format in
                    if let url = exportHandler(format) {
                        ShareLink(item: url) {
                            Label(format.title, systemImage: "square.and.arrow.up")
                        }
                    }
                }
            } label: {
                Label("Export", systemImage: "square.and.arrow.up")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
    }

    private func prompt(for sessionQuestion: QuizSessionQuestion) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                Text("Question \(sessionQuestion.question.number)")
                    .font(Typography.heading(size: .title3))
                Spacer()
                flagButton(for: sessionQuestion)
            }
            Text(sessionQuestion.question.prompt)
                .font(.title3.weight(.medium))
                .foregroundStyle(Color.primary)
        }
    }

    private func imageCarousel(for sessionQuestion: QuizSessionQuestion) -> some View {
        TabView {
            ForEach(sessionQuestion.question.imageURLs, id: \.self) { url in
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 260)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    case .failure:
                        VStack(spacing: 12) {
                            Image(systemName: "photo")
                                .font(.largeTitle)
                                .foregroundStyle(Color.secondary)
                            Text("Image unavailable")
                                .font(.caption)
                                .foregroundStyle(Color.secondary)
                        }
                        .frame(maxWidth: .infinity, minHeight: 200)
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(height: 260)
                .padding(.vertical, 4)
            }
        }
#if os(iOS)
        .tabViewStyle(.page)
#endif
        .frame(height: 280)
    }

    private func optionsList(for sessionQuestion: QuizSessionQuestion) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(sessionQuestion.question.options) { option in
                let isAnswered = viewModel.isAnswered(sessionQuestion)
                let isSelected = viewModel.isOptionSelected(option.id, for: sessionQuestion)
                let isCorrect = viewModel.isOptionCorrect(option.id, for: sessionQuestion)
                Button {
                    withAnimation(.easeInOut) {
                        viewModel.select(optionId: option.id)
                    }
                } label: {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(alignment: .top, spacing: 12) {
                            Text(option.id.uppercased())
                                .font(.headline)
                                .frame(width: 32, height: 32)
                                .background(Circle().fill(Color.ipSurfaceElevated))
                            if !option.text.isEmpty {
                                Text(option.text)
                                    .font(.body)
                                    .multilineTextAlignment(.leading)
                            }
                            Spacer()
                        }
                        if let imageURL = option.imageURL {
                            AsyncImage(url: imageURL) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(maxWidth: .infinity, minHeight: 140)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: .infinity, maxHeight: 140)
                                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                case .failure:
                                    Image(systemName: "photo")
                                        .font(.largeTitle)
                                        .foregroundStyle(Color.secondary)
                                        .frame(maxWidth: .infinity, minHeight: 120)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(choiceBackground(isAnswered: isAnswered, isSelected: isSelected, isCorrect: isCorrect))
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(choiceBorder(isAnswered: isAnswered, isSelected: isSelected, isCorrect: isCorrect), lineWidth: 2)
                    )
                }
                .buttonStyle(.plain)
                .disabled(isAnswered)
                .accessibilityLabel(Text("Option \(option.id)" + (option.text.isEmpty ? " image" : ": \(option.text)")))
            }
        }
    }

    private func explanation(for sessionQuestion: QuizSessionQuestion) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Explanation")
                .font(.headline)
            Text(sessionQuestion.question.explanation)
                .font(.body)
                .foregroundStyle(Color.secondary)
            if !sessionQuestion.question.explanationImageURLs.isEmpty {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(sessionQuestion.question.explanationImageURLs, id: \.self) { url in
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(maxWidth: .infinity, minHeight: 140)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity, maxHeight: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            case .failure:
                                Image(systemName: "photo")
                                    .font(.largeTitle)
                                    .foregroundStyle(Color.secondary)
                                    .frame(maxWidth: .infinity, minHeight: 120)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                }
            }
            if !sessionQuestion.question.references.isEmpty {
                Divider()
                Text("References")
                    .font(.headline)
                ForEach(sessionQuestion.question.references, id: \.self) { reference in
                    Text(reference)
                        .font(.footnote)
                        .foregroundStyle(Color.secondary)
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }

    private func controlBar(for sessionQuestion: QuizSessionQuestion) -> some View {
        HStack(spacing: 12) {
            Button {
                viewModel.goBack()
            } label: {
                Label("Previous", systemImage: "arrow.left")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .disabled(!viewModel.canGoBack)
            .opacity(viewModel.canGoBack ? 1 : 0.6)

            Button(action: viewModel.advance) {
                Label(viewModel.currentIndex + 1 == viewModel.questions.count ? "Finish" : "Next", systemImage: "arrow.right")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(!viewModel.isAnswered(sessionQuestion))
            .opacity(viewModel.isAnswered(sessionQuestion) ? 1 : 0.6)
        }
    }

    private func choiceBackground(isAnswered: Bool, isSelected: Bool, isCorrect: Bool) -> some View {
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(backgroundColor(isAnswered: isAnswered, isSelected: isSelected, isCorrect: isCorrect))
    }

    private func backgroundColor(isAnswered: Bool, isSelected: Bool, isCorrect: Bool) -> Color {
        guard isAnswered else { return Color.ipSurface } 
        if isSelected {
            return isCorrect ? Color.green.opacity(0.25) : Color.red.opacity(0.2)
        }
        return isCorrect ? Color.green.opacity(0.15) : Color.ipSurface
    }

    private func choiceBorder(isAnswered: Bool, isSelected: Bool, isCorrect: Bool) -> Color {
        guard isAnswered else { return Color.clear }
        if isSelected {
            return isCorrect ? Color.green : Color.red
        }
        return isCorrect ? Color.green.opacity(0.7) : Color.clear
    }

    private var summaryView: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 64))
                .foregroundStyle(Color.ipAccent)

            Text("Great work!")
                .font(Typography.heading(size: .title))

            VStack(spacing: 8) {
                Text("Score: \(viewModel.score)/\(viewModel.questions.count)")
                    .font(.title3.weight(.semibold))
                Text("Time: \(formattedTime(viewModel.duration))")
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            }

            if leaderboardOptIn, let snapshot = environment.leaderboardSnapshot(), !snapshot.domains.isEmpty {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Label("Weekly leaderboard", systemImage: "trophy")
                            .font(.headline)
                        Spacer()
                    }
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(snapshot.alias)
                                .font(.caption.weight(.semibold))
                            Text("ID: \(snapshot.participantID.prefix(8))…")
                                .font(.caption2.monospacedDigit())
                                .foregroundStyle(Color.secondary)
                        }
                        Spacer()
                    }
                    ForEach(snapshot.domains) { domain in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(domain.title)
                                    .font(.subheadline.weight(.semibold))
                                Text("Accuracy: \(Int(domain.accuracy * 100))% • Percentile: \(Int(domain.percentile * 100))th")
                                    .font(.caption)
                                    .foregroundStyle(Color.secondary)
                            }
                            Spacer()
                        }
                        .padding(12)
                        .background(Color.ipSurface)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    }
                }
                .frame(maxWidth: 420)
            }

            Button("Start Over") {
                viewModel.restart(with: normalizedModeForRestart, limit: quickStartCount)
            }
            .buttonStyle(.borderedProminent)
            Button("Review weak areas") {
                viewModel.startAdaptiveDrill(limit: max(15, quickStartCount))
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.ipBackground)
    }
}


private struct ConfidenceChip: View {
    let confidence: QuestionStudyState.Confidence
    let isSelected: Bool
    let action: () -> Void

    private var selectedBackground: Color { Color.ipAccent.opacity(0.22) }
    private var deselectedBackground: Color { Color.ipSurface }
    private var borderColor: Color { isSelected ? Color.ipAccent.opacity(0.6) : Color.clear }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: confidence.iconName)
                Text(confidence.title)
            }
            .font(.subheadline.weight(.semibold))
            .foregroundStyle(isSelected ? Color.ipAccent : Color.primary)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(isSelected ? selectedBackground : deselectedBackground)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(borderColor, lineWidth: isSelected ? 1.5 : 1.0)
            )
        }
        .buttonStyle(.plain)
    }
}

```

---
### `docs/ARCHITECTURE.md`
- Size: `11186` bytes
```
# IPREP Codebase Guide

This document explains the structure of the IPREP SwiftUI application, how core modules interact, and where to find the primary app functions that drive the learning experience.

## High-Level Overview

IPREP is a self-contained SwiftUI app that implements a quiz engine with study-planning, analytics, and lightweight social features. A single `AppEnvironment` object wires together services for authentication, content, persistence, networking, and personalization. Views read dependencies through `@EnvironmentObject`, while view models encapsulate business logic and coordinate with services.

````mermaid
graph LR
    A[iprepApp] --> B(AppEnvironment.shared)
    B --> C{Services}
    B --> D{Local Store}
    B --> E{Question Bank}
    B --> F{Study Planner}
    B --> G{Leaderboard}
    A --> H(RootView)
    H --> I[Feature Navigation]
    I --> Q[Quiz]
    I --> R[Analytics]
    I --> S[Dashboard]
    I --> T[Review]
    I --> U[Settings]
````

### Bootstrapping
- `iprepApp.swift` creates a shared `AppEnvironment` and injects it into `RootView`.
- `RootView` (in `ContentView.swift`) hosts a `NavigationStack` that routes between feature screens using the `AppRoute` enum.

### Key Concepts
- **Modules** bundle questions (`QuizModule`, `QuizQuestion`, `QuizOption`) sourced from `QuestionBankService`.
- **Sessions** track in-progress quizzes using `QuizSessionState`, stored via `LocalStore` and restored by `QuizViewModel`.
- **Study metadata** lives in `QuestionStudyState`, updated whenever a learner answers, flags, times, or annotates a question.

## Data Models

| Type | Location | Purpose |
| --- | --- | --- |
| `AppRoute` | `iprep/Models/AppRoute.swift` | Declarative navigation targets for `NavigationStack`.
| `Module` & `QuizModule` | `iprep/Models/Module.swift`, `iprep/Models/QuizQuestion.swift` | Domain taxonomy, metadata, and question payloads.
| `QuizSessionState` | `iprep/Models/QuizSessionState.swift` | Serializable snapshot of an active quiz, including timing and configuration.
| `CompletedQuizSession` | same file | Historic quiz run with accuracy, selections, and references for analytics.
| `QuizSessionConfiguration` & `QuizSessionMode` | `iprep/Models/QuizSessionConfiguration.swift` | Defines study vs exam behavior, timers, and background pause options.
| `QuestionStudyState` | `iprep/Services/QuestionStudyState.swift` | Learner-specific metadata (flags, confidence, spaced repetition schedule, notes).
| `LeaderboardSnapshot` | `iprep/Services/LeaderboardService.swift` | Aggregated scores for privacy-preserving leaderboards.

## Services

All services live in `iprep/Services` and are composed inside `AppEnvironment`.

- `AuthService`: Generates an anonymous user and exposes `userDidChange` so sync can react to sign-in transitions.
- `QuestionBankService`: Loads the baked-in question bank (`Resources/QuestionBank.json`), supplies module summaries, session questions, and adaptive pools.
- `FirestoreService`: Mock fetch layer that returns module lists and dashboard summaries; replace with real networking when ready.
- `StorageService`: Placeholder for remote asset storage interactions.
- `RemoteConfigService` & `FeatureFlags`: Provide remote-feature toggles with defaults backed by `Resources/RemoteConfigDefaults.plist`.
- `MediaCache`: Caches remote media assets (images, explanations) for reuse.
- `LocalStore`: Persists downloaded modules, active session state, completed sessions, and study metadata in `UserDefaults`. Publishes changes via Combine subjects.
- `SyncManager`: Watches auth and store publishers, scheduling upstream syncs with Firestore or other back ends.
- `StudyPlanner`: Translates `QuestionStudyState` into daily review queues and adaptive drills (weak-area targeting).
- `LeaderboardService`: Manages opt-in status, participant IDs, and deterministic percentile calculations for each domain.

> ℹ️ The file `QuestionStudyState 2.swift` is a legacy variant carried forward during refactors. The active implementation is `QuestionStudyState.swift`; consolidate before shipping.

## AppEnvironment

`AppEnvironment` (see `iprep/AppEnvironment.swift`) is a `@MainActor` observable singleton. It:
- Instantiates all services in a known order so dependencies (e.g., Firestore needs QuestionBank) are wired correctly.
- Exposes published data streams (`downloadedModuleIDs`, `activeQuizSession`, `completedQuizSessions`, `studyStates`).
- Provides façade helpers such as `reviewQueue(limit:)`, `adaptiveDrillQuestions(limit:)`, `leaderboardSnapshot()`, and various local store proxies.

Every feature view injects the environment for quick access to shared data and actions.

## Feature Modules

### Landing (`iprep/Features/Landing`)
- `LandingView` presents quick actions (start practice, continue, analytics, dashboard) and module selection.
- Integrates with `AppEnvironment` to show download status and modules.

### Quiz (`iprep/Features/Quiz`)
- `QuizView` renders the core question experience: timers, filters, confidence chips, notes, explanations, and control bar.
- `QuizViewModel` orchestrates session lifecycle (load/resume quiz, apply filters, handle navigation, manage timers, persist progress, and emit completion data).
- Key functions:
  - `configure(questionBank:localStore:studyPlanner:)`
  - `prepareQuickStart(limit:resumePreference:)`, `startModuleQuiz`, `startIncorrectOnly`
  - `startReviewQueue(limit:)`, `startAdaptiveDrill(limit:)`
  - `select(optionId:)`, `toggleFlag`, `setConfidence`, `updateNote`
  - `pauseTimer()`, `resumeTimer()`, `synchronizeTimer()`
  - `goBack()`, `advance()`, `jumpToQuestion(at:)`
  - `restart(with:limit:)` for reset scenarios.
- `QuizMode`, `QuizSessionMode`, and toolbar bindings expose quick restarts, timer toggles, and leaderboard opt-in.

### Review (`iprep/Features/Review`)
- `ReviewView` lets learners revisit completed sessions, inspect rationales, and export notes.
- Relies on `AppEnvironment.completedQuizSessions` and `QuestionStudyState` entries for presentation.

### Analytics (`iprep/Features/Analytics`)
- `AnalyticsView` aggregates quiz history into charts and summary cards using Swift Charts.
- Provides CTA to `ProgressReportView`, showcasing trends and module breakdowns.
- `ProgressReportView` formats a printable/sharable report summarizing progress, time on task, and weak domains.

### Dashboard (`iprep/Features/Dashboard`)
- `DashboardView` surface-level stats, streaks, and links into other features. Uses async calls to `FirestoreService.fetchDashboardSnapshot()`.

### Settings (`iprep/Features/Settings`)
- `SettingsView` includes reset progress, download management, feedback links, and leaderboard opt-in toggles (mirrors `QuizView` controls).

## Quiz Flow Details

1. **Session setup**
   - `QuizViewModel.prepareQuickStart` chooses between resuming an active session (`LocalStore.activeQuizSession()`) or creating a fresh set via `QuestionBankService`.
   - New sessions persist to `LocalStore` so backgrounding or crashes do not lose progress.
2. **Answering questions**
   - `select(optionId:)` records the selection, updates timers, and writes to `QuestionStudyState` with confidence, flags, or notes.
   - `QuestionStudyState.registerReview` and `updateDueDate` power spaced repetition scheduling through `StudyPlanner`.
3. **Timing**
   - `startTimer`, `handleTick`, and per-question timing maintain both aggregate (`elapsedSeconds`) and item-level (`perQuestionSeconds`) metrics for persistence.
4. **Completion**
   - `finishSession()` produces a `CompletedQuizSession`, appends it to `LocalStore`, updates study metadata, and clears the active session slot.
5. **Filters & search**
   - `QuizView` offers filters for unseen, incorrect, flagged, low-confidence, domain, difficulty, and image-only questions; search covers stems, answers, and rationales.

## Study Planning & Spaced Repetition

- `QuestionStudyState` exposes `needsReview` and `dueAt` helpers used by `StudyPlanner` to build review queues.
- `StudyPlanner.reviewQueue(limit:)` prioritizes due or flagged questions, falling back to unseen content when the review pool is empty.
- `StudyPlanner.adaptiveDrill(limit:)` mines completed sessions, computes per-module accuracy, and samples questions weighted toward weakest domains. It tops up with quick-start questions if necessary.
- `AppEnvironment` exposes convenience wrappers so UI code only needs the environment, not the planner itself.

## Persistence & Sync

- `LocalStore` writes JSON blobs to `UserDefaults`. It is the single source of truth for:
  - Downloaded modules (`downloadedModuleIDsPublisher`)
  - Active quiz session snapshots
  - Completed sessions (used by analytics, dashboard, review)
  - `QuestionStudyState` dictionary keyed by `questionID`
- `SyncManager` watches `authService.userDidChange` and schedules sync jobs (stubbed; extend to integrate Firestore).
- Reset actions (`resetPracticeProgress`) clear local store data and cancel timers.

## Leaderboards & Privacy

- Users opt in explicitly (`LeaderboardService.setOptIn`).
- `LeaderboardService.refreshSnapshot` hashes the participant ID to produce deterministic yet privacy-preserving percentile estimates per domain.
- `QuizView` and `SettingsView` surface the opt-in toggle; snapshots feed lightweight leaderboard UIs.

## Notes & Export

- `NoteEditor` (rendered from `QuizView`) lets learners author Markdown notes per question.
- Export hooks call `exportURL(for:format:)` to build Markdown, CSV, or PDF bundles as needed.
- `QuestionStudyState.noteMarkdown` persists the content alongside confidence and flags.

## Build & Testing

- Primary target: `iprep.xcodeproj` (iOS 17 SDK). Open in Xcode or run `xcodebuild -scheme iprep -destination 'platform=iOS Simulator,name=iPhone 15'`.
- Helpers:
  - `build.sh` wraps `xcodebuild` with simulator defaults.
  - `test.sh` is reserved for automated UI/unit suites once present.
- No SwiftPM or CocoaPods dependencies; all code ships in-repo.
- For linting or formatting, integrate `swift-format` or SwiftLint as desired (none configured yet).

## Assets & Resources

- Static data (`QuestionBank.json`, `RemoteConfigDefaults.plist`) live in `iprep/Resources`.
- `Assets.xcassets` houses color/theme assets referenced throughout the UI (`Color.ipBackground`, `Color.ipAccent`, etc.).
- Component styling (`Typography`, `Color+Theme`) is under `iprep/Components`.

## Extending the App

- **Adding services**: define protocol + implementation in `Services`, register them in `AppEnvironment`, and expose any derived publishers/actions required by views.
- **New features**: create a folder under `iprep/Features`, add SwiftUI views/view models, update `AppRoute` and `RootView` navigation destinations.
- **Question formats**: extend `QuizQuestion` to include new media types, update rendering helpers in `QuizView`, and adjust `QuestionBankService` parsing.
- **Testing**: wrap business logic (e.g., `StudyPlanner`, `LeaderboardService`) in unit tests under `iprepTests`. Use dependency injection already present in view models for mocking.

Refer back to this guide when onboarding new contributors or planning feature work.

```
