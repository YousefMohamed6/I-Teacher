import 'package:flutter/widgets.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_background.dart';
import 'package:mrjoo/features/privacy_policey/views/widgets/i_accpet_policy_button.dart';

class InitialPrivacyView extends StatelessWidget {
  const InitialPrivacyView({super.key, required this.privacy});
  final String privacy;
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 16),
            CustomBackground(
              data: privacy,
            ),
            const SizedBox(height: 8),
            const IAcceptPolicy(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
