import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          icon: FontAwesomeIcons.facebook,
          url: kFaceBookUrl,
          iconColor: Color.fromRGBO(13, 71, 161, 1),
        ),
        AccountItem(
          icon: FontAwesomeIcons.youtube,
          url: kYoutubeUrl,
          iconColor: Color.fromRGBO(198, 40, 40, 1),
        ),
        AccountItem(
          icon: FontAwesomeIcons.linkedin,
          url: kLinkedinUrl,
          iconColor: Color.fromRGBO(13, 71, 161, 1),
        ),
        AccountItem(
          icon: FontAwesomeIcons.github,
          url: kGithubUrl,
          iconColor: Colors.black,
        ),
      ],
    );
  }
}
