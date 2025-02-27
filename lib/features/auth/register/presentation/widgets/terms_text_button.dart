import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/features/student_data/presentation/manager/customer_cubit.dart';
import 'package:mrjoo/features/student_data/presentation/manager/customer_state.dart';
import 'package:mrjoo/features/privacy_policey/presentation/views/privacy_and_policy.dart';

class TremsTextButton extends StatelessWidget {
  const TremsTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCubit, CustomerState>(
      builder: (context, state) {
        return TextButton(
          style: const ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.zero)),
          onPressed: () {
            context.pushNamed(PrivacyPolicyView.id);
          },
          child: Text(
            'Terms & Conditons',
            style: TextStyle(
              fontSize: MediaQuery.sizeOf(context).height * 0.020,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
