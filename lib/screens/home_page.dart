import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/consts/colors.dart';
import 'package:mrjoo/consts/fonts.dart';
import 'package:mrjoo/consts/images.dart';
import 'package:mrjoo/consts/links.dart';
import 'package:mrjoo/consts/text.dart';
import 'package:mrjoo/cubits/homepage/homepage_cubit.dart';
import 'package:mrjoo/cubits/homepage/homepage_state.dart';
import 'package:mrjoo/helper/helper.dart';
import 'package:mrjoo/screens/chat_page.dart';
import 'package:mrjoo/screens/login_page.dart';
import 'package:mrjoo/widgets/asset_image.dart';
import 'package:mrjoo/widgets/avatar.dart';
import 'package:mrjoo/widgets/background.dart';
import 'package:mrjoo/widgets/custom_icon_button.dart';
import 'package:mrjoo/widgets/custom_row.dart';
import 'package:mrjoo/widgets/custom_text.dart';
import 'package:mrjoo/widgets/custom_text_button.dart';
import 'package:mrjoo/widgets/vertical_sizebox.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = "HomePage";
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: kAppName,
          fontSize: 24,
          fontFamily: kFontPacifico,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: [
          CustomTextButton(
            text: "To Course",
            fontWeight: FontWeight.bold,
            color: kMainTextColor,
            onPressed: () {
              BlocProvider.of<HomepageCubit>(context).chechIsLogin();
            },
          ),
        ],
        backgroundColor: kAppBarColor,
      ),
      body: BlocConsumer<HomepageCubit, HomePageState>(
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
                const VerticalSizedBox(84),
                const Avatar(image: kAvaterLogo),
                const VerticalSizedBox(56),
                const CustomText(
                  text: kTeacherName,
                  textAlign: TextAlign.center,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kMainTextColor,
                ),
                const VerticalSizedBox(16),
                const CustomText(
                  text: kTeacherJob,
                  textAlign: TextAlign.center,
                  fontSize: 24,
                  fontFamily: kFontPacifico,
                  fontWeight: FontWeight.bold,
                  color: kMainTextColor,
                ),
                const VerticalSizedBox(5),
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
                const VerticalSizedBox(32),
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
