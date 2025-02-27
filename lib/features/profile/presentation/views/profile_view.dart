import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/utils/constants/keys.dart';
import 'package:mrjoo/core/widgets/app_drawer.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/login/presentation/views/login_view.dart';
import 'package:mrjoo/features/course/presentation/manager/course_view_cubit.dart';
import 'package:mrjoo/features/course/presentation/views/course_view.dart';
import 'package:mrjoo/features/profile/presentation/manager/profile_cubit.dart';
import 'package:mrjoo/features/profile/presentation/manager/profile_state.dart';
import 'package:mrjoo/features/profile/presentation/widgets/home_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = "/ProfileView";
  @override
  Widget build(context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: AppKeys.kAppName,
          fontSize: 24,
          fontFamily: AppFonts.kPacificoFont,
          color: AppColors.kMainTextColor,
        ),
        backgroundColor: AppColors.kAppBarColor,
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is UserLogin) {
            BlocProvider.of<CourseCubit>(context).fetchUrl();
            Navigator.pushNamed(context, CourseView.routeView);
          }
          if (state is UserLogout) {
            Navigator.pushNamed(context, LoginView.routeName);
          }
        },
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.zero,
            children: const [
              Background(
                child: HomeViewBody(),
              ),
            ],
          );
        },
      ),
    );
  }
}
