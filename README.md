# iTeacher

Online course application built with Flutter. It provides authentication, chat and chatbot, course management, payments, profiles for students and teachers, settings, theming, localization (AR/EN), media playback/recording, and YouTube integration.

## Table of Contents
- Prerequisites
- Project Overview
- Tech Stack
- Getting Started
- Running the App
- Build and Release
- Code Generation
- Localization (l10n)
- Theming
- Firebase & Services Setup
- Payments
- Project Structure
- Useful Scripts
- Troubleshooting

## Prerequisites
- Flutter SDK (stable) and Dart SDK constraint: `>=3.1.0 <4.0.0`
- Xcode (for iOS/macOS), Android Studio (for Android), or suitable toolchains for Windows/Linux
- Firebase project (Android `google-services.json` already present, iOS `GoogleService-Info.plist` expected if targeting iOS)

## Project Overview
- Name: `iteacher`
- Version: `3.0.0+1`
- Entry point: `lib/main.dart`
- Splash: `flutter_native_splash`
- Icons: `flutter_launcher_icons`
- Assets: `assets/images/icons/`
- Fonts: `Pacifico` (see `assets/fonts/Pacifico-Regular.ttf`)

## Tech Stack
- State management: `bloc`, `flutter_bloc`, `provider`, `equatable`
- Routing: `go_router`
- Networking: `dio`, `http`, `pretty_dio_logger`
- Firebase: `firebase_core`, `firebase_auth`, `cloud_firestore`
- Storage & device: `path_provider`, `shared_preferences`, `permission_handler`, `device_info_plus`
- UI/UX: `cached_network_image`, `font_awesome_flutter`, `loading_animation_widget`, `settings_ui`, `webview_flutter`, `youtube_player_flutter`, `google_mobile_ads`, `flutter_screenutil`, `fluttertoast`
- Media: `just_audio`, `audioplayers`, `record`, `image_picker`
- i18n: `flutter_localization`, `intl`, `syncfusion_localizations`
- Codegen/Models: `freezed`, `freezed_annotation`, `json_annotation`, `build_runner`, `json_serializable`, `auto_mappr`

## Getting Started
1) Clone the repo
```bash
git clone <your-repo-url>
cd iteacher
```
2) Install Flutter dependencies
```bash
flutter pub get
```
3) Configure Firebase
- Android: `android/app/google-services.json` exists (verify it matches your Firebase project)
- iOS: add `ios/Runner/GoogleService-Info.plist` (if building for iOS)
- Web: update `web/index.html` if using Firebase Web SDKs (not currently configured)

4) Generate code (models, freezed, json)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Running the App
```bash
# Choose one of the following depending on your platform/device
flutter run -d android
flutter run -d ios
flutter run -d chrome
flutter run -d windows
flutter run -d macos
flutter run -d linux
```

## Build and Release
```bash
# Android APK/AAB
flutter build apk --release
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# Windows / macOS / Linux
flutter build windows --release
flutter build macos --release
flutter build linux --release
```

## Code Generation
This project uses `freezed`, `json_serializable`, and `auto_mappr`.
Common commands:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run build_runner watch --delete-conflicting-outputs
```

## Localization (l10n)
- ARB files: `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb`
- Generated files: `lib/generated/*` and `lib/l10n.dart` (exports `generated/app_localizations.dart`)
- Add new keys to ARB files and re-run code generation.

## Theming
- Light/Dark themes in `lib/core/theme/theme_data/`
- Color palettes in `lib/core/theme/app_colors/`

## Firebase & Services Setup
- Initialize in `lib/main.dart` via `AppInitializer().init()` and splash handling
- Firebase packages: `firebase_core`, `firebase_auth`, `cloud_firestore`
- Notifications: `flutter_local_notifications`
- Deep links and URLs: `url_launcher`

## Payments
- External payment providers supported (staging endpoints included):
  - Fawaterk: auth and invoice endpoints in `AppUrls`
  - Paymob: auth endpoint in `AppUrls`
- Update production credentials and endpoints before release.

## Project Structure
```
lib/
  core/
    enums/
    exceptions/
    extentions/
    models/
    services/
    theme/
    utils/
    widgets/
  features/
    auth/
    chat/
    chatbot/
    course/
    payment/
    register_student/
    register_teacher/
    settings/
    student_profile/
    teacher_profile/
    terms_and_conditions/
  l10n.dart
  main.dart
```

### Key Feature Modules
- Auth: login/register/reset password flows
- Chat: real-time chat and a chatbot module
- Course: course listing, details, and consumption
- Profiles: student and teacher profiles
- Payments: Fawaterk/Paymob integration scaffolding
- Settings: localization, theme, and preferences

## Useful Scripts
- Splash: configured via `flutter_native_splash` (see `pubspec.yaml`)
- Launcher icons: `flutter_launcher_icons`
```bash
flutter pub run flutter_native_splash:create
flutter pub run flutter_launcher_icons
```

## Social & Useful URLs
Defined in `lib/core/utils/constants/app_urls.dart`:
- Facebook: https://www.facebook.com/amir.elahzan.50364
- YouTube: https://www.youtube.com/channel/UC8GHCBtuDX2sIvC21_cXzcA
- LinkedIn: https://www.linkedin.com/in/yousef-eljoker
- GitHub: https://github.com/yousefmohamed6
- Fawaterk: https://fawaterk.com

## Troubleshooting
- Run `flutter doctor -v` and fix any reported issues
- If codegen types are missing, re-run build_runner with `--delete-conflicting-outputs`
- Ensure platform configs (Android/iOS/Web/desktop) are set up before building


