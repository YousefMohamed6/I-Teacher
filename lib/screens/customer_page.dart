import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/consts/colors.dart';
import 'package:mrjoo/consts/fonts.dart';
import 'package:mrjoo/consts/images.dart';
import 'package:mrjoo/cubits/customer/customer_cubit.dart';
import 'package:mrjoo/cubits/customer/customer_state.dart';
import 'package:mrjoo/widgets/asset_image.dart';
import 'package:mrjoo/widgets/background.dart';
import 'package:mrjoo/widgets/custom_button.dart';
import 'package:mrjoo/widgets/custom_form_field.dart';
import 'package:mrjoo/widgets/custom_text.dart';
import 'package:mrjoo/screens/payment_page.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});
  static String id = 'CustomerPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Customer",
          fontSize: 24,
          fontFamily: kFontPacifico,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: kAppBarColor,
      ),
      body: Background(
<<<<<<< HEAD
        child: BlocConsumer<CustomerCubit, CustomerPageState>(
          listener: (context, state) {},
=======
        child: BlocBuilder<CustomerCubit, CustomerPageState>(
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840
          builder: (context, state) {
            return ListView(
              children: [
                CustomAssetImage(
                  imagePath: kCustomerLogo,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.42,
                ),
                Form(
                  key: BlocProvider.of<CustomerCubit>(context).formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomFormField(
                              textInputType: TextInputType.name,
                              hintText: 'First name',
                              prefixIcon: const Icon(Icons.person),
                              controller:
                                  BlocProvider.of<CustomerCubit>(context)
                                      .fristName,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: CustomFormField(
                              textInputType: TextInputType.name,
                              hintText: 'Last name',
                              prefixIcon: const Icon(Icons.person),
                              controller:
                                  BlocProvider.of<CustomerCubit>(context)
                                      .lastName,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      CustomFormField(
                        textInputType: TextInputType.emailAddress,
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        controller:
                            BlocProvider.of<CustomerCubit>(context).email,
                      ),
                      const SizedBox(height: 8),
                      CustomFormField(
                        textInputType: TextInputType.number,
                        hintText: 'Phone',
                        prefixIcon: const Icon(Icons.phone),
                        controller:
                            BlocProvider.of<CustomerCubit>(context).phone,
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        onPressed: () async {
                          BlocProvider.of<CustomerCubit>(context)
                              .changeStateLoading();
                          if (BlocProvider.of<CustomerCubit>(context)
                              .formKey
                              .currentState!
                              .validate()) {
<<<<<<< HEAD
                            BlocProvider.of<CustomerCubit>(context).customer();
=======
                            BlocProvider.of<CustomerCubit>(context)
                                .customer();
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840
                            Navigator.pushNamed(context, PaymentPage.id);
                          }
                          BlocProvider.of<CustomerCubit>(context)
                              .changeStateLoading();
                        },
                        color: kMainTextColor,
                        child: const CustomText(
                          text: 'Pay Now',
                          color: kPrimryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
