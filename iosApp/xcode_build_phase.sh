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