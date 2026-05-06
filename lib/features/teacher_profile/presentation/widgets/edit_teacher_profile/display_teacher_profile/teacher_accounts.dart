import 'package:flutter/material.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/core/utils/helper/url_launcher.dart';
import 'package:iteacher/features/teacher_profile/data/model/account_model.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/display_teacher_profile/account_item.dart';

class TeacherAccounts extends StatelessWidget {
  const TeacherAccounts({super.key, required this.accounts});
  final List<AccountModel> accounts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Standard height for horizontal account list
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.kPadding8),
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.kPadding8),
            child: AccountItem(
              account: accounts[index],
              onTap: () {
                UrlLauncher.launcher(url: accounts[index].url);
              },
            ),
          );
        },
      ),
    );
  }
}
