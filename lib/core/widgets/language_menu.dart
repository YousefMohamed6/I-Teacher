import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/language_text.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_cubit.dart';

class LanguageMenu extends StatelessWidget {
  const LanguageMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'en',
          child: Text('English'),
        ),
        const PopupMenuItem(
          value: 'ar',
          child: Text('Arabic'),
        ),
      ],
      onSelected: (value) {
        BlocProvider.of<CustomerCubit>(context)
            .fetchTremsAndPrivacy(language: value);
      },
      child: const LanguageText(),
    );
  }
}
