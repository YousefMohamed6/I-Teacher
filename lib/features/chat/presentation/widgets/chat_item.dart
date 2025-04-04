import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/core/widgets/base64_image.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/chat/presentation/manager/chat_cubit.dart';
import 'package:iteacher/features/chat/presentation/views/chat_view.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.teacherModel});
  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.pushNamed(
          ChatView.routeName,
          extra: context.read<ChatCubit>().senderId,
          queryParameters: {ChatKeys.kReciverField: teacherModel.email},
        );
      },
      leading: CustomBase64Image(
        base64: teacherModel.imageBase64,
        radius: 36.r,
      ),
      title: CustomText(
        text: '${teacherModel.firstName} ${teacherModel.lastName}',
      ),
      subtitle: CustomText(
        text: teacherModel.department,
      ),
    );
  }
}
