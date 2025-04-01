import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/widgets/base64_image.dart';
import 'package:iteacher/features/profile/data/model/account_model.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.account,
    required this.onTap,
  });
  final AccountModel account;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
