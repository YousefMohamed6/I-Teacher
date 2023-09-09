import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/images.dart';
import 'package:mrjoo/core/utils/constants/links.dart';
import 'package:mrjoo/features/home/presentation/views/widgets/account_item.dart';

class TeacherAccounts extends StatelessWidget {
  const TeacherAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AccountItem(
          imagePath: kFacebookLogo,
          url: kFaceBookUrl,
        ),
        AccountItem(
          imagePath: kYoutubeLogo,
          url: kYoutubeUrl,
          iconSize: 60,
        ),
        AccountItem(
          imagePath: kLinkedinLogo,
          url: kLinkedinLogo,
        ),
        AccountItem(
          imagePath: kGithubLogo,
          url: kGithubUrl,
        ),
      ],
    );
  }
}
