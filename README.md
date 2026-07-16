# 🚀 Flutter Premium Project Template

A highly optimized, feature-rich, and professionally structured Flutter boilerplate designed to accelerate mobile app development. Built on modern Flutter standards, implementing clean architecture principles, state-of-the-art styling, and robust network configurations.

---

## 🌟 Key Features

*   **⚡ Premium Custom Widgets**: Bounce-animated tap buttons, validation-ready textfields with toggles, custom canvas-drawn loading spinners, and error/empty/no-connection layout views.
*   **🛠️ Preconfigured Services**: Dio HTTP wrapper with interceptors (authorization tokens injection, request/response logging) and local key-value SharedPreferences manager.
*   **🎨 Premium Material 3 Design**: Fully configured Light & Dark themes with modern Indigo-Rose palettes, gradients, custom app bar themes, and custom input fields.
*   **📱 Smart Initial Flow**: Animated splash route checking local storage session states to redirect between Onboarding slides and main tabs automatically.
*   **🧩 Rich Helpers**: Functional context extensions (`showSnackBar`, dimensions) and regex validations (email, passwords, phone numbers).

---

## 📂 Project Structure

```text
lib/
├── core/
│   ├── constants/       # App color palettes, asset paths, and string keys
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   └── app_assets.dart
│   ├── theme/           # App themes (Light / Dark)
│   │   └── app_theme.dart
│   └── utils/           # Extension methods and regex validators
│       ├── extensions.dart
│       └── validators.dart
├── services/            # Background services and infrastructure
│   ├── api_service.dart     # Dio client with Interceptors
│   └── storage_service.dart # SharedPreferences wrapper
├── widgets/             # Globally reused custom UI components
│   ├── custom_button.dart
│   ├── custom_textfield.dart
│   ├── app_loader.dart
│   └── status_views.dart    # Error, empty, and offline views
└── screens/             # Ready-to-use screens
    ├── splash_screen.dart
    ├── onboarding_screen.dart
    └── main_wrapper.dart    # Shell screen containing Bottom Navigation
```

---

## 🛠️ Getting Started

### Prerequisites

*   Flutter SDK (3.22.0 or higher recommended)
*   Dart SDK

### Installation

1.  Clone this repository:
    ```bash
    git clone https://github.com/RukshanAmodya/Flutter-Template.git
    cd Flutter-Template
    ```

2.  Install the required dependencies:
    ```bash
    flutter pub get
    ```

3.  Run the application:
    ```bash
    flutter run
    ```

---

## 🧪 Code Quality & Architecture

### API Client (`ApiService`)
Use the customized client to call REST APIs directly. It includes automatic logging and automatically attaches JWT tokens from storage:
```dart
final api = ApiService();
final response = await api.get('/user/profile');
```

### PERSISTENCE (`StorageService`)
Manage user settings, login tokens, and theme preferences seamlessly:
```dart
final storage = await StorageService.getInstance();
await storage.setLoggedIn(true);
await storage.setAuthToken('YOUR_JWT_TOKEN');
```

### BuildContext Extensions
Avoid boilerplate code using handy layout extensions:
```dart
context.showSnackBar('Profile saved!');
context.push(const SettingsScreen());
double screenWidth = context.screenWidth;
```

---

## 🤝 Contributing

Contributions are welcome! Please open an issue or submit a pull request with any improvements.
