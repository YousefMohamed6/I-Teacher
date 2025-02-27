import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/payment/presentation/manager/payment_cubit.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: AppColors.kMainTextColor,
      onPressed: () {
        BlocProvider.of<PaymentCubit>(context).createPayment();
      },
      child: const CustomText(
        text: 'Pay Now',
        color: AppColors.kPrimryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
