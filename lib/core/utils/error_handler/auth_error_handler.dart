import 'package:flutter/material.dart';
import 'package:iteacher/generated/app_localizations.dart';

sealed class AuthErrorHandler {
  static String getErrorMessage({
    required String errorMessage,
    required BuildContext context,
  }) {
    switch (errorMessage) {
      case "user-not-found":
        return AppLocalizations.of(context)!.userNotFound;
      case "email-already-in-use":
        return AppLocalizations.of(context)!.emailAlreadyInUse;
      case "invalid-credential":
        return AppLocalizations.of(context)!.invalidEmailorPassword;
      case "invalid-email":
        return AppLocalizations.of(context)!.invalidEmail;
      case "network-request-failed":
        return AppLocalizations.of(context)!.networkRequestFailed;
      default:
        return AppLocalizations.of(context)!.somethingWentWrong;
    }
  }
}
