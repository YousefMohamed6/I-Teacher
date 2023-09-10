import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/customer/presentation/views/widgets/customer_view_body.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({super.key});
  static String id = 'CustomerView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(text: "Customer"),
        backgroundColor: kAppBarColor,
      ),
      body: const Background(
        child: CustomerViewBody(),
      ),
    );
  }
}
