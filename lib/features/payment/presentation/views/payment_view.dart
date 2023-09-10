import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/fonts.dart';
import 'package:mrjoo/features/payment/data/payment_cubit/payment_cubit.dart';
import 'package:mrjoo/features/payment/data/payment_cubit/payment_state.dart';
import 'package:mrjoo/core/utils/show_message.dart';
import 'package:mrjoo/features/payment/presentation/views/widgets/check-payment_button.dart';
import 'package:mrjoo/features/payment/presentation/views/widgets/payment_view_body.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/payment/presentation/views/widgets/webview_body.dart';

class PaymentView extends StatelessWidget {
  static const String id = 'PaymentPage';

  const PaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBarColor,
          centerTitle: true,
          title: const CustomText(
            text: "Payment",
            fontFamily: kPacificoFont,
            fontSize: 24,
          ),
          actions: const [
            CheckPaymentButton(),
          ],
        ),
        body: Background(
          child: BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if (state is ProcessSuccess) {
                ShowMessage.show(context, msg: 'Follow Steps');
              } else if (state is ProcessFailure) {
                ShowMessage.show(context,
                    msg: 'SomeThing Wrong Check your data');
              }
            },
            builder: (context, state) {
              if (state is PaymentLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProcessSuccess) {
                var url = BlocProvider.of<PaymentCubit>(context).url;
                return WebViewBody(url: url);
              } else {
                return const PaymentViewBody();
              }
            },
          ),
        ),
      ),
    );
  }
}
