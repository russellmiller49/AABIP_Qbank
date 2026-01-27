# AABIP_Qbank — gitingest (curated)

Generated: `2026-01-27T12:14:24-08:00`
Git: `unified` @ `a54124d`

## What this file is
- A **token-budget friendly** snapshot of the repo **structure** + a curated set of **important files**.
- Intended for LLM/context ingestion; excludes build artifacts and large binaries.

## Exclusions (high level)
- Directories: `.build, .dart_tool, .git, .gradle, .idea, .kotlin, .mypy_cache, .pytest_cache, .ruff_cache, .swiftpm, .venv, .vscode, Carthage, DerivedData, ModuleCache, Pods, __pycache__, build, build_result, coverage, dist, index, node_modules, xcuserdata`
- File types: `.a`, `.aar`, `.apk`, `.app`, `.bin`, `.class`, `.dSYM`, `.db`, `.dex`, `.framework`, `.gif`, `.hprof`, `.ico`, `.jar`, `.jpeg`, `.jpg`, `.klib`, `.len`, `.lock`, `.map`, `.o`, `.onnx`, `.parquet`, `.pbxuser`, `.pcm`, `.pkl`, `.plistc`, `.png`, `.pt`, `.pth`, `.pyc`, `.pyo`, `.so`, `.swiftdeps`, `.swiftmodule`, `.tar.gz`, `.timestamp`, `.xcarchive`, `.xcuserstate`, `.zip`

## Repo tree (pruned)
```
- iprep/
  - .claude/
  - androidApp/
    - androidApp/src/
      - androidApp/src/main/
        - androidApp/src/main/java/
          - androidApp/src/main/java/com/
            - androidApp/src/main/java/com/russellmiller/
        - androidApp/src/main/res/
          - androidApp/src/main/res/drawable/
          - androidApp/src/main/res/layout/
          - androidApp/src/main/res/mipmap-hdpi/
          - androidApp/src/main/res/mipmap-mdpi/
          - androidApp/src/main/res/mipmap-xhdpi/
          - androidApp/src/main/res/mipmap-xxhdpi/
          - androidApp/src/main/res/mipmap-xxxhdpi/
          - androidApp/src/main/res/values/
          - androidApp/src/main/res/xml/
  - docs/
  - gradle/
    - gradle/wrapper/
  - iosApp/
    - iosApp/appicon_images/
    - iosApp/iprep/
      - iosApp/iprep/Assets.xcassets/
        - iosApp/iprep/Assets.xcassets/AABIPLogo.imageset/
        - iosApp/iprep/Assets.xcassets/Accent.colorset/
        - iosApp/iprep/Assets.xcassets/AccentColor.colorset/
        - iosApp/iprep/Assets.xcassets/AppIcon.appiconset/
        - iosApp/iprep/Assets.xcassets/Background.colorset/
        - iosApp/iprep/Assets.xcassets/MutedAccent.colorset/
        - iosApp/iprep/Assets.xcassets/Surface.colorset/
        - iosApp/iprep/Assets.xcassets/SurfaceElevated.colorset/
      - iosApp/iprep/Components/
      - iosApp/iprep/Features/
        - iosApp/iprep/Features/Analytics/
        - iosApp/iprep/Features/Dashboard/
        - iosApp/iprep/Features/Landing/
        - iosApp/iprep/Features/Leaderboard/
        - iosApp/iprep/Features/Quiz/
        - iosApp/iprep/Features/Review/
        - iosApp/iprep/Features/Search/
        - iosApp/iprep/Features/Settings/
      - iosApp/iprep/Models/
      - iosApp/iprep/Persistence/
      - iosApp/iprep/Resources/
      - iosApp/iprep/Services/
      - iosApp/iprep/Support/
    - iosApp/iprep.xcodeproj/
      - iosApp/iprep.xcodeproj/project.xcworkspace/
        - iosApp/iprep.xcodeproj/project.xcworkspace/xcshareddata/
          - iosApp/iprep.xcodeproj/project.xcworkspace/xcshareddata/swiftpm/
            - iosApp/iprep.xcodeproj/project.xcworkspace/xcshareddata/swiftpm/configuration/
    - iosApp/iprepTests/
    - iosApp/iprepUITests/
  - iprep.xcodeproj/
    - iprep.xcodeproj/project.xcworkspace/
  - New_question_bank/
  - scripts/
  - shared/
    - shared/src/
      - shared/src/androidMain/
        - shared/src/androidMain/kotlin/
          - shared/src/androidMain/kotlin/com/
            - shared/src/androidMain/kotlin/com/russellmiller/
      - shared/src/commonMain/
        - shared/src/commonMain/kotlin/
          - shared/src/commonMain/kotlin/com/
            - shared/src/commonMain/kotlin/com/russellmiller/
          - shared/src/commonMain/kotlin/qbank/
            - shared/src/commonMain/kotlin/qbank/bridge/
        - shared/src/commonMain/resources/
      - shared/src/commonTest/
        - shared/src/commonTest/kotlin/
      - shared/src/iosMain/
        - shared/src/iosMain/kotlin/
          - shared/src/iosMain/kotlin/com/
            - shared/src/iosMain/kotlin/com/russellmiller/
```

