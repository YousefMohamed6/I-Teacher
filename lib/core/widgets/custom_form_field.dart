import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/core/utils/constants/app_durations.dart';
import 'package:iteacher/generated/app_localizations.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.textInputType,
    this.suffixIcon,
    this.prefixIcon,
    this.labelText,
    this.hintText,
    this.obscureText,
    this.controller,
    this.onFieldSubmitted,
    this.onChanged,
    this.validator,
    this.autovalidateMode,
    this.enabled,
  });

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final String? labelText;
  final String? hintText;
  final bool? obscureText;
  final bool? enabled;

  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.kPadding8,
        vertical: AppDimensions.kPadding8,
      ),
      child: TextFormField(
        autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        enabled: enabled ?? true,
        keyboardType: textInputType,
        obscureText: obscureText ?? false,
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.required_field;
              }
              return null;
            },
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        controller: controller,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    )
    .animate()
    .slideY(
      begin: 0.1,
      end: 0,
      duration: AppDurations.medium,
      curve: Curves.easeOutQuad,
    )
    .fadeIn(duration: AppDurations.medium);
  }
}
