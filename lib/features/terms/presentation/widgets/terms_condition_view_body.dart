import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_cubit.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_state.dart';
import 'package:mrjoo/features/terms/presentation/widgets/initial_trems_view.dart';

class TermsConditionsBody extends StatelessWidget {
  const TermsConditionsBody({super.key});

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
              'Some Thing Wrong ',
              style: TextStyle(fontSize: 24),
            ),
          );
        } else {
          return InitialTermsView(
            trems: BlocProvider.of<CustomerCubit>(context).terms,
          );
        }
      },
    );
  }
}
