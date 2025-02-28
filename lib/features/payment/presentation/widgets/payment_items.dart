import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/payment/data/models/payment_methods/payment_methods.dart';
import 'package:mrjoo/features/payment/presentation/manager/payment_cubit.dart';
import 'package:mrjoo/features/payment/presentation/widgets/payment_item.dart';

class PaymentItems extends StatelessWidget {
  const PaymentItems({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentCubit = context.watch<PaymentCubit>();
    return BlocBuilder<PaymentCubit, PaymentState>(
      buildWhen: (previous, current) =>
          current is Success<List<PaymentMethodsModel>>,
      builder: (context, state) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: paymentCubit.paymentMethods.length,
          itemBuilder: (context, index) => PaymentItem(
            paymentMethodsModel: paymentCubit.paymentMethods[index],
            onTap: () {},
          ),
        );
      },
    );
  }
}
