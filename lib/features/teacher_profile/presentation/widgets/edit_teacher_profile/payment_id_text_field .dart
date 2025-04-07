import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/widgets/custom_form_field.dart';
import 'package:iteacher/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:iteacher/generated/app_localizations.dart';

class PaymentIDTextField extends StatelessWidget {
  const PaymentIDTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      textInputType: TextInputType.multiline,
      prefixIcon: const Icon(Icons.info_outline),
      lablelText: AppLocalizations.of(context)!.payment_id,
      hintText: AppLocalizations.of(context)!.payment_id,
      controller:
          BlocProvider.of<TeacherProfileCubit>(context).paymentIdTextController,
    );
  }
}