## Important directories (not inlined)
- `shared/src/commonMain/kotlin/`
- `shared/src/commonMain/resources/`
- `androidApp/src/main/java/`
- `androidApp/src/main/res/`
- `iosApp/iprep/`
- `iosApp/iprepTests/`
- `iosApp/iprepUITests/`
- `docs/`

## Key data files (not inlined)

- `shared/src/commonMain/resources/QuestionBank.json` (534.0KB)
- `iosApp/iprep/Resources/QuestionBank.json` (809.6KB)

## Important files (inlined)

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

---
### `CURSOR_SETUP.md`
- Size: `3819` bytes
```
# AABIP Qbank - Cursor Integration Setup

## Current Status
✅ Xcode Beta installed at `/Applications/Xcode-beta.app`
✅ Command line tools installed
✅ Project structure ready
❌ Xcode developer directory needs to be switched

## Required Setup Steps

### 1. Switch Xcode Developer Directory
Run this command in your terminal (requires sudo):
```bash
sudo xcode-select --switch /Applications/Xcode-beta.app/Contents/Developer
```

### 2. Verify Setup
After switching, verify with:
```bash
xcode-select --print-path
# Should show: /Applications/Xcode-beta.app/Contents/Developer
```

### 3. Test Build
Once the developer directory is switched, test the build:
```bash
./build.sh
```

## Available Build Commands

### In Cursor Terminal:
- `./build.sh` - Run the main build script
- `./test.sh` - Run tests (unit, ui, or all)
- `xcodebuild -project iprep.xcodeproj -scheme iprep -destination 'platform=iOS Simulator,name=iPhone 15' build`

### In Cursor Tasks (Cmd+Shift+P → "Tasks: Run Task"):
- `xcode-build` - Build the project
- `xcode-clean` - Clean the project
- `build-script` - Run the build script
- `run-unit-tests` - Run unit tests only
- `run-ui-tests` - Run UI tests only
- `run-all-tests` - Run all tests

## Project Structure
```
iprep/
├── iprep.xcodeproj/          # Xcode project file
├── iprep/                    # iOS app source code
│   ├── Features/            # App features (Dashboard, Quiz, etc.)
│   ├── Services/            # Backend services
│   ├── Models/              # Data models
│   ├── Components/          # Reusable UI components
│   └── Assets.xcassets/     # App assets and icons
├── iprepTests/              # Unit tests
├── iprepUITests/            # UI tests
├── build.sh                 # Build script for Cursor
├── test.sh                  # Test runner script
└── .vscode/                 # Cursor/VS Code configuration
    ├── tasks.json          # Build and test tasks
    └── launch.json         # Launch configuration
```

## Testing

### Running Tests
The project now includes comprehensive automated testing:

#### Unit Tests
- Test core functionality (Models, Services, ViewModels)
- Test business logic and data structures
- Run with: `./test.sh unit` or Cmd+Shift+P → "run-unit-tests"

#### UI Tests
- Test user interface interactions
- Test navigation flows
- Run with: `./test.sh ui` or Cmd+Shift+P → "run-ui-tests"

#### All Tests
- Run both unit and UI tests
- Run with: `./test.sh all` or Cmd+Shift+P → "run-all-tests"

### Test Coverage
- **Models**: Module, QuizQuestion, AppRoute validation
- **Services**: FirestoreService, QuestionBankService, LocalStore
- **UI**: Dashboard navigation, Review view crash prevention
- **Crash Prevention**: Fixed Dashboard → Review navigation crash

## Troubleshooting

### If you get "no Package.swift" errors:
This is normal for iOS apps. The project uses Xcode build system, not Swift Package Manager.

### If builds fail:
1. Make sure Xcode Beta is properly installed
2. Verify the developer directory is switched correctly

### If tests fail:
1. Ensure iOS Simulator is available
2. Check that test targets are properly configured
3. Run `xcodebuild -list` to verify project structure
4. Try cleaning the project first: `xcodebuild -project iprep.xcodeproj -scheme iprep clean`

### For Cursor Integration:
- Use the build tasks in Cursor (Cmd+Shift+P → "Tasks: Run Task")
- The project is configured to work with Cursor's build system
- All necessary configuration files are in place

## Next Steps
1. Run the sudo command above to switch Xcode developer directory
2. Test the build with `./build.sh`
3. Use Cursor's task runner for automated builds
4. The project is now ready for development in Cursor!

```

