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
