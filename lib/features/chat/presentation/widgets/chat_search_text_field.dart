import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/chat/presentation/manager/chat_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class ChatSearchTextField extends StatelessWidget {
  const ChatSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ChatCubit>(context);
    return CustomFormField(
      autovalidateMode: AutovalidateMode.disabled,
      prefixIcon: const Icon(Icons.search),
      lablelText: AppLocalizations.of(context)!.search,
      hintText: AppLocalizations.of(context)!.search,
      onChanged: (value) {
        cubit.searchTeacher(value);
      },
    );
  }
}
