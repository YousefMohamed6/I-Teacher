import 'package:flutter/material.dart';
import 'package:mrjoo/features/settings/presentation/widgets/setting_view_body.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SettingsViewBody(),
    );
  }
}
