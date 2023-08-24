import 'package:flutter/material.dart';
import 'custom_form_field.dart';

class UserName extends StatelessWidget {
  const UserName({
    super.key,
    required this.fristName,
    required this.lastName,
  });
  final TextEditingController fristName;
  final TextEditingController lastName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomFormField(
            textInputType: TextInputType.name,
            lablelText: 'Frist Name',
            controller: fristName,
          ),
        ),
        Expanded(
          child: CustomFormField(
            lablelText: 'Last Name',
            controller: lastName,
          ),
        ),
      ],
    );
  }
}
