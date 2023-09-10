import 'package:flutter/material.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';

class EmailTextFaild extends StatelessWidget {
  const EmailTextFaild(
      {super.key, required this.formkey, required this.controller});
  final GlobalKey formkey;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: CustomFormField(
        textInputType: TextInputType.emailAddress,
        prefixIcon: const Icon(Icons.email),
        lablelText: "Email",
        hintText: "Enter Your Email",
        controller: controller,
      ),
    );
  }
}
