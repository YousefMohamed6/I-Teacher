import 'package:flutter/material.dart';
import 'package:iteacher/core/exceptions/pick_file_exception.dart';
import 'package:iteacher/generated/app_localizations.dart';

sealed class FilePikerErrorHandler {
  static String getErrorMessage({
    required Exception exception,
    required BuildContext context,
  }) {
    if (exception is PickedFileException) {
      return AppLocalizations.of(context)!.userNotFound;
    } else if (exception is PickFilePermissionException) {
      return AppLocalizations.of(context)!.emailAlreadyInUse;
    } else {
      return AppLocalizations.of(context)!.somethingWentWrong;
    }
  }
}
