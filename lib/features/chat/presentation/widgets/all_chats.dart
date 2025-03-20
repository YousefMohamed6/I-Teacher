import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/chat/presentation/manager/chat_cubit.dart';
import 'package:mrjoo/features/chat/presentation/widgets/chat_item.dart';

class AllChats extends StatelessWidget {
  const AllChats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ChatCubit>();
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ChatItem(
            teacherModel: cubit.result[index],
          );
        },
        itemCount: cubit.result.length,
      ),
    );
  }
}
