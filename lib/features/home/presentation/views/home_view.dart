import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/fonts.dart';
import 'package:mrjoo/core/utils/constants/images.dart';
import 'package:mrjoo/core/utils/constants/links.dart';
import 'package:mrjoo/core/utils/constants/text.dart';
import 'package:mrjoo/features/home/data/home_cubit/home_cubit.dart';
import 'package:mrjoo/features/home/data/home_cubit/home_state.dart';
import 'package:mrjoo/core/utils/helper.dart';
import 'package:mrjoo/features/chat/presentation/views/chat_page.dart';
import 'package:mrjoo/features/login/presentation/views/login_page.dart';
import 'package:mrjoo/core/widgets/asset_image.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/features/home/presentation/views/widgets/custom_row.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/core/widgets/custom_text_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "HomePage";
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: kAppName),
        actions: [
          CustomTextButton(
            text: "To Course",
            fontWeight: FontWeight.bold,
            color: kMainTextColor,
            onPressed: () {
              BlocProvider.of<HomeViewCubit>(context).chechIsLogin();
            },
          ),
        ],
      ),
      body: BlocConsumer<HomeViewCubit, HomeViewState>(
        listener: (context, state) {
          if (state is UserLogin) {
            Navigator.pushNamed(context, ChatPage.id);
          }
          if (state is UserLogout) {
            Navigator.pushNamed(context, LoginPage.id);
          }
        },
        builder: (context, state) {
          return Background(
            child: ListView(
              children: [
                const SizedBox(height:84),
                const Avatar(image: kAvaterLogo),
                const SizedBox(height:56),
                const CustomText(
                  text: kTeacherName,
                  textAlign: TextAlign.center,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kMainTextColor,
                ),
                const SizedBox(height:16),
                const CustomText(
                  text: kTeacherJob,
                  textAlign: TextAlign.center,
                  fontSize: 24,
                  fontFamily: kFontPacifico,
                  fontWeight: FontWeight.bold,
                  color: kMainTextColor,
                ),
                const SizedBox(height:5),
                CustomRow(
                  mainAxisAlignment: MainAxisAlignment.center,
                  text: "Phone Number : ",
                  textButton: kPhone,
                  onPressed: () async {
                    await urlLauncher(url: 'tel:$kPhone');
                  },
                ),
                CustomRow(
                  mainAxisAlignment: MainAxisAlignment.center,
                  text: "Email Address : ",
                  textButton: kEmail,
                  onPressed: () async {
                    await urlLauncher(
                        url: 'mailto:$kEmail?subject=$kEmailSubject');
                  },
                ),
                const SizedBox(height:32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomIconButton(
                      icon: const CustomAssetImage(imagePath: kFacebookLogo),
                      iconSize: 60,
                      onPressed: () async {
                        await urlLauncher(url: kFaceBookUrl);
                      },
                    ),
                    CustomIconButton(
                      icon: const CustomAssetImage(imagePath: kYoutubeLogo),
                      iconSize: 60,
                      onPressed: () async {
                        await urlLauncher(url: kYoutubeUrl);
                      },
                    ),
                    CustomIconButton(
                      icon: const CustomAssetImage(imagePath: kLinkedinLogo),
                      iconSize: 50,
                      onPressed: () async {
                        await urlLauncher(url: kLinkedinUrl);
                      },
                    ),
                    CustomIconButton(
                      icon: const CustomAssetImage(imagePath: kGithubLogo),
                      iconSize: 50,
                      onPressed: () async {
                        await urlLauncher(url: kGithubUrl);
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}