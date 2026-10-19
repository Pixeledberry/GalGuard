# GalGuard (Android) v2.0
1. Install Android Studio (Koala or newer). File > Open > select this folder and let Gradle sync.
2. Run on a phone with USB debugging on, or build an installable file: Build > Build APK(s). Copy app/build/outputs/apk/debug/app-debug.apk to your phone and open it.
Scanning uses Google built-in scanner; if it cannot start, the app falls back to an in-app camera view (asks for camera permission). Product data needs internet.
The app UI lives in app/src/main/assets/galguard.html, the same file as the web version.

New in 2.0: Export Settings and Import Settings buttons (export uses the Android share sheet; import uses pasted backup text), ingredients starting with "vegan" are no longer flagged, and the missing app/build.gradle.kts build file was restored.
