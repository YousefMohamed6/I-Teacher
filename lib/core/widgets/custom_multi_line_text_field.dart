import 'package:flutter/material.dart';

class CustomMultiLineTextField extends StatelessWidget {
  const CustomMultiLineTextField({
    super.key,
    this.lablelText,
    this.hintText,
    this.controller,
    this.onChanged,
    this.prefixIcon,
  });
  final String? lablelText;
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: lablelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
        ),
        keyboardType: TextInputType.multiline,
        maxLines: 3,
        onChanged: onChanged,
        controller: controller,
        style: Theme.of(context).textTheme.bodyMedium,
        cursorColor: Colors.white,
      ),
    );
  }
}
