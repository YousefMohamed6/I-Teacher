import 'package:flutter/material.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.textInputType,
    this.suffixIcon,
    this.prefixIcon,
    this.lablelText,
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
  final String? lablelText;
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: TextFormField(
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: lablelText,
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
        cursorColor: Colors.white,
      ),
    );
  }
}
