import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/utils/helper/show_message.dart';
import 'package:iteacher/features/chat/presentation/manager/chat_cubit.dart';
import 'package:iteacher/features/chat/presentation/widgets/custom_chat_view.dart';

class ChatviewBody extends StatelessWidget {
  const ChatviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is Failure) {
          ShowMessage.show(context, msg: state.message);
        }
      },
      buildWhen: (previous, current) => current is Success,
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          updateUI: () => CustomChatView(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (messages) => CustomChatView(),
          failure: (error) => Center(
            child: Text(
              error,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.red,
                  ),
            ),
          ),
        );
      },
    );
  }
}
