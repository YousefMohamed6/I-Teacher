import 'package:flutter/widgets.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_background.dart';
import 'package:mrjoo/features/terms/views/widgets/i_accpet_terms_button.dart';

class InitialTermsView extends StatelessWidget {
  const InitialTermsView({super.key, required this.trems});
  final String trems;
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
              data: trems,
            ),
            const SizedBox(height: 8),
            const IAcceptTerms(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
