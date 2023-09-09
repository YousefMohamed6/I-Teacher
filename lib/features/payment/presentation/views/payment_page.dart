import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/images.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_cubit.dart';
import 'package:mrjoo/features/payment/data/payment_cubit/payment_cubit.dart';
import 'package:mrjoo/features/payment/data/payment_cubit/payment_state.dart';
import 'package:mrjoo/core/utils/show_message.dart';
import 'package:mrjoo/features/register/presentation/views/register_page.dart';
import 'package:mrjoo/core/widgets/asset_image.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/payment/presentation/views/widgets/payment_item.dart';
import 'package:mrjoo/core/widgets/vertical_sizebox.dart';
import 'package:mrjoo/features/payment/presentation/views/widgets/webview.dart';

class PaymentPage extends StatelessWidget {
  static const String id = 'PaymentPage';

  const PaymentPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Payment"),
        actions: [
          CustomIconButton(
            onPressed: () {
              BlocProvider.of<PaymentCubit>(context).checkPayment();
            },
            icon: const Icon(Icons.person_add),
            iconSize: 32,
          )
        ],
      ),
      body: Background(
        child: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is ProcessSuccess) {
              ShowMessage.show(context, msg: 'Follow steps');
            } else if (state is ProcessFailure) {
              ShowMessage.show(context, msg: 'Faild');
            }
            if (state is Paid) {
              ShowMessage.show(context, msg: 'Payment Success');
              Navigator.popAndPushNamed(context, RegisterPage.id);
            } else if (state is PaymentFaild) {
              ShowMessage.show(context, msg: 'You Not Register');
            }
          },
          builder: (context, state) {
            if (state is PaymentLoading) {
              return const Background(
                  child: Center(child: CircularProgressIndicator()));
            } else if (state is ProcessSuccess) {
              return const WebView();
            } else {
              return ListView(
                children: [
                  const VerticalSizedBox(96),
                  Container(
                    width: (MediaQuery.of(context).size.width * 0.42) / 4,
                    height: (MediaQuery.of(context).size.height * 0.42) / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 48),
                    child: const CustomAssetImage(
                      imagePath: kFawaterakLogo,
                      height: 300,
                      width: 300,
                    ),
                  ),
                  const VerticalSizedBox(48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<PaymentCubit>(context)
                              .changePaymentType();
                        },
                        child: PaymentItem(
                            imagePath: kVisaLogo,
                            select:
                                BlocProvider.of<PaymentCubit>(context).isVisa),
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<PaymentCubit>(context)
                              .changePaymentType();
                        },
                        child: PaymentItem(
                            imagePath: kWalletLogo,
                            select: BlocProvider.of<PaymentCubit>(context)
                                .isWallets),
                      ),
                    ],
                  ),
                  const VerticalSizedBox(32),
                  CustomButton(
                    color: kMainTextColor,
                    onPressed: () {
                      BlocProvider.of<PaymentCubit>(context).pay(
                          customerModel: BlocProvider.of<CustomerCubit>(context)
                              .customerData);
                    },
                    child: const CustomText(
                      text: 'Pay',
                      color: kPrimryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
