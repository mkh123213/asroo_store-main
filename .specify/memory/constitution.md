<!--
SYNC IMPACT REPORT
==================
Version change: [unversioned template] → 1.0.0
Bump rationale: MINOR — initial population of all placeholder tokens; no prior versioned content existed.

Modified principles: N/A (all new, no renames)

Added sections:
  - Core Principles (5 principles)
  - Quality & Testing Standards
  - Development Workflow
  - Governance

Removed sections: None (no prior content)

Templates reviewed:
  - .specify/templates/plan-template.md      ✅ No changes required; Constitution Check is a runtime-filled placeholder
  - .specify/templates/spec-template.md      ✅ No changes required; generic structure compatible
  - .specify/templates/tasks-template.md     ✅ No changes required; task categories align with principles
  - .specify/templates/checklist-template.md ✅ No changes required; generic structure compatible

Follow-up TODOs: None — all placeholders resolved.
-->

# Asroo Store Constitution

## Core Principles

### I. Clean Architecture

Every feature MUST be structured under `features/<feature>/data/` and `features/<feature>/presentation/`
with strict layer separation. The data layer handles API calls, models, and repository implementations;
the presentation layer handles BLoC/Cubit state and UI widgets. Cross-layer shortcuts (e.g., calling
Retrofit directly from a widget) are PROHIBITED. Shared infrastructure belongs in `core/` only when
genuinely reused across multiple features. No feature may directly depend on another feature's
internal implementation — only on shared `core/` contracts.

### II. BLoC State Management

All feature-level state MUST be managed via BLoC (complex async flows) or Cubit (simple state).
Global app-level state (theme, language) is managed exclusively by `AppCubit`. All BLoC events and
states MUST use `@freezed` — no hand-written `copyWith` or `==` overrides. Widgets MUST NOT hold
business logic; logic belongs in BLoC/Cubit only.

### III. Code Generation Discipline (NON-NEGOTIABLE)

Generated files (`*.g.dart`, `*.freezed.dart`) MUST NEVER be edited manually. After any change to
`@JsonSerializable` models, `@freezed` states/events, `@RestApi` clients, or `@HiveType` adapters,
`dart run build_runner build --delete-conflicting-outputs` MUST be run before committing. Committing
stale or hand-patched generated files is a blocking violation.

### IV. Centralized Dependency Injection

Every service, repository, and BLoC/Cubit MUST be registered in `core/di/injection_container.dart`
using GetIt before it can be used. Direct instantiation of dependencies inside widgets or BLoCs is
PROHIBITED. All injected dependencies MUST be resolved via `sl<T>()`. New feature dependencies MUST
be registered in `injection_container.dart` as part of the same PR that introduces them.

### V. Responsive & Accessible UI

All UI sizing MUST use `flutter_screenutil` extensions (`sp` for font sizes, `w`/`h` for
dimensions). Hard-coded pixel values are PROHIBITED. Every user-facing string MUST be added to both
`lang/ar.json` and `lang/en.json` before use. Font selection (Cairo for Arabic, Poppins for English)
is handled automatically via locale — do not override it per-widget.

## Quality & Testing Standards

- `flutter analyze` MUST pass with zero errors and zero warnings before any PR is merged.
- `flutter test` MUST pass in full on the target branch before merging.
- New screens MUST include at least one widget test covering the primary render path.
- API integration behavior MUST be verified against the real base URL
  (`https://api.escuelajs.co`) in development — do not mock the Retrofit client in integration
  tests, as mock/prod divergence has caused production failures in similar projects.
- Firebase-related functionality (FCM, Firestore, Dynamic Links) MUST be tested on a real device
  or Firebase emulator; simulator-only testing is insufficient.

## Development Workflow

- Run `dart run build_runner build --delete-conflicting-outputs` any time a model, BLoC event,
  BLoC state, API client annotation, or Hive adapter is added or modified.
- Register all new services and repositories in `core/di/injection_container.dart` in the same
  commit that introduces them.
- Add locale strings to **both** `lang/ar.json` and `lang/en.json` simultaneously; a key missing
  from either file is a blocking defect.
- Environment-specific values MUST be accessed only via the `EnvVariables` class; no raw
  `dotenv.get()` calls in feature code.
- Role-specific features live under `features/admin/` or `features/customer/` respectively;
  cross-role logic belongs in `core/`.

## Governance

This constitution supersedes all other practices, conventions, and personal preferences within
this repository. Any deliberate deviation from a principle MUST be:

1. Justified in the PR description with a concrete technical rationale.
2. Acknowledged as a named exception in the relevant spec or plan document.
3. Reviewed and approved by at least one additional team member.

**Amendment procedure**: Amendments require a version bump (per semantic versioning rules below),
an updated `LAST_AMENDED_DATE`, and propagation of any affected constraints to dependent templates
under `.specify/templates/`.

**Versioning policy**:
- MAJOR: Backward-incompatible removal or redefinition of an existing principle.
- MINOR: New principle or section added, or materially expanded guidance.
- PATCH: Clarifications, wording fixes, typo corrections, non-semantic refinements.

**Compliance review**: All PRs MUST include a Constitution Check verifying compliance with all
five core principles. The plan template's "Constitution Check" gate enforces this at design time.
Runtime development guidance is maintained in `CLAUDE.md`.

**Version**: 1.0.0 | **Ratified**: 2026-04-19 | **Last Amended**: 2026-04-19
