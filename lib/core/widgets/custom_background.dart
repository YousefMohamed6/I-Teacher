import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/student_data/presentation/manager/customer_cubit.dart';
import 'package:mrjoo/features/student_data/presentation/manager/customer_state.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCubit, CustomerState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.sizeOf(context).height * 0.75,
          width: 400,
          padding: const EdgeInsets.all(16),
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            color: Colors.transparent,
          ),
          child: ListView(
            children: [
              Text(
                data,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
