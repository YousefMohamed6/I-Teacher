import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_cubit.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_state.dart';
import 'package:mrjoo/features/privacy_policey/views/privacy_and_policy.dart';

class PrivacyTextButton extends StatelessWidget {
  const PrivacyTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCubit, CustomerState>(
      builder: (context, state) {
        return TextButton(
          onPressed: () {
            BlocProvider.of<CustomerCubit>(context)
                .fetchTremsAndPrivacy(language: 'ar');
            Navigator.pushNamed(context, PrivacyPolicyView.id);
          },
          child: const Text(
            'Privacy & Policy',
            style: TextStyle(
              fontSize: 15.5,
              color: kPrimryColor,
            ),
          ),
        );
      },
    );
  }
}
