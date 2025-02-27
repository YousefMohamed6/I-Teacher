import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/privacy_policey/presentation/manager/privacy_policy_cubit.dart';
import 'package:mrjoo/features/privacy_policey/presentation/widgets/initial_privacy_view.dart';

class PrivacyAndPolicyBody extends StatelessWidget {
  const PrivacyAndPolicyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivacyPolicyCubit, PrivacyPolicyState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Error) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(fontSize: 20),
            ),
          );
        } else {
          return InitialPrivacyView(
            privacy: BlocProvider.of<PrivacyPolicyCubit>(context).privacy,
          );
        }
      },
    );
  }
}
