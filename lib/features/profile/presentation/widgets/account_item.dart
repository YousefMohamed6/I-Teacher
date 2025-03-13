import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/utils/helper/url_launcher.dart';
import 'package:mrjoo/core/widgets/base64_image.dart';
import 'package:mrjoo/features/profile/data/model/account_model.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.account,
  });
  final AccountModel account;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await UrlLauncher.launcher(url: account.url);
      },
      child: Column(
        spacing: 8.h,
        children: [
          CustomBase64Image(
            base64: account.icon,
            radius: 36.r,
          ),
          Text(account.name),
        ],
      ),
    );
  }
}
