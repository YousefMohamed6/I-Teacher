import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/images.dart';
import 'package:mrjoo/core/widgets/asset_image.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_cubit.dart';
import 'package:mrjoo/features/customer/presentation/views/widgets/customer_full_name.dart';
import 'package:mrjoo/features/customer/presentation/views/widgets/next_button.dart';

class CustomerViewBody extends StatelessWidget {
  const CustomerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<CustomerCubit>(context).formKey,
      child: ListView(
        children: [
          CustomAssetImage(
            imagePath: kCustomerLogo,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
          ),
          const CustomerFullName(),
          const SizedBox(height: 8),
          CustomFormField(
            textInputType: TextInputType.emailAddress,
            hintText: 'Email',
            prefixIcon: const Icon(Icons.email),
            controller: BlocProvider.of<CustomerCubit>(context).email,
          ),
          const SizedBox(height: 8),
          CustomFormField(
            textInputType: TextInputType.number,
            hintText: 'Phone',
            prefixIcon: const Icon(Icons.phone),
            controller: BlocProvider.of<CustomerCubit>(context).phone,
          ),
          const SizedBox(height: 24),
          const NextButton(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
