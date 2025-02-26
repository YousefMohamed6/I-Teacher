import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/customer/presentation/manager/customer_cubit.dart';
import 'package:mrjoo/features/payment/presentation/views/payment_view.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        BlocProvider.of<CustomerCubit>(context).changeStateLoading();
        var formKey = BlocProvider.of<CustomerCubit>(context).formKey;
        if (formKey.currentState!.validate()) {
          BlocProvider.of<CustomerCubit>(context).addCustomer();
          Navigator.pushNamed(context, PaymentView.id);
        }
        BlocProvider.of<CustomerCubit>(context).changeStateLoading();
      },
      color: AppColors.kMainTextColor,
      child: const CustomText(
        text: 'Next',
        color: AppColors.kPrimryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
