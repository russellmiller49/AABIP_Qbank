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
- `xcodebuild -project iprep.xcodeproj -scheme iprep -destination 'platform=iOS Simulator,name=iPhone 15' build`

### In Cursor Tasks (Cmd+Shift+P → "Tasks: Run Task"):
- `xcode-build` - Build the project
- `xcode-clean` - Clean the project
- `build-script` - Run the build script

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
├── build.sh                 # Build script for Cursor
└── .vscode/                 # Cursor/VS Code configuration
    ├── tasks.json          # Build tasks
    └── launch.json         # Launch configuration
```

## Troubleshooting

### If you get "no Package.swift" errors:
This is normal for iOS apps. The project uses Xcode build system, not Swift Package Manager.

### If builds fail:
1. Make sure Xcode Beta is properly installed
2. Verify the developer directory is switched correctly
3. Try cleaning the project first: `xcodebuild -project iprep.xcodeproj -scheme iprep clean`

### For Cursor Integration:
- Use the build tasks in Cursor (Cmd+Shift+P → "Tasks: Run Task")
- The project is configured to work with Cursor's build system
- All necessary configuration files are in place

## Next Steps
1. Run the sudo command above to switch Xcode developer directory
2. Test the build with `./build.sh`
3. Use Cursor's task runner for automated builds
4. The project is now ready for development in Cursor!
