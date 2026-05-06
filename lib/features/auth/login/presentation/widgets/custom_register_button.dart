import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';

class CustomRegisterButton extends StatelessWidget {
  const CustomRegisterButton({
    super.key,
    required this.routeName,
    required this.title,
  });

  final String routeName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        context.pushNamed(routeName);
      },
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, AppDimensions.kButtonHeight48),
        side: BorderSide(color: Theme.of(context).colorScheme.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.kRadius12),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
