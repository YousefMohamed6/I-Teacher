import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_cubit.dart';
import 'package:mrjoo/features/chat/presentation/views/widgets/send_message_button.dart';

class ChatFormField extends StatelessWidget {
  const ChatFormField({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<ChatCubit>(context).formKey,
      child: CustomFormField(
        autovalidateMode: AutovalidateMode.disabled,
        controller: BlocProvider.of<ChatCubit>(context).messageCtrl,
        hintText: 'Send',
        onFieldSubmitted: (input) {
          BlocProvider.of<ChatCubit>(context).sendMessage();
        },
        suffixIcon: const SendMessageButton(),
      ),
    );
  }
}
