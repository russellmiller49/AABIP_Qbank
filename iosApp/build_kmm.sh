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