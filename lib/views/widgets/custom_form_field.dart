import 'package:flutter/material.dart';

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
    this.autovalidateMode,
  });
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final String? lablelText;
  final String? hintText;
  final bool? obscureText;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: TextFormField(
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          labelText: lablelText,
          labelStyle: const TextStyle(fontSize: 16, color: Colors.white),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 16, color: Colors.white),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefixIconColor: Colors.white,
          suffixIconColor: Colors.white,
        ),
        enabled: true,
        keyboardType: textInputType,
        obscureText: obscureText ?? false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This Field is Requird";
          }
          return null;
        },
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        controller: controller,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
      ),
    );
  }
}