---
### `settings.gradle.kts`
- Size: `286` bytes
```
pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "iprep"
include(":shared")
include(":androidApp")

```

---
### `build.gradle.kts`
- Size: `466` bytes
```
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

```

---
### `shared/build.gradle.kts`
- Size: `2374` bytes
```
plugins {
    kotlin("multiplatform")
    kotlin("plugin.serialization")
    id("com.android.library")
    id("app.cash.sqldelight")
}

kotlin {
    androidTarget {
        compilations.all {
            kotlinOptions {
                jvmTarget = "1.8"
            }
        }
    }
    
    listOf(
        iosX64(),
        iosArm64(),
        iosSimulatorArm64()
    ).forEach {
        it.binaries.framework {
            baseName = "Shared"
        }
    }

    sourceSets {
        val commonMain by getting {
            dependencies {
                implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.6.0")
                implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.7.3")
                implementation("app.cash.sqldelight:runtime:2.0.0")
                implementation("io.ktor:ktor-client-core:2.3.5")
                implementation("io.ktor:ktor-client-content-negotiation:2.3.5")
                implementation("io.ktor:ktor-serialization-kotlinx-json:2.3.5")
            }
        }
        val commonTest by getting {
            dependencies {
                implementation(kotlin("test"))
            }
        }
        val androidMain by getting {
            dependencies {
                implementation("app.cash.sqldelight:android-driver:2.0.0")
                implementation("io.ktor:ktor-client-android:2.3.5")
            }
        }
        val iosX64Main by getting
        val iosArm64Main by getting
        val iosSimulatorArm64Main by getting
        val iosMain by creating {
            dependsOn(commonMain)
            iosX64Main.dependsOn(this)
            iosArm64Main.dependsOn(this)
            iosSimulatorArm64Main.dependsOn(this)
            dependencies {
                implementation("app.cash.sqldelight:native-driver:2.0.0")
                implementation("io.ktor:ktor-client-darwin:2.3.5")
            }
        }
    }
}

sqldelight {
    databases {
        create("IprepDatabase") {
            packageName.set("com.russellmiller.iprep.shared.database")
        }
    }
}

    android {
        namespace = "com.russellmiller.iprep.shared"
        compileSdk = 34
        defaultConfig {
            minSdk = 24
        }
        compileOptions {
            sourceCompatibility = JavaVersion.VERSION_1_8
            targetCompatibility = JavaVersion.VERSION_1_8
        }
    }

```

---
### `androidApp/build.gradle.kts`
- Size: `2493` bytes
```
plugins {
    id("com.android.application")
    kotlin("android")
    kotlin("plugin.serialization")
}

android {
    namespace = "com.russellmiller.iprep"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.russellmiller.iprep"
        minSdk = 24
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        vectorDrawables {
            useSupportLibrary = true
        }
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    kotlinOptions {
        jvmTarget = "1.8"
    }
    buildFeatures {
        compose = true
    }
    composeOptions {
        kotlinCompilerExtensionVersion = "1.5.4"
    }
    packaging {
        resources {
            excludes += "/META-INF/{AL2.0,LGPL2.1}"
        }
    }
}

dependencies {
    implementation(project(":shared"))
    
    implementation("androidx.core:core-ktx:1.12.0")
    implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.7.0")
    implementation("androidx.activity:activity-compose:1.8.2")
    implementation(platform("androidx.compose:compose-bom:2023.10.01"))
    implementation("androidx.compose.ui:ui")
    implementation("androidx.compose.ui:ui-graphics")
    implementation("androidx.compose.ui:ui-tooling-preview")
    implementation("androidx.compose.material3:material3")
    implementation("androidx.compose.material:material-icons-extended")
    implementation("io.coil-kt:coil-compose:2.4.0")
    implementation("com.google.android.material:material:1.11.0")
    
    implementation("androidx.navigation:navigation-compose:2.7.5")
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.7.0")
    
    testImplementation("junit:junit:4.13.2")
    androidTestImplementation("androidx.test.ext:junit:1.1.5")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.5.1")
    androidTestImplementation(platform("androidx.compose:compose-bom:2023.10.01"))
    androidTestImplementation("androidx.compose.ui:ui-test-junit4")
    debugImplementation("androidx.compose.ui:ui-tooling")
    debugImplementation("androidx.compose.ui:ui-test-manifest")
}

```

