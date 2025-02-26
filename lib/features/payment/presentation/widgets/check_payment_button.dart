import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mrjoo/core/utils/services/show_message.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/features/auth/register/presentation/views/register_view.dart';
import 'package:mrjoo/features/payment/presentation/manager/payment_cubit.dart';
import 'package:mrjoo/features/payment/presentation/manager/payment_state.dart';

class CheckPaymentButton extends StatelessWidget {
  const CheckPaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is Paid) {
          ShowMessage.show(context, msg: 'Payment Success');
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterView(),
            ),
            (route) => false,
          );
        } else if (state is PaymentFailure) {
          ShowMessage.show(context, msg: 'You Not Register');
        }
      },
      child: CustomIconButton(
        onPressed: () {
          BlocProvider.of<PaymentCubit>(context).checkPayment();
        },
        icon: const Icon(
          FontAwesomeIcons.userPlus,
          color: Colors.white,
        ),
        iconSize: MediaQuery.sizeOf(context).height * 0.032,
      ),
    );
  }
}
