<div align="center">

<img src="https://raw.githubusercontent.com/RukshanAmodya/Flutter-Template/main/assets/icon.png" width="100" height="100" alt="Flutter Template Logo" />

# 🚀 Flutter Universal Template

**A production-ready, fully modular Flutter starter kit — built to scale.**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Unity Ads](https://img.shields.io/badge/Unity_Ads-0.4.0-000000?style=for-the-badge&logo=unity&logoColor=white)](https://pub.dev/packages/unity_ads_plugin)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-blueviolet?style=for-the-badge)](https://github.com/RukshanAmodya/Flutter-Template)

*Stop starting from scratch. Clone, customize, and ship.* ⚡

</div>

---

## ✨ Overview

**Flutter Universal Template** is a comprehensive, production-grade Flutter starter kit that eliminates boilerplate setup time. It ships with 15+ pre-built screens, a modular widget library, Unity Ads integration, a clean theme system, and a developer testing catalog — all wired together and ready to run.

Whether you're building a social app, e-commerce platform, or SaaS tool — this template gives you the foundation in minutes, not weeks.

---

## 📱 Screens Included

### 🔐 Authentication & Onboarding
| Screen | Description |
|---|---|
| **Splash Screen** | Animated branding screen with fade-in effect |
| **Onboarding** | 3-slide swipe walkthrough for new users |
| **Login** | Email + password form with validation |
| **Register** | Account creation with form validation |
| **Forgot Password** | OTP / reset link recovery flow |

### 🧭 Core Navigation & Views
| Screen | Description |
|---|---|
| **Main Shell** | Bottom navigation bar with 4 tabs (Home, Feed, Alerts, Profile) |
| **Home / Dashboard** | Featured cards, quick actions, recent activity, banner ad |
| **Feed / List** | Scrollable item list with cards |
| **Detail View** | Full item detail page with rich layout |

### 👤 Profile & Settings
| Screen | Description |
|---|---|
| **Profile Screen** | User avatar, stats, and info display |
| **Edit Profile** | Editable form for user details |
| **Settings** | Theme, notifications, account preferences |

### 🛠️ Utility & Support
| Screen | Description |
|---|---|
| **Search** | Search bar with filter chips |
| **Notifications** | Activity and alert list |
| **Support & FAQ** | Help center with expandable Q&A |
| **Legal & Privacy** | Terms of service and privacy policy |

### ⚠️ System Fallbacks
| Screen | Description |
|---|---|
| **Empty State** | Customizable no-data placeholder |
| **No Internet** | Offline detection with retry action |
| **Server Error** | 500/server error fallback view |

---

## 🏗️ Project Structure

```
lib/
├── main.dart                        # App entry point → SplashScreen
│
├── core/
│   ├── theme/
│   │   └── app_theme.dart           # Light & Dark theme definitions
│   └── utils/
│       └── app_toast.dart           # Global toast/snackbar utility
│
├── services/
│   └── ad_service.dart              # Unity Ads singleton manager
│
├── screens/
│   ├── main_wrapper.dart            # Bottom nav shell
│   ├── test_screen.dart             # 🧪 Developer catalog hub
│   ├── auth/
│   │   ├── splash_screen.dart
│   │   ├── onboarding_screen.dart
│   │   ├── login_screen.dart
│   │   ├── register_screen.dart
│   │   └── forgot_password_screen.dart
│   ├── home/
│   │   └── home_screen.dart
│   ├── feed/
│   │   ├── feed_screen.dart
│   │   └── detail_screen.dart
│   ├── profile/
│   │   ├── profile_screen.dart
│   │   └── edit_profile_screen.dart
│   ├── settings/
│   │   └── settings_screen.dart
│   ├── utility/
│   │   ├── search_screen.dart
│   │   └── notifications_screen.dart
│   ├── support/
│   │   ├── support_screen.dart
│   │   └── legal_screen.dart
│   └── state/
│       ├── empty_state_screen.dart
│       └── error_offline_screen.dart
│
└── widgets/
    ├── app_loader.dart              # Full-screen loading overlay
    ├── custom_button.dart           # Reusable button variants
    ├── custom_textfield.dart        # Styled text input widget
    ├── status_views.dart            # Empty / Error / Offline views
    └── unity_ads/
        ├── unity_banner_ad_widget.dart       # Banner ad (inline or bottom)
        ├── unity_interstitial_ad_button.dart # Interstitial trigger button
        └── unity_rewarded_ad_button.dart     # Rewarded video button
```

---

## 🎮 Unity Ads Integration

Full Unity Ads SDK integration with a **Singleton `AdService`** — call ads from anywhere in the app.

### Setup

1. Replace your **Game ID** in `lib/services/ad_service.dart`:

```dart
static const String _gameId = 'YOUR_UNITY_GAME_ID';
```

2. Update your **Placement IDs** if customized in Unity Dashboard:

```dart
static const String interstitialId = 'Interstitial_Android';
static const String rewardedId     = 'Rewarded_Android';
static const String bannerId       = 'Banner_Android';
```

3. `AdService` is initialized in `main.dart` automatically — no extra setup needed.

### Usage Examples

```dart
// Banner Ad — drop into any screen
UnityBannerAdWidget(isInline: true)

// Interstitial Ad — trigger with a button
UnityInterstitialAdButton(
  text: 'Continue',
  onAction: () {
    // runs after ad completes
  },
)

// Rewarded Ad — give user a reward
UnityRewardedAdButton(
  onRewardEarned: () {
    // grant reward here
  },
)
```

### Premium User Support

```dart
// Disable ads for premium users
AdService().setPremiumStatus(true);
```

---

## 🎨 Theme System

Supports **Light & Dark mode** out of the box via `AppTheme`.

```dart
MaterialApp(
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  themeMode: ThemeMode.system, // follows device setting
)
```

Customize colors, typography, and component defaults in:
`lib/core/theme/app_theme.dart`

---

## 📦 Dependencies

| Package | Version | Purpose |
|---|---|---|
| `dio` | `^5.10.0` | HTTP client for API calls |
| `shared_preferences` | `^2.5.5` | Local key-value storage |
| `flutter_secure_storage` | `^10.3.1` | Secure encrypted storage |
| `unity_ads_plugin` | `^0.4.0` | Unity Ads monetization |
| `cupertino_icons` | `^1.0.8` | iOS-style icon set |

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `^3.12.2`
- Dart SDK `^3.x`
- Android Studio / VS Code
- Unity Ads account (for ads)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/RukshanAmodya/Flutter-Template.git
cd Flutter-Template

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

### App Entry Flow

```
SplashScreen (3s animated)
   └─▶ OnboardingScreen (swipe slides)
         └─▶ LoginScreen
               └─▶ MainWrapper (Home | Feed | Alerts | Profile)
```

---

## 🧪 Developer Catalog (TestScreen)

The template ships with a built-in **developer catalog** that lets you preview every screen and component instantly — without going through the full auth flow.

To access it, temporarily change `main.dart`:

```dart
// Change:
home: const SplashScreen(),

// To:
home: const TestScreen(),
```

The catalog includes live navigation to all 15+ screens and all 3 Unity Ad components.

---

## 🔧 Customization Checklist

When using this template for a new project, update:

- [ ] App name in `pubspec.yaml` → `name:`
- [ ] App title in `main.dart` → `title:`
- [ ] Unity Game ID in `ad_service.dart` → `_gameId`
- [ ] Brand colors in `app_theme.dart`
- [ ] Onboarding content in `onboarding_screen.dart`
- [ ] Splash logo/icon in `splash_screen.dart`
- [ ] App icon via `flutter_launcher_icons` or Android/iOS asset folders

---

## 📁 Android Configuration

- **Min SDK**: 21 (Android 5.0+)
- **Target SDK**: 35
- **Java Version**: 17
- **Kotlin JVM Target**: 17
- **Gradle**: Compatible with Unity Ads `0.4.0`

> JVM 17 is configured across all subprojects in `android/build.gradle.kts` to prevent Unity Ads Kotlin/Java compatibility build failures.

---

## 🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you'd like to change.

---

## 📄 License

This project is licensed under the **MIT License** — free to use for personal and commercial projects.

---

<div align="center">

Made with ❤️ by [Rukshan Amodya](https://github.com/RukshanAmodya)

⭐ **Star this repo** if it saved you time!

</div>
