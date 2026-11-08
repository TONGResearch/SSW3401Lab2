# SSW3401 Lab 2 — Understanding the Basics of Flutter GUI

This Flutter Android app follows the course video's GUI milestones through
the image display shown around **03:03:00**. It includes a four-item bottom
navigation bar, a home header, shared text styles, and a local image displayed
with `AssetImage`.

## Run

1. Open this folder as a Flutter project in Android Studio.
2. Start an Android emulator or connect an Android phone.
3. Run `flutter pub get`, then `flutter run`.
4. Tap Home, Search, Tickets, and Profile to check the navigation. Return to
   Home to see the image at the top right of the greeting.

## How it works

- `lib/main.dart` starts the app and provides `MaterialApp`.
- `lib/screens/app_shell.dart` holds the selected tab in a `StatefulWidget`;
  `setState` updates the selected page and bottom navigation icon.
- The three other tabs are intentionally simple placeholder pages, matching the
  stage reached in the video rather than adding later course features.
- `lib/screens/home_screen.dart` uses `Row`, `Column`, `Padding`, `SizedBox`, and
  `Container` to reproduce the demonstrated layout.
- `lib/styles/app_styles.dart` holds the reusable text styles.
- `assets/images/logo.png` is a locally created image inspired by the video's
  small travel logo. It is registered in `pubspec.yaml` and loaded with
  `AssetImage`. The original course asset was unavailable.

Reference video: [Flutter Course for Absolute Beginners](https://www.youtube.com/watch?v=DsTMhjaRQws).
