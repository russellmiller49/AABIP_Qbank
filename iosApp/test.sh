#!/bin/bash

# Test runner script for iprep Swift project
# Usage: ./test.sh [unit|ui|all]

set -e

PROJECT_NAME="iprep"
SCHEME="iprep"
DESTINATION="platform=iOS Simulator,name=iPhone 15"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}🧪 Running tests for $PROJECT_NAME${NC}"

# Function to run unit tests
run_unit_tests() {
    echo -e "${YELLOW}📱 Running unit tests...${NC}"
    xcodebuild \
        -project "$PROJECT_NAME.xcodeproj" \
        -scheme "$SCHEME" \
        -destination "$DESTINATION" \
        test \
        -only-testing:iprepTests \
        | xcpretty
}

# Function to run UI tests
run_ui_tests() {
    echo -e "${YELLOW}🖥️ Running UI tests...${NC}"
    xcodebuild \
        -project "$PROJECT_NAME.xcodeproj" \
        -scheme "$SCHEME" \
        -destination "$DESTINATION" \
        test \
        -only-testing:iprepUITests \
        | xcpretty
}

# Function to run all tests
run_all_tests() {
    echo -e "${YELLOW}🚀 Running all tests...${NC}"
    xcodebuild \
        -project "$PROJECT_NAME.xcodeproj" \
        -scheme "$SCHEME" \
        -destination "$DESTINATION" \
        test \
        | xcpretty
}

# Main logic
case "${1:-all}" in
    "unit")
        run_unit_tests
        ;;
    "ui")
        run_ui_tests
        ;;
    "all")
        run_all_tests
        ;;
    *)
        echo -e "${RED}❌ Invalid argument. Use: unit, ui, or all${NC}"
        echo "Usage: $0 [unit|ui|all]"
        exit 1
        ;;
esac

echo -e "${GREEN}✅ Tests completed!${NC}"
