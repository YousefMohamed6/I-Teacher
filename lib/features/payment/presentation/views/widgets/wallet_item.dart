import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/images.dart';
import 'package:mrjoo/features/payment/data/payment_cubit/payment_cubit.dart';
import 'package:mrjoo/features/payment/data/payment_cubit/payment_state.dart';
import 'package:mrjoo/features/payment/presentation/views/widgets/payment_item.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) => PaymentItem(
        onTap: () {
          BlocProvider.of<PaymentCubit>(context).changePaymentType(
            isVisa: false,
          );
        },
        imagePath: kWalletLogo,
        select: BlocProvider.of<PaymentCubit>(context).isWallets,
      ),
    );
  }
}