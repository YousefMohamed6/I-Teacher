import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/core/utils/helper/show_message.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/payment/presentation/views/payment_view.dart';
import 'package:mrjoo/features/student_data/presentation/manager/student_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StudentCubit, StudentState>(
      listener: (context, state) {
        if (state is Success<bool> && state.data) {
          context.pushNamed(
            PaymentView.routeName,
            extra: context.read<StudentCubit>().studentData,
          );
        } else if (state is Success<bool> && state.data == false) {
          ShowMessage.show(context,
              msg: AppLocalizations.of(context)!.unfound_id);
        }
      },
      child: CustomButton(
        onPressed: () async {
          var formKey = BlocProvider.of<StudentCubit>(context).formKey;
          if (formKey.currentState!.validate()) {
            BlocProvider.of<StudentCubit>(context).checkTeacherId();
          }
        },
        child: CustomText(
          text: AppLocalizations.of(context)!.next,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
