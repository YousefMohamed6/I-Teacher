import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/images.dart';
import 'package:mrjoo/core/widgets/asset_image.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_cubit.dart';
import 'package:mrjoo/features/customer/presentation/views/widgets/full_name_text_feild.dart';
import 'package:mrjoo/features/customer/presentation/views/widgets/email_text_feild.dart';
import 'package:mrjoo/features/customer/presentation/views/widgets/next_button.dart';
import 'package:mrjoo/features/customer/presentation/views/widgets/phone_text_feild.dart';

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
          const FullNameTextFeild(),
          const SizedBox(height: 8),
          const EmailTextFeild(),
          const SizedBox(height: 8),
          const PhoneTextFeild(),
          const SizedBox(height: 24),
          const NextButton(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
