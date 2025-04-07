import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomRegisterButton extends StatelessWidget {
  const CustomRegisterButton(
      {super.key, required this.routeName, required this.title});
  final String routeName;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(routeName);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
