import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/show_message.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/features/payment/data/payment_cubit/payment_cubit.dart';
import 'package:mrjoo/features/payment/data/payment_cubit/payment_state.dart';
import 'package:mrjoo/features/register/presentation/views/register_view.dart';

class CheckPaymentButton extends StatelessWidget {
  const CheckPaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is Paid) {
          ShowMessage.show(context, msg: 'Payment Success');
          Navigator.pushReplacementNamed(context, RegisterView.id);
        } else if (state is PaymentFailure) {
          ShowMessage.show(context, msg: 'You Not Register');
        }
      },
      child: CustomIconButton(
        onPressed: () {
          BlocProvider.of<PaymentCubit>(context).checkPayment();
        },
        icon: const Icon(Icons.person_add),
        iconSize: 32,
      ),
    );
  }
}
