import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/helper.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.icon,
    required this.url,
    this.iconSize = 60,
    required this.iconColor,
  });
  final IconData icon;
  final String url;
  final double? iconSize;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: Icon(icon, color: iconColor),
      iconSize: iconSize,
      onPressed: () async {
        await urlLauncher(url: url);
      },
    );
  }
}
