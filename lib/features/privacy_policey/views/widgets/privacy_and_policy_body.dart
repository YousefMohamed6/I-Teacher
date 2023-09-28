import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_cubit.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_state.dart';
import 'package:mrjoo/features/privacy_policey/views/widgets/initial_privacy_view.dart';

class PrivacyAndPolicyBody extends StatelessWidget {
  const PrivacyAndPolicyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCubit, CustomerState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Failure) {
          return const Center(
            child: Text(
              'Some Thing Wrong , Please try again',
              style: TextStyle(fontSize: 20),
            ),
          );
        } else {
          return InitialPrivacyView(
            privacy: BlocProvider.of<CustomerCubit>(context).privacy,
          );
        }
      },
    );
  }
}
