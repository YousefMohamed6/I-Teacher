import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/core/utils/helper/show_message.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/core/widgets/webview_body.dart';
import 'package:mrjoo/features/auth/register/presentation/views/register_view.dart';
import 'package:mrjoo/features/payment/data/models/payment_status/payment_status.dart';
import 'package:mrjoo/features/payment/presentation/manager/payment_cubit.dart';
import 'package:mrjoo/features/payment/presentation/widgets/payment_button.dart';
import 'package:mrjoo/features/payment/presentation/widgets/payment_company_image.dart';
import 'package:mrjoo/features/payment/presentation/widgets/teacher_item.dart';
import 'package:mrjoo/features/profile/data/model/teacher_model.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PaymentCubit>();
    return Background(
      child: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {
          if (state is Success<bool> && state.data) {
            context.pushReplacementNamed(
              RegisterView.routeName,
              extra: cubit.studentModel,
            );
          } else if (state is Failure<bool>) {
            ShowMessage.show(context, msg: AppLocalizations.of(context)!.fail);
          } else if (state is Failure) {
            ShowMessage.show(context, msg: state.message);
          }
        },
        buildWhen: (previous, current) =>
            current is Loading<PaymentStatus> ||
            current is Success<PaymentStatus> ||
            current is Failure<PaymentStatus> ||
            current is Loading<TeacherModel> ||
            current is Success<TeacherModel> ||
            current is Failure<TeacherModel>,
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox(),
            loading: () => Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
            success: (paymentStatus) {
              if (paymentStatus is PaymentStatus) {
                return WebViewBody(
                  url: paymentStatus.data!.url!,
                  onUrlChange: cubit.checkPayment,
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PaymentCompanyImage(),
                  TeacherItem(teacherModel: cubit.teacherModel),
                  PaymentButton(),
                ],
              );
            },
            failure: (errorMessage) => Center(
              child: CustomText(
                text: errorMessage,
              ),
            ),
          );
        },
      ),
    );
  }
}
