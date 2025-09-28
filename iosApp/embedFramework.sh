#!/bin/bash

# This script builds and embeds the KMM Shared framework into the iOS app

set -ev

# Set Java environment for Gradle
export JAVA_HOME=/opt/homebrew/opt/openjdk@17

# Navigate to project root
cd "$SRCROOT/.."

# Build the framework based on configuration
if [ "$CONFIGURATION" = "Debug" ]; then
    echo "Building Debug framework for $PLATFORM_NAME"

    if [ "$PLATFORM_NAME" = "iphonesimulator" ]; then
        if [ "$ARCHS" = "arm64" ]; then
            ./gradlew :shared:linkDebugFrameworkIosSimulatorArm64
            FRAMEWORK_PATH="shared/build/bin/iosSimulatorArm64/debugFramework/Shared.framework"
        else
            ./gradlew :shared:linkDebugFrameworkIosX64
            FRAMEWORK_PATH="shared/build/bin/iosX64/debugFramework/Shared.framework"
        fi
    else
        ./gradlew :shared:linkDebugFrameworkIosArm64
        FRAMEWORK_PATH="shared/build/bin/iosArm64/debugFramework/Shared.framework"
    fi
else
    echo "Building Release framework for $PLATFORM_NAME"

    if [ "$PLATFORM_NAME" = "iphonesimulator" ]; then
        if [ "$ARCHS" = "arm64" ]; then
            ./gradlew :shared:linkReleaseFrameworkIosSimulatorArm64
            FRAMEWORK_PATH="shared/build/bin/iosSimulatorArm64/releaseFramework/Shared.framework"
        else
            ./gradlew :shared:linkReleaseFrameworkIosX64
            FRAMEWORK_PATH="shared/build/bin/iosX64/releaseFramework/Shared.framework"
        fi
    else
        ./gradlew :shared:linkReleaseFrameworkIosArm64
        FRAMEWORK_PATH="shared/build/bin/iosArm64/releaseFramework/Shared.framework"
    fi
fi

# Create Frameworks directory in app bundle if it doesn't exist
mkdir -p "$BUILT_PRODUCTS_DIR/$FRAMEWORKS_FOLDER_PATH"

# Copy the framework to the app bundle
echo "Copying framework from $FRAMEWORK_PATH to $BUILT_PRODUCTS_DIR/$FRAMEWORKS_FOLDER_PATH"
cp -R "$FRAMEWORK_PATH" "$BUILT_PRODUCTS_DIR/$FRAMEWORKS_FOLDER_PATH/"

# Sign the framework if needed
if [ "$EXPANDED_CODE_SIGN_IDENTITY" != "" ]; then
    /usr/bin/codesign --force --sign "$EXPANDED_CODE_SIGN_IDENTITY" --timestamp=none --preserve-metadata=identifier,entitlements "$BUILT_PRODUCTS_DIR/$FRAMEWORKS_FOLDER_PATH/Shared.framework"
fi