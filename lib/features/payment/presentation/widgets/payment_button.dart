import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_button.dart';
import 'package:iteacher/features/payment/presentation/manager/payment_cubit.dart';
import 'package:iteacher/l10n.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        context.read<PaymentCubit>().pay();
      },
      child: Text(
        AppLocalizations.of(context)!.pay_now,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
