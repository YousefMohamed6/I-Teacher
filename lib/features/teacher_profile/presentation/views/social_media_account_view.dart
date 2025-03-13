import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/account_icon.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/account_link_text_field.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/account_name_text_field.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/delete_account_button.dart';
import 'package:mrjoo/features/teacher_profile/presentation/widgets/save_account_data.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class SocialMediaAccountView extends StatelessWidget {
  const SocialMediaAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.social_account,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          DeleteAccountButton(),
        ],
      ),
      body: Background(
        child: Form(
          key: BlocProvider.of<TeacherProfileCubit>(context).accountformkey,
          child: ListView(
            children: [
              SizedBox(height: 32.h),
              AccountIcon(),
              SizedBox(height: 32.h),
              AccountNameTextField(),
              SizedBox(height: 8.h),
              AccountLinkTextField(),
              SizedBox(height: 32.h),
              SaveAccountDataButton(),
            ],
          ),
        ),
      ),
    );
  }
}
