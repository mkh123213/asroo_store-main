# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
flutter pub get                                                    # Install dependencies
dart run build_runner build --delete-conflicting-outputs          # Generate code (models, BLoCs, API clients)
dart run build_runner watch --delete-conflicting-outputs          # Watch mode for code generation
flutter run --dart-define-from-file=.env.dev                      # Run with dev environment
flutter analyze                                                    # Lint
flutter test                                                       # Run all tests
flutter test test/widget_test.dart                                # Run single test file
flutter build apk --dart-define-from-file=.env.prod               # Build Android release
```

## Architecture

This is a Flutter e-commerce app following **Clean Architecture** with the **BLoC pattern**. The codebase is split into two top-level concerns under `lib/`:

- `core/` — shared infrastructure (DI, routing, services, theme, widgets)
- `features/` — feature modules, each with `data/` and `presentation/` layers

### Feature structure

Each feature follows this layout:
```
features/<feature>/
  data/
    data_source/   # API calls via Retrofit + GraphQL or REST
    models/        # @JsonSerializable + @freezed models
    repos/         # Repository implementations
  presentation/
    bloc/          # BLoC or Cubit classes + @freezed states/events
    screens/       # Full screen widgets
    refactors/     # Sub-widgets extracted from screens
```

There are two user roles with separate feature trees: `features/admin/` and `features/customer/`. Role is stored in SharedPreferences after login and drives navigation.

### Dependency Injection

All services, repositories, and BLoCs/Cubits are registered via **GetIt** in `core/di/injection_container.dart`. Always register new dependencies there and inject via `sl<T>()`.

### State Management

- **AppCubit** (`core/app/app_cubit/`) manages global theme and language.
- Feature-level complex state uses **BLoC**; simple state uses **Cubit**.
- All BLoC events and states use `@freezed` — run `build_runner` after modifying them.

### Networking

- **Dio** HTTP client configured in `core/service/graphql/dio_factory.dart` with a Bearer token interceptor (reads from SharedPreferences) and 401 logout handling.
- **Retrofit** generates the API client from `core/service/graphql/api_service.dart`.
- Base URL: `https://api.escuelajs.co` — GraphQL at `/graphql`, REST at `/api/v1/`.
- Most data operations use GraphQL queries defined as strings in `core/service/graphql/qraphql_queries/`.

### Code Generation

Three annotation systems require `build_runner`:
- `@JsonSerializable` + `@freezed` → model classes (`.g.dart` + `.freezed.dart`)
- `@RestApi` (retrofit) → API client (`.g.dart`)
- `@HiveType` → Hive adapters (`.g.dart`)

Never edit generated `*.g.dart` or `*.freezed.dart` files directly.

### Environment & Firebase

- Environment variables loaded via `flutter_dotenv` from `.env.dev` / `.env.prod`.
- Access via `EnvVariables` class in `core/app/env.variables.dart`.
- Firebase (Firestore, FCM, Dynamic Links) is initialized in `main.dart` with platform-specific options.

### Localization

- Supports Arabic (`ar`) and English (`en`). Translations live in `lang/ar.json` and `lang/en.json`.
- Fonts: **Cairo** for Arabic, **Poppins** for English — switched automatically based on locale.
- Active locale managed by `AppCubit` and persisted in SharedPreferences.

### Responsive UI

All sizing uses `flutter_screenutil` (`sp`, `w`, `h` extensions). Do not use hard-coded pixel values.

<!-- SPECKIT START -->
For additional context about technologies to be used, project structure,
shell commands, and other important information, read the current plan
<!-- SPECKIT END -->
