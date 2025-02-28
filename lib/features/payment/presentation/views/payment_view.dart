import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/services/show_message.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/core/utils/constants/app_fonts.dart';
import 'package:mrjoo/core/widgets/app_drawer.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/payment/data/models/payment_methods/payment_methods.dart';
import 'package:mrjoo/features/payment/presentation/manager/payment_cubit.dart';
import 'package:mrjoo/features/payment/presentation/widgets/payment_view_body.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});
  static const String routeName = '/PaymentPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.kAppBarColor,
        centerTitle: true,
        title: CustomText(
          text: AppLocalizations.of(context)!.payment,
          fontFamily: AppFonts.kPacificoFont,
          fontSize: 20.sp,
          color: Colors.white,
        ),
      ),
      body: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {
          if (state is Success) {
            ShowMessage.show(context, msg: 'Follow Steps');
          } else if (state is Failure) {
            ShowMessage.show(context, msg: state.message);
          }
        },
        builder: (context, state) {
          if (state is Loading<List<PaymentMethodsModel>>) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Success<List<PaymentMethodsModel>>) {
            return const PaymentViewBody();
          } else {
            return const PaymentViewBody();
          }
        },
      ),
    );
  }
}
