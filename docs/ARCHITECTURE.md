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
