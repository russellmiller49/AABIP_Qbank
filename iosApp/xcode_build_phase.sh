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

# Determine which framework to build based on platform/configuration
BUILD_TYPE="Debug"
if [ "$CONFIGURATION" = "Release" ]; then
    BUILD_TYPE="Release"
fi
FRAMEWORK_VARIANT="$(echo "$BUILD_TYPE" | tr '[:upper:]' '[:lower:]')Framework"

DEST_ROOT="$PROJECT_ROOT/shared/build/bin/xcode"
DEST_FRAMEWORK="$DEST_ROOT/Shared.framework"

rm -rf "$DEST_FRAMEWORK"
mkdir -p "$DEST_ROOT"

if [ "$PLATFORM_NAME" = "iphonesimulator" ]; then
    echo "Building for iOS Simulator..."

    # Build both architectures for simulator
    ./gradlew ":shared:link${BUILD_TYPE}FrameworkIosSimulatorArm64"
    ./gradlew ":shared:link${BUILD_TYPE}FrameworkIosX64"

    # Create universal framework for simulator at a stable path
    cp -R "shared/build/bin/iosSimulatorArm64/${FRAMEWORK_VARIANT}/Shared.framework" "$DEST_FRAMEWORK"
    lipo -create \
        "shared/build/bin/iosX64/${FRAMEWORK_VARIANT}/Shared.framework/Shared" \
        "shared/build/bin/iosSimulatorArm64/${FRAMEWORK_VARIANT}/Shared.framework/Shared" \
        -output "$DEST_FRAMEWORK/Shared"

    DSYM_SOURCE="shared/build/bin/iosSimulatorArm64/${FRAMEWORK_VARIANT}/Shared.framework.dSYM"
else
    echo "Building for iOS Device..."
    ./gradlew ":shared:link${BUILD_TYPE}FrameworkIosArm64"
    cp -R "shared/build/bin/iosArm64/${FRAMEWORK_VARIANT}/Shared.framework" "$DEST_FRAMEWORK"
    DSYM_SOURCE="shared/build/bin/iosArm64/${FRAMEWORK_VARIANT}/Shared.framework.dSYM"
fi

FRAMEWORK_PATH="$DEST_FRAMEWORK"
echo "Framework built at: $FRAMEWORK_PATH"

# Copy dSYM into the build output so Archive validation can find it.
# Temporarily disable exit-on-error for this section since sandbox may prevent deletion
set +e
if [ -d "$DSYM_SOURCE" ] && [ -n "$DWARF_DSYM_FOLDER_PATH" ]; then
    mkdir -p "$DWARF_DSYM_FOLDER_PATH"
    DSYM_DEST="$DWARF_DSYM_FOLDER_PATH/Shared.framework.dSYM"
    # Try to remove existing dSYM, but don't fail if sandbox prevents it
    rm -rf "$DSYM_DEST" 2>/dev/null || true
    # Use ditto (macOS tool) which handles sandbox restrictions better than cp
    # ditto will overwrite existing files and handles permissions gracefully
    if ditto "$DSYM_SOURCE" "$DSYM_DEST" 2>/dev/null; then
        echo "Copied dSYM to: $DSYM_DEST"
    else
        # Fallback to cp if ditto fails
        cp -R "$DSYM_SOURCE" "$DWARF_DSYM_FOLDER_PATH/" 2>/dev/null && \
            echo "Copied dSYM to: $DSYM_DEST" || \
            echo "Warning: Could not copy dSYM (sandbox restriction), but build will continue"
    fi
else
    echo "No dSYM found at: $DSYM_SOURCE (or DWARF_DSYM_FOLDER_PATH not set)"
fi
# Re-enable exit-on-error for the rest of the script
set -e

# Do NOT copy or codesign into ${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}.
# Xcode's Embed Frameworks phase handles embedding/signing automatically.

echo "Framework build complete! Xcode will handle embedding."
