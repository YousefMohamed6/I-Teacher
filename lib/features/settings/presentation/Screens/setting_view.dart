import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/widgets/custom_text.dart';
import 'package:iteacher/features/auth/login/presentation/Screens/login_view.dart';
import 'package:iteacher/features/chat/presentation/Screens/chats_view.dart';
import 'package:iteacher/features/chatbot/presentation/Screens/chatbot_view.dart';
import 'package:iteacher/features/course/presentation/manager/playlists_cubit.dart';
import 'package:iteacher/features/settings/presentation/manager/setting_bloc.dart';
import 'package:iteacher/features/student_profile/presentation/Screens/student_profile_view.dart';
import 'package:iteacher/features/settings/presentation/Screens/accessibility_view.dart';
import 'package:iteacher/features/terms_and_conditions/presentation/Screens/terms_and_conditions.dart';
import 'package:iteacher/generated/app_localizations.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<SettingsBloc>();
    return SettingsList(
      brightness: Theme.of(context).brightness,
      sections: [
        SettingsSection(
          title: Text(AppLocalizations.of(context)!.common),
          tiles: <SettingsTile>[
            SettingsTile.switchTile(
              initialValue: bloc.isDark,
              leading: Icon(Icons.format_paint),
              title: CustomText(
                text: AppLocalizations.of(context)!.theme,
              ),
              onToggle: (value) {
                bloc.add(UpdateTheme());
              },
            ),
            SettingsTile.switchTile(
              initialValue: bloc.local == 'ar',
              leading: Icon(Icons.language),
              title: CustomText(text: AppLocalizations.of(context)!.language),
              onToggle: (value) {
                bloc.add(
                  UpdateLocalization(local: value ? 'ar' : 'en'),
                );
              },
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.accessibility_new_rounded),
              title: CustomText(text: AppLocalizations.of(context)!.accessibility),
              onPressed: (context) {
                context.pushNamed(AccessibilityView.routeName);
              },
            ),
          ],
        ),
        SettingsSection(
          title: Text(AppLocalizations.of(context)!.contact_us),
          tiles: [
            SettingsTile.navigation(
              leading: Icon(Icons.chat),
              title: CustomText(text: AppLocalizations.of(context)!.chats),
              onPressed: (context) {
                context.pushNamed(ChatsView.routeName);
              },
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.smart_toy_outlined),
              title: CustomText(text: AppLocalizations.of(context)!.chatbot),
              onPressed: (context) {
                context.pushNamed(ChatbotView.routeName);
              },
            ),
          ],
        ),
        SettingsSection(
          title: CustomText(text: AppLocalizations.of(context)!.account),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: FaIcon(FontAwesomeIcons.user),
              title: CustomText(
                  text: AppLocalizations.of(context)!.student_profile),
              onPressed: (context) {
                context.pushNamed(StudentProfileView.routeName,
                    extra: context.read<PlaylistsCubit>().student);
              },
            ),
            SettingsTile.navigation(
              leading: FaIcon(FontAwesomeIcons.fileContract),
              title: CustomText(
                  text: AppLocalizations.of(context)!.terms_and_conditions),
              onPressed: (context) {
                context.pushNamed(TermsAndConditionsView.routeName);
              },
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.logout_outlined),
              title: CustomText(
                text: AppLocalizations.of(context)!.sign_out,
              ),
              onPressed: (context) async {
                await FirebaseAuth.instance.signOut();
                if (context.mounted) {
                  context.pushReplacementNamed(LoginView.routeName);
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
