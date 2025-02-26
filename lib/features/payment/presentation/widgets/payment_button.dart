import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_cubit.dart';
import 'package:mrjoo/features/payment/presentation/manager/payment_cubit.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: kMainTextColor,
      onPressed: () {
        BlocProvider.of<PaymentCubit>(context).pay(
          customerModel: BlocProvider.of<CustomerCubit>(context).customerData,
        );
      },
      child: const CustomText(
        text: 'Pay Now',
        color: kPrimryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
