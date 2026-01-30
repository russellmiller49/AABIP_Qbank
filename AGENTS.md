# AGENTS.md — IPREP Codebase Guide for AI Agents

This file orients AI agents working in the **iprep** repository: a Kotlin Multiplatform (KMP) + native UI app (Android Compose, iOS SwiftUI) for quiz/study and a “Pearl Diver” duel game, with shared business logic and assets.

---

## Repository Overview

- **Purpose**: Study/quiz app (AABIP Qbank) with analytics, study planning, leaderboards, crosswords, and a duel minigame.
- **Platforms**: Android (`androidApp/`), iOS (`iosApp/`), shared logic in Kotlin (`shared/`).
- **Stack**: Kotlin Multiplatform, Kotlin Serialization, Ktor, SQLDelight; Android Compose; iOS SwiftUI. Build: Gradle (root + `shared`, `androidApp`), Xcode for iOS.

---

## Top-Level Layout

| Path | Purpose |
|------|--------|
| `shared/` | KMP module: common + `androidMain` / `iosMain`; models, services, assets, resources. |
| `androidApp/` | Android app (Compose); depends on `shared`. |
| `iosApp/` | iOS app (SwiftUI); links Shared framework produced by `shared`. |
| `docs/` | `ARCHITECTURE.md`, `user-guide.md`. |
| `scripts/` | Python: `generate_gitingest.py`, `assets/kenney_import.py`, `assets/check_assets.py`. |
| `crossword/` | Static HTML crosswords; bundled as Android assets. |
| `New_question_bank/` | Source markdown + `QuestionBank.json` for question content. |
| `build.gradle.kts` | Root Gradle; Android + KMP plugins. |
| `Makefile` | `make assets`, `make assets-check` for shared assets. |

---

## Shared Module (`shared/`)

**Role**: Single source of truth for domain models, services, and shared assets used by both Android and iOS.

### Source sets

- **`commonMain`**: Shared Kotlin (models, services, asset registry, resources). No platform APIs.
- **`androidMain`**: Android-specific implementations (e.g. `ResourceLoader`, `AssetRegistry`, `Time`).
- **`iosMain`**: iOS-specific implementations (same concerns).
- **`commonTest`**: Shared unit tests (e.g. `DuelEngineServiceTest`).

### Key packages (under `com.russellmiller.iprep.shared`)

| Package | Contents |
|--------|----------|
| (root) | `AppEnvironment` — singleton that constructs and holds all shared services. |
| `models/` | `AppRoute`, `Module`, `QuizQuestion`, `QuizSession`, `QuestionStudyState`, `DuelModels`, `DuelPersistence`, `EnemyDefinitions`, `FeatureFlag`, etc. |
| `services/` | `QuestionBankService`, `QuizSessionService`, `StudyPlannerService`, `FeatureFlagsService`, `DuelQuestionBankService`, `DuelEngineService`, `ResourceLoader`, `DuelResourceLoader`. |
| `assets/` | `AssetRegistry` (common API); platform impls in `AssetRegistry.android.kt` / `AssetRegistry.ios.kt`. |
| `util/` | `Time` (platform-specific `currentTimeMillis()`). |

### How apps get shared state

- **Android**: `AppEnvironment.shared` (Kotlin) or `com.russellmiller.iprep.shared.AppEnvironment.getInstance()`; Compose screens use it for quiz, duel, and study data.
- **iOS**: Swift wraps the Shared framework (e.g. `Shared.AppEnvironment.shared`); `AppEnvironment.swift` and view models use it for the same services and models.

When editing features (quiz, duel, study planner, etc.), prefer changing **shared** first (models + services), then adapt **androidApp** and **iosApp** UI and platform wiring.

---

## Shared Assets and Resources

### 1. Shared KMP resources (`shared/src/commonMain/resources/`)

- **`QuestionBank.json`**  
  Main question bank. Loaded at runtime via:
  - Android: `ResourceLoader.android.kt` → `context.assets.open("QuestionBank.json")`.
  - iOS: `ResourceLoader.ios.kt` → `NSBundle.mainBundle.pathForResource("QuestionBank", "json")`.  
  The shared module expects this path/name; do not rename without updating both loaders.

- **`assets/`**  
  Shared game/UI assets (duel and quiz UI):
  - **`manifest/assets_manifest.json`** — manifest listing all shared assets (id, path, category). Used by `AssetRegistry` to resolve assets by id.
  - **`assets/bg/`** — backgrounds (e.g. `bg_arena_clinic_01.png`).
  - **`assets/chars/`** — characters (hero, enemies).
  - **`assets/icons/`** — status/buff icons (correct, wrong, streak, shield, heal).
  - **`assets/ui/`** — buttons, panels, HP frame/fill.
  - **`assets/vfx/`** — hit/heal effects.
  - **`assets/sfx/`** — UI sounds (tap, correct, wrong) in `.ogg`.

