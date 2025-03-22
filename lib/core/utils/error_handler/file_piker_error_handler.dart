import 'package:flutter/material.dart';
import 'package:iteacher/core/exceptions/pick_file_exception.dart';
import 'package:iteacher/generated/app_localizations.dart';

sealed class FilePikerErrorHandler {
  static String getErrorMessage({
    required Exception exception,
    required BuildContext context,
  }) {
    switch (exception) {
      case PickedFileException:
        return AppLocalizations.of(context)!.userNotFound;
      case PickFilePermissionException:
        return AppLocalizations.of(context)!.emailAlreadyInUse;
      default:
        return AppLocalizations.of(context)!.somethingWentWrong;
    }
  }
}
