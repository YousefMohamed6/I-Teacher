import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/utils/helper/url_launcher.dart';
import 'package:iteacher/features/teacher_profile/data/model/account_model.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/display_teacher_profile/account_item.dart';

class TeacherAccounts extends StatelessWidget {
  const TeacherAccounts({super.key, required this.accounts});
  final List<AccountModel> accounts;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(16.h),
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
