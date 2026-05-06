import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/extentions/theme_extension.dart';
import 'package:iteacher/core/utils/helper/toast_message.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/chat/presentation/manager/chat_cubit.dart';
import 'package:iteacher/features/chat/presentation/widgets/custom_chat_view.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is Failure) {
          ToastMessage.show(msg: state.message);
        }
      },
      buildWhen: (previous, current) => current is Success,
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          updateUI: () => const CustomChatView(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (messages) => const CustomChatView(),
          failure: (error) => Center(
            child: CustomText(
              text: error,
              color: context.colorScheme.error,
            ),
          ),
        );
      },
    );
  }
}