---
### `gradle.properties`
- Size: `1849` bytes
```
# Project-wide Gradle settings.
# IDE (e.g. Android Studio) users:
# Gradle settings configured through the IDE *will override*
# any settings specified in this file.
# For more details on how to configure your build environment visit
# http://www.gradle.org/docs/current/userguide/build_environment.html
# Specifies the JVM arguments used for the daemon process.
# The setting is particularly useful for tweaking memory settings.
org.gradle.jvmargs=-Xmx2048m -Dfile.encoding=UTF-8
# When configured, Gradle will run in incubating parallel mode.
# This option should only be used with decoupled projects. More details, visit
# http://www.gradle.org/docs/current/userguide/multi_project_builds.html#sec:decoupled_projects
# org.gradle.parallel=true
# AndroidX package structure to make it clearer which packages are bundled with the
# Android operating system, and which are packaged with your app's APK
# https://developer.android.com/topic/libraries/support-library/androidx-rn
android.useAndroidX=true
# Kotlin code style for this project: "official" or "obsolete":
kotlin.code.style=official
# Enables namespacing of each library's R class so that its R class includes only the
# resources declared in the library itself and none from the library's dependencies,
# thereby reducing the size of the R class for that library
android.nonTransitiveRClass=true
# Enable Gradle Build Cache
org.gradle.caching=true
# Enable configuration cache
org.gradle.configuration-cache=true

# Disable default Kotlin hierarchy template to avoid warnings
kotlin.mpp.applyDefaultHierarchyTemplate=false

# Java toolchain configuration
# NOTE: Do NOT hardcode org.gradle.java.home here. It breaks cross-platform setups
# (e.g., WSL/Linux vs macOS). Prefer setting JAVA_HOME per-machine or using Gradle's
# toolchain configuration inside build scripts if/when needed.

```

---
### `gradle/wrapper/gradle-wrapper.properties`
- Size: `251` bytes
```
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
distributionUrl=https\://services.gradle.org/distributions/gradle-8.13-bin.zip
networkTimeout=10000
validateDistributionUrl=true
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists

```

---
### `iosApp/build.sh`
- Size: `555` bytes
```
#!/bin/bash

# Build script for AABIP Qbank iOS app
# This script helps Cursor understand how to build the project

set -e

echo "Building AABIP Qbank iOS app..."

# Check if we're in the right directory
if [ ! -d "iprep.xcodeproj" ]; then
    echo "Error: iprep.xcodeproj not found. Please run this script from the project root."
    exit 1
fi

# Build with xcodebuild
echo "Building with Xcode..."
xcodebuild -project iprep.xcodeproj -scheme iprep -destination 'platform=iOS Simulator,name=iPhone 16,OS=26.0' build

echo "Build completed successfully!"

```

---
### `iosApp/build_kmm.sh`
- Size: `389` bytes
```
#!/bin/bash

# Build KMM Shared framework before building iOS app
set -e

echo "Building KMM Shared framework..."

# Set Java 17 for Gradle
export JAVA_HOME=/opt/homebrew/opt/openjdk@17

# Navigate to project root
cd "$(dirname "$0")/.."

# Build the shared framework for iOS Simulator (arm64)
./gradlew :shared:linkDebugFrameworkIosSimulatorArm64

echo "KMM Framework built successfully!"
```

---
### `iosApp/xcode_build_phase.sh`
- Size: `1615` bytes
```
#!/bin/bash

# This script should be added as a build phase in Xcode
# It builds and embeds the KMM Shared framework

set -e

echo "Building KMM Shared framework..."

# Set Java environment
export JAVA_HOME=/opt/homebrew/opt/openjdk@17

# Navigate to project root
PROJECT_ROOT="$SRCROOT/.."
cd "$PROJECT_ROOT"

# Determine which framework to build based on platform
if [ "$PLATFORM_NAME" = "iphonesimulator" ]; then
    echo "Building for iOS Simulator..."

    # Build both architectures for simulator
    ./gradlew :shared:linkDebugFrameworkIosSimulatorArm64
    ./gradlew :shared:linkDebugFrameworkIosX64

    # Create universal framework for simulator
    mkdir -p shared/build/bin/iosSimulatorUniversal
    cp -R shared/build/bin/iosSimulatorArm64/debugFramework/Shared.framework shared/build/bin/iosSimulatorUniversal/
    lipo -create \
        shared/build/bin/iosX64/debugFramework/Shared.framework/Shared \
        shared/build/bin/iosSimulatorArm64/debugFramework/Shared.framework/Shared \
        -output shared/build/bin/iosSimulatorUniversal/Shared.framework/Shared

    FRAMEWORK_PATH="$SRCROOT/../shared/build/bin/iosSimulatorUniversal/Shared.framework"
else
    echo "Building for iOS Device..."
    ./gradlew :shared:linkDebugFrameworkIosArm64
    FRAMEWORK_PATH="$SRCROOT/../shared/build/bin/iosArm64/debugFramework/Shared.framework"
fi

echo "Framework built at: $FRAMEWORK_PATH"

# Do NOT copy or codesign into ${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}.
# Xcode's Embed Frameworks phase handles embedding/signing automatically.

echo "Framework build complete! Xcode will handle embedding."
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
