import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/payment/presentation/manager/payment_cubit.dart';
import 'package:mrjoo/mr_joo.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: AppColors.kMainTextColor,
      onPressed: () {
        context.read<PaymentCubit>().getCoursePrice();
      },
      child: CustomText(
        text: AppLocalizations.of(context)!.pay_now,
        color: AppColors.kPrimryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
