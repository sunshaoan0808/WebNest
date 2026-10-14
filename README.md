# WebNest

A minimal Android WebView shell. It wraps a remote web app into a lightweight, installable APK — no browser chrome, no rewriting the app as native code.

## Features

- Full-screen WebView with JavaScript, DOM storage and cookies enabled
- Media autoplay (no extra tap required) — suits audio-rich web apps
- File upload support (image / document chooser)
- Downloads handled by the system Download Manager
- External links open in the default browser
- System back button navigates WebView history
- Third-party cookies accepted (required by some login flows)
- Dark system chrome, edge-to-edge with display-cutout support

## Configuration (build time)

| Gradle property | GitHub Actions secret | Default |
| --- | --- | --- |
| `serverUrl` | `START_URL` | `https://example.com` |
| `appName` | `APP_NAME` | `WebNest` |

The target URL and display name are supplied at build time (Gradle properties or repository
secrets in CI), so nothing app-specific is committed to this repository.

Example: a workflow on `push` builds the debug APK with `START_URL` / `APP_NAME`
repository secrets applied, and uploads it as the `webnest-debug-apk` artifact.

## Building locally

Requires JDK 17 and an Android SDK (`ANDROID_HOME`).

```bash
cd android
./gradlew assembleDebug -PserverUrl=https://your-app.example -PappName="Your App"
# APK: android/app/build/outputs/apk/debug/app-debug.apk
```

Or use the convenience script:

```bash
./android/build-apk.sh -PserverUrl=https://your-app.example -PappName="Your App"
```

## Notes

- Debug APKs are signed with the standard Android debug key.
- `minSdk 24`, `targetSdk 34`, no third-party runtime dependencies.
- HTTPS only by default (`usesCleartextTraffic=false`, mixed content blocked).

## License

MIT
