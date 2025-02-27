import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/services/show_message.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/widgets/app_drawer.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/auth/rest_Password/persentation/manager/rest_password_cubit.dart';
import 'package:mrjoo/features/auth/rest_Password/persentation/view/rest_password_view_body.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class RestPasswordView extends StatelessWidget {
  const RestPasswordView({super.key});
  static const String routeName = "/ForgetPassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: AppLocalizations.of(context)!.rest_password,
          fontSize: 20.sp,
          fontFamily: AppFonts.kPacificoFont,
          color: Colors.white,
        ),
        backgroundColor: AppColors.kAppBarColor,
      ),
      body: BlocListener<RestPasswordCubit, RestPasswordState>(
        listener: (context, state) {
          if (state is RestPasswordSucess) {
            ShowMessage.show(context, msg: "Success check Gmail");
            Navigator.pop(context);
          }
          if (state is RestPasswordFailure) {
            ShowMessage.show(context, msg: state.errorMessage);
          }
        },
        child: const Background(child: ForgetPasswodBody()),
      ),
    );
  }
}
