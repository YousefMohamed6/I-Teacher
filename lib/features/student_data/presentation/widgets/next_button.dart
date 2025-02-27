import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/payment/presentation/views/payment_view.dart';
import 'package:mrjoo/features/student_data/presentation/manager/customer_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

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
          context.pushNamed(PaymentView.routeName,
              extra: BlocProvider.of<CustomerCubit>(context).customerData);
        }
        BlocProvider.of<CustomerCubit>(context).changeStateLoading();
      },
      color: AppColors.kMainTextColor,
      child: CustomText(
        text: AppLocalizations.of(context)!.next,
        color: AppColors.kPrimryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
