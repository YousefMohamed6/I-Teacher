import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/fonts.dart';
import 'package:mrjoo/core/utils/constants/keys.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/login/presentation/views/login_view.dart';
import 'package:mrjoo/features/course/presentation/manager/course_view_cubit.dart';
import 'package:mrjoo/features/course/presentation/views/course_view.dart';
import 'package:mrjoo/features/home/presentation/manager/home_cubit.dart';
import 'package:mrjoo/features/home/presentation/manager/home_state.dart';
import 'package:mrjoo/features/home/presentation/widgets/home_view_body.dart';
import 'package:mrjoo/features/home/presentation/widgets/sign_in_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "HomeView";
  @override
  Widget build(context) {
    return BlocProvider(
      create: (context) => HomeViewCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const CustomText(
            text: AppKeys.kAppName,
            fontSize: 24,
            fontFamily: AppFonts.kPacificoFont,
            color: Colors.white,
          ),
          actions: const [
            SignInButton(),
          ],
          backgroundColor: AppColors.kAppBarColor,
        ),
        body: BlocConsumer<HomeViewCubit, HomeViewState>(
          listener: (context, state) {
            if (state is UserLogin) {
              BlocProvider.of<CourseCubit>(context).fetchUrl();
              Navigator.pushNamed(context, CourseView.id);
            }
            if (state is UserLogout) {
              Navigator.pushNamed(context, LoginView.id);
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
      ),
    );
  }
}
