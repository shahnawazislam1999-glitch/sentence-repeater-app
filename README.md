# Ultimate Sentence Repeater — Vite + Capacitor Android

This package wraps the supplied `index.html` as an Android app using **Vite + Capacitor**.

## No Android Studio needed on your computer

The repository is intentionally set up so the **GitHub Actions runner** creates the Android project during the build. You only need to upload/push this folder to GitHub.

### Build the APK

1. Create a new GitHub repository.
2. Upload all files from this folder to the repository.
3. Push to `main` (or `master`), or open **Actions → Build Android APK → Run workflow**.
4. Wait for the workflow to finish.
5. Open the completed workflow run and download the artifact named **ultimate-sentence-repeater-debug-apk**.
6. Extract the artifact and install `app-debug.apk` on Android.

No Android Studio is required locally.

## Stack

- Vite 8.2.2
- Capacitor 8.5.1 (CLI/Core/Android)
- Node.js 22.21.1 in CI
- JDK 21 in CI
- Android SDK 36 / Build Tools 36.0.0 in CI
- Capacitor's generated Android project is used as the native shell.

The Android project is not committed because the workflow can regenerate it from the pinned Capacitor packages. This keeps the repository smaller and avoids committing generated native files.

## Important: large local videos

The supplied app already uses IndexedDB for persistent video/SRT data. The wrapper does not replace that storage layer; the web app is copied into the Capacitor WebView as-is. The source contains its own IndexedDB persistence logic for media and localStorage settings.

## Custom icon

A custom blue play/repeat/sound-wave launcher icon is included in `public/` and is copied into the generated Android resources by `scripts/apply-android-icon.sh`. The default Capacitor launcher artwork is not used.

## Updating dependencies

Versions are deliberately pinned rather than using `latest` or `+` ranges. When upgrading, test the whole Capacitor/Android toolchain together.
