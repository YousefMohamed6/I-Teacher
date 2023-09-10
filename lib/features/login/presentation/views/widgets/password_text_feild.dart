import 'package:flutter/material.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';

class PasswordTextFeild extends StatelessWidget {
  const PasswordTextFeild({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.onSuffixIconPressed,
    required this.formKey,
  });
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onSuffixIconPressed;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomFormField(
        lablelText: "Password",
        hintText: "Enter your Password",
        textInputType: TextInputType.visiblePassword,
        suffixIcon: IconButton(
          onPressed: onSuffixIconPressed,
          icon: obscureText
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
        prefixIcon: const Icon(Icons.lock),
        obscureText: obscureText,
        controller: controller,
      ),
    );
  }
}
