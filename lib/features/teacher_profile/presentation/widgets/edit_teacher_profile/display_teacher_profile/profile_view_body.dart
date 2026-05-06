import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/core/utils/helper/url_launcher.dart';
import 'package:iteacher/core/widgets/base64_image.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/edit_teacher_profile/display_teacher_profile/teacher_accounts.dart';
import 'package:iteacher/generated/app_localizations.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.teacherModel});
  final TeacherModel teacherModel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: AppDimensions.kPadding24),
        CustomBase64Image(
          base64: teacherModel.imageBase64,
          radius: 84,
        )
        .animate()
        .scale(duration: 400.ms, curve: Curves.easeOutBack)
        .fadeIn(),
        SizedBox(height: AppDimensions.kPadding24),
        Text(
          '${teacherModel.firstName} ${teacherModel.lastName}',
          textAlign: TextAlign.center,
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        SizedBox(height: AppDimensions.kPadding8),
        Text(
          teacherModel.department,
          textAlign: TextAlign.center,
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppDimensions.kPadding32),
        Card(
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.kPadding20),
            child: Column(
              children: [
                _TeacherContactRow(
                  icon: Icons.phone_outlined,
                  label: localizations.phone,
                  value: teacherModel.phone,
                  onPressed: () async {
                    final String url = 'tel:${teacherModel.phone}';
                    await UrlLauncher.launcher(url: url);
                  },
                ),
                Divider(height: AppDimensions.kPadding24),
                _TeacherContactRow(
                  icon: Icons.email_outlined,
                  label: localizations.email,
                  value: teacherModel.email,
                  onPressed: () async {
                    const String emailSubject = 'I Teacher';
                    final String url = 'mailto:${teacherModel.email}?subject=$emailSubject';
                    await UrlLauncher.launcher(url: url);
                  },
                ),
              ],
            ),
          ),
        )
        .animate()
        .slideY(begin: 0.1, end: 0, duration: 500.ms, curve: Curves.easeOutQuad)
        .fadeIn(),
        SizedBox(height: AppDimensions.kPadding24),
        TeacherAccounts(accounts: teacherModel.accounts.toList()),
      ],
    );
  }
}

class _TeacherContactRow extends StatelessWidget {
  const _TeacherContactRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(AppDimensions.kRadius8),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppDimensions.kPadding8),
        child: Row(
          children: [
            Icon(icon, color: colorScheme.primary, size: AppDimensions.kIcon20),
            SizedBox(width: AppDimensions.kPadding16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.secondary,
                    ),
                  ),
                  Text(
                    value,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
