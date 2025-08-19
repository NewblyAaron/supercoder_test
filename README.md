# Supercoder Flutter Assignment Project

Flutter project to comply with Supercoder's Flutter assignment task.

## Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (latest stable version)
- Android Studio or VS Code with Flutter/Dart plugins
- Android device or emulator (API level 21+)

### Install & Run
```bash
git clone https://github.com/<your-username>/<repo>.git
cd <repo>
flutter pub get
flutter run
```

### Build APK (optional)
```bash
flutter build apk --release
```

## Project Structure
```
lib/
└── app/
├── modules/          # Feature-based modules (grouped by screens and flows)
│ ├── campaign/       # Campaign-related screens and logic
│ │ └── widgets/      # Campaign-specific UI components
│ ├── home/           # Home screen and sub-features
│ ├── profile/        # User profile flows
│ │ ├── basic_info/   # Profile basic information editing
│ │ ├── set_password/ # Password setup/reset
│ │ └── widgets/      # Profile-specific UI components
│ └── splash/         # Splash screen
│
├── routes/           # Centralized route definitions
├── services/         # Application-wide services (e.g., API, permissions)
└── app_theme.dart    # Centralized theming (currently only TextStyle)
└── main.dart         # runApp()
```

## Implementation Assumptions and Decisions
- **Architecture**  
  The project follows a **feature-first (modular) structure**, where each feature (e.g., profile, campaign, splash) is self-contained with its own screens, controllers, and widgets. This improves maintainability and scalability as new features can be added without affecting unrelated modules.
- **State Management**  
  Used **GetX** for lightweight state management and dependency injection. This keeps the code clean and minimizes boilerplate, aligning with the restriction to avoid heavy external libraries.
- **UI Libraries Restriction**  
  Only **Flutter’s built-in widgets** are used for UI. No third-party UI libraries were introduced. This ensures compliance with the project requirement to justify external packages.
- **Permissions**  
  Permissions (e.g., Camera, Storage) are handled via **native Android code** through method channels. This avoids using libraries like `permission_handler` and demonstrates direct platform integration.
- **File and Image Handling**  
  Instead of `image_picker` or `file_picker`, file and image selection is performed through **custom native code** (Android) exposed to Flutter using method channels. This approach was chosen to respect the restriction on external packages.

## Code Explanation Video
- TODO: make code explanation video (i'm eepy)
