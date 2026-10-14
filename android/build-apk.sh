#!/usr/bin/env bash
# Convenience local build. The primary build path is CI:
#   .github/workflows/build-apk.yml  (debug APK artifact on every push to main)
#
# Usage:
#   ./build-apk.sh
#   ./build-apk.sh -PserverUrl=https://app.example -PappName="My App"
set -euo pipefail
cd "$(dirname "$0")"
gradle assembleDebug --no-daemon "$@"
echo "APK: $(pwd)/app/build/outputs/apk/debug/app-debug.apk"
