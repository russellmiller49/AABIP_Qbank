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
xcodebuild -project iprep.xcodeproj -scheme iprep -destination 'platform=iOS Simulator,name=iPhone 15' build

echo "Build completed successfully!"
