import 'package:flutter/material.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/core/widgets/base64_image.dart';
import 'package:iteacher/features/teacher_profile/data/model/account_model.dart';

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
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomBase64Image(
            base64: account.icon,
            radius: 36,
          ),
          SizedBox(height: AppDimensions.kPadding8),
          Text(
            account.name,
            style: textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
