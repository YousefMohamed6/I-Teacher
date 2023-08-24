import 'package:flutter/material.dart';
import 'package:mrjoo/view_model/colors.dart';
import 'package:mrjoo/view_model/fonts.dart';
import 'package:mrjoo/views/widgets/custom_text.dart';

AppBar customAppBar({required String title, List<Widget>? actions}) {
  return AppBar(
    title: CustomText(
      text: title,
      fontSize: 24,
      fontFamily: kFontPacifico,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: true,
    backgroundColor: kAppBarColor,
    actions: actions,
  );
}
