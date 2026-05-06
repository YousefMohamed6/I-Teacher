import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/core/widgets/background.dart';
import 'package:iteacher/core/widgets/base64_image.dart';
import 'package:iteacher/features/register_student/data/model/student_model.dart';
import 'package:iteacher/features/student_profile/presentation/widgets/profile_info_row.dart';
import 'package:iteacher/generated/app_localizations.dart';

class StudentProfileView extends StatelessWidget {
  const StudentProfileView({super.key, required this.student});
  static const String routeName = '/StudentProfile';
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.student_profile),
      ),
      body: Background(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppDimensions.kPadding16),
          child: Column(
            children: [
              SizedBox(height: AppDimensions.kPadding24),
              CustomBase64Image(
                base64: student.imageBase64,
                radius: 72,
              )
              .animate()
              .scale(duration: 400.ms, curve: Curves.easeOutBack)
              .fadeIn(),
              SizedBox(height: AppDimensions.kPadding16),
              Text(
                '${student.firstName} ${student.lastName}',
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                student.email,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.secondary,
                ),
              ),
              SizedBox(height: AppDimensions.kPadding32),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppDimensions.kPadding20),
                  child: Column(
                    children: [
                      ProfileInfoRow(
                        icon: Icons.calendar_today_outlined,
                        label: localizations.subscription_date,
                        value: student.subscriptionDate.toString().substring(0, 10),
                      ),
                      Divider(height: AppDimensions.kPadding24),
                      ProfileInfoRow(
                        icon: Icons.event_busy_outlined,
                        label: localizations.expiry_date,
                        value: student.expiryDate.toString().substring(0, 10),
                      ),
                      Divider(height: AppDimensions.kPadding24),
                      ProfileInfoRow(
                        icon: Icons.phone_outlined,
                        label: localizations.phone,
                        value: student.phone,
                      ),
                      Divider(height: AppDimensions.kPadding24),
                      ProfileInfoRow(
                        icon: Icons.location_on_outlined,
                        label: localizations.address,
                        value: student.address,
                      ),
                    ],
                  ),
                ),
              )
              .animate()
              .slideY(begin: 0.1, end: 0, duration: 500.ms, curve: Curves.easeOutQuad)
              .fadeIn(),
            ],
          ),
        ),
      ),
    );
  }
}
