# Auth Feature

## Overview
The Auth feature manages user authentication, including login, registration for students/teachers, and password recovery.

## Modules
- **Login**: Handles user sign-in using email and password via Firebase Auth.
- **Register**: Manages new user creation.
- **Reset Password**: Provides a flow for resetting forgotten passwords.

## Architecture
- **Data Layer**:
  - `LoginRepoImpl`, `RegisterRepoImpl`: Interact with `FirebaseAuthService`.
- **Domain Layer**:
  - Use cases for creating users, signing in, and fetching user data.
- **Presentation Layer**:
  - **Manager**: Separate cubits for `Login`, `Register`, and `ResetPassword`.
  - **Screens**: `LoginView`, `RegisterView`, `ResetPasswordView`.
  - **Widgets**: Custom forms, text fields, and social buttons.

## Logic
- Integrates with Firebase Authentication.
- Roles (Student/Teacher) are managed and stored in Firestore/Shared Preferences.
- Includes validation logic for emails and passwords.