Adding a new shared asset: add the file under `shared/src/commonMain/resources/assets/` and either:
- extend `assets_manifest.json` and the asset plan (see below), or  
- follow the existing convention (category subdir + manifest entry) so `AssetRegistry` keeps working.

### 2. Asset pipeline (Kenney assets)

- **Config**: `scripts/assets/asset_plan.yml` — defines which Kenney assets to import and where they go.
- **Output root**: `shared/src/commonMain/resources/assets` (and manifest under `assets/manifest/`).
- **Commands**:
  - `make assets` → runs `scripts/assets/kenney_import.py` (reads `asset_plan.yml`, copies files, updates manifest).
  - `make assets-check` → runs `scripts/assets/check_assets.py` (ensures manifest and files are in sync).
- **Manifest**: `shared/src/commonMain/resources/assets/manifest/assets_manifest.json` is the source of truth for the shared AssetRegistry; edit via the asset plan and `make assets` when possible.

When adding or renaming shared art/sound, update `asset_plan.yml` and run `make assets` so the manifest and files stay aligned.

### 3. Platform-specific asset locations

- **Android** (`androidApp/`):
  - **`src/main/assets/`** — app-owned assets. Contains **`pearl_diver_cards.json`** (duel card data). Duel loader on Android uses `context.assets.open("pearl_diver_cards.json")`.
  - **Build**: `androidApp/build.gradle.kts` sets `assets.srcDirs("src/main/assets", "../crossword", "../shared/src/commonMain/resources")`, so the shared resources and crosswords are on the classpath as assets.
- **iOS**:
  - Duel cards: `pearl_diver_cards.json` is expected in the app bundle (e.g. copied from a path like `NSBundle.mainBundle.pathForResource("pearl_diver_cards", "json")` in `DuelResourceLoader.ios.kt`). Ensure the iOS target copies this file into the bundle.
  - Shared framework built from `shared/` embeds `shared/src/commonMain/resources` (including `QuestionBank.json` and `assets/`) so iOS can load them via the Shared bundle or main bundle as configured.

### 4. Summary table

| Asset / resource | Location | Consumed by |
|------------------|----------|-------------|
| Question bank | `shared/src/commonMain/resources/QuestionBank.json` | `ResourceLoader` (shared); Android + iOS |
| Duel cards | Android: `androidApp/src/main/assets/pearl_diver_cards.json`; iOS: bundle (e.g. same file in app target) | `DuelResourceLoader` (shared); Android + iOS |
| Shared art/sfx/manifest | `shared/src/commonMain/resources/assets/` | `AssetRegistry` + platform loaders; Android + iOS |
| Crossword HTML | `crossword/*.html` | Android assets dir (included via `build.gradle.kts`) |
| Kenney source | External zips; see `scripts/assets/asset_plan.yml` | Input to `make assets` only |

---

## Conventions for Agents

1. **Shared-first**: New domain logic, models, and service APIs belong in `shared` (appropriate source set). Keep UI and platform glue in `androidApp` and `iosApp`.
2. **Assets**: Shared game/UI assets live under `shared/.../resources/assets/` and are listed in `assets_manifest.json`. Use `scripts/assets/asset_plan.yml` and `make assets` to add/change them.
3. **Question bank**: Edit `QuestionBank.json` or the pipeline that produces it (e.g. `New_question_bank/`); loading contract is `QuestionBank.json` for main bank, `pearl_diver_cards.json` for duel cards on each platform.
4. **Naming**: Shared package is `com.russellmiller.iprep.shared`; Android app is `com.russellmiller.iprep`; iOS uses the Shared framework and Swift mirrors of routes/models where needed.
5. **Docs**: High-level architecture and feature flow: `docs/ARCHITECTURE.md`. User-facing instructions: `docs/user-guide.md`. Gitingest/manifest for LLM context: `gitingest_details.md` (generated by `scripts/generate_gitingest.py`).

---

## Build and Tasks

- **Android**: `./gradlew :androidApp:assembleDebug` (or assembleRelease). Requires JDK and Android SDK.
- **iOS**: Xcode project under `iosApp/`; build the app target; Shared framework is built by Gradle (e.g. `./gradlew :shared:linkReleaseFrameworkIos*`) or by the IDE when configured.
- **Shared only**: `./gradlew :shared:compileKotlinIos*` / `:shared:compileDebugKotlinAndroid`.
- **Assets**: `make assets` (import Kenney assets), `make assets-check` (validate).
- **Gitingest**: `python3 scripts/generate_gitingest.py` (optional: `--details --details-output gitingest_details.md`).

---

## References

- **Architecture**: `docs/ARCHITECTURE.md`
- **Cursor / Xcode**: `CURSOR_SETUP.md`
- **Gitingest manifest**: `gitingest_details.md` (generated)
- **Asset plan**: `scripts/assets/asset_plan.yml`
- **Shared asset manifest**: `shared/src/commonMain/resources/assets/manifest/assets_manifest.json`
