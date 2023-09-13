import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mrjoo/core/utils/constants/text.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/features/chat/data/model/user_model.dart';
import 'package:mrjoo/features/course/data/course_view_cubit/course_view_cubit.dart';

class AdminButton extends StatelessWidget {
  const AdminButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var userBox = Hive.box<UserModel>(kUserBox);
    var user = userBox.values.first;
    if (user.isAdmin) {
      return CustomIconButton(
        onPressed: () {
          BlocProvider.of<CourseCubit>(context)
              .showBottomSheet(context: context);
        },
        icon: const Icon(Icons.add_to_queue),
      );
    } else {
      return const SizedBox();
    }
  }
}