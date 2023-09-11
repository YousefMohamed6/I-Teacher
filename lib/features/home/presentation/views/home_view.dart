import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/fonts.dart';
import 'package:mrjoo/core/utils/constants/text.dart';
import 'package:mrjoo/features/home/data/home_cubit/home_cubit.dart';
import 'package:mrjoo/features/home/data/home_cubit/home_state.dart';
import 'package:mrjoo/features/chat/presentation/views/chat_View.dart';
import 'package:mrjoo/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:mrjoo/features/home/presentation/views/widgets/sign_in_button.dart';
import 'package:mrjoo/features/login/presentation/views/login_view.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "HomePage";
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: kAppName,
          fontSize: 24,
          fontFamily: kPacificoFont,
        ),
        actions: const [
          SignInButton(),
        ],
        backgroundColor: kAppBarColor,
      ),
      body: BlocConsumer<HomeViewCubit, HomeViewState>(
        listener: (context, state) {
          if (state is UserLogin) {
            Navigator.pushNamed(context, ChatView.id);
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
    );
  }
}
