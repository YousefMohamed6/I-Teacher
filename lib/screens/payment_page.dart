import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/consts/colors.dart';
import 'package:mrjoo/consts/fonts.dart';
import 'package:mrjoo/consts/images.dart';
import 'package:mrjoo/cubits/customer/customer_cubit.dart';
import 'package:mrjoo/cubits/payment/payment_cubit.dart';
import 'package:mrjoo/cubits/payment/payment_state.dart';
import 'package:mrjoo/helper/show_message.dart';
import 'package:mrjoo/screens/register_page.dart';
import 'package:mrjoo/widgets/asset_image.dart';
import 'package:mrjoo/widgets/background.dart';
import 'package:mrjoo/widgets/custom_button.dart';
import 'package:mrjoo/widgets/custom_text.dart';
import 'package:mrjoo/widgets/payment_item.dart';
import 'package:mrjoo/widgets/vertical_sizebox.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatelessWidget {
  static const String id = 'PaymentPage';

  const PaymentPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Payment",
          fontSize: 24,
          fontFamily: kFontPacifico,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: kAppBarColor,
      ),
      body: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {
<<<<<<< HEAD
          if (state is ProcessSuccess) {
            ShowMessage.show(context, msg: 'Follow steps');
          } else if (state is ProcessFailure) {
=======
          if (state is PaymentLoading) {
            BlocProvider.of<PaymentCubit>(context).isLoading = true;
          } else if (state is PaymentSuccess) {
            ShowMessage.show(context, msg: 'Follow Link');
            BlocProvider.of<PaymentCubit>(context).isLoading = false;
          } else if (state is PaymentFailure) {
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840
            ShowMessage.show(context, msg: 'Faild');
          }
          if (state is Paid) {
            ShowMessage.show(context, msg: 'Payment Success');
            Navigator.popAndPushNamed(context, RegisterPage.id);
<<<<<<< HEAD
          } else if (state is PaymentFaild) {
=======
          } else if (state is UnPaid) {
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840
            ShowMessage.show(context, msg: 'You Not Register');
          }
        },
        builder: (context, state) {
          if (state is PaymentLoading) {
<<<<<<< HEAD
            return const Background(
                child: Center(child: CircularProgressIndicator()));
          } else if (state is ProcessSuccess) {
=======
            return const Center(child: CircularProgressIndicator());
          } else if (state is PaymentSuccess) {
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840
            return WebViewWidget(
              controller: WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..setBackgroundColor(const Color(0x00000000))
                ..setNavigationDelegate(
                  NavigationDelegate(
<<<<<<< HEAD
                    onProgress: (int progress) {},
                    onPageStarted: (String url) {
                      BlocProvider.of<PaymentCubit>(context).paymentLoading();
                    },
                    onPageFinished: (String url) {
                      BlocProvider.of<PaymentCubit>(context).checkPayment();
                    },
                    onWebResourceError: (WebResourceError error) {},
                    onNavigationRequest: (NavigationRequest request) {
                      if (request.url.startsWith('https://flutter.dev')) {
=======
                    onProgress: (int progress) {
                      // Update loading bar.
                    },
                    onPageStarted: (String url) {},
                    onPageFinished: (String url) {},
                    onWebResourceError: (WebResourceError error) {},
                    onNavigationRequest: (NavigationRequest request) {
                      if (request.url.startsWith('')) {
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840
                        return NavigationDecision.prevent;
                      }
                      return NavigationDecision.navigate;
                    },
                  ),
                )
                ..loadRequest(
                  Uri.parse(BlocProvider.of<PaymentCubit>(context).url),
                ),
            );
          } else {
            return Background(
              child: ListView(
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
                      BlocProvider.of<PaymentCubit>(context).visa(
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
              ),
            );
          }
        },
      ),
    );
  }
}
