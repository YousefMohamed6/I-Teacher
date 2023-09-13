import 'package:flutter/material.dart';
import 'package:mrjoo/features/payment/presentation/views/widgets/webview_body.dart';

class CourseViewBody extends StatelessWidget {
  const CourseViewBody({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return WebViewBody(url: url);
  }
}
