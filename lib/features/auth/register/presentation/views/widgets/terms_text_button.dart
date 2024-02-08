import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_cubit.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_state.dart';
import 'package:mrjoo/features/terms/views/terms_and_conditions_view.dart';

class TremsTextButton extends StatelessWidget {
  const TremsTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCubit, CustomerState>(
      builder: (context, state) {
        return TextButton(
          onPressed: () {
            BlocProvider.of<CustomerCubit>(context)
                .fetchTremsAndPrivacy(language: 'ar');
            Navigator.pushNamed(context, TermsConditionsView.id);
          },
          child: const Text(
            'Terms & Conditons',
            style: TextStyle(
              fontSize: 15.5,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
