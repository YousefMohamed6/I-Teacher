import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/payment/data/payment_cubit/payment_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewBody extends StatefulWidget {
  const WebViewBody({
    super.key,
  });

  @override
  State<WebViewBody> createState() => _WebViewBodyState();
}

class _WebViewBodyState extends State<WebViewBody> {
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0xffffffff))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {},
            onPageStarted: (String url) {
              () {};
            },
            onPageFinished: (String url) {},
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.startsWith('https://flutter.dev')) {
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
  }
}
