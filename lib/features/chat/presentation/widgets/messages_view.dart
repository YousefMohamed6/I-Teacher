import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/features/chat/presentation/manager/chat_cubit.dart';
import 'package:mrjoo/features/chat/presentation/widgets/messages/custom_message_widget.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    return Expanded(
      child: ListView.separated(
        reverse: true,
        itemBuilder: (context, index) => CustomMessageWidget(
          message: cubit.messages[index],
        ),
        itemCount: cubit.messages.length,
        separatorBuilder: (context, index) => SizedBox(
          height: 8.h,
        ),
      ),
    );
  }
}
