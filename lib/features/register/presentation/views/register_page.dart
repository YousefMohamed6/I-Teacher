import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/images.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_cubit.dart';
import 'package:mrjoo/features/payment/data/payment_cubit/payment_cubit.dart';
import 'package:mrjoo/features/register/data/register_cubit/register_cubit.dart';
import 'package:mrjoo/features/register/data/register_cubit/register_state.dart';
import 'package:mrjoo/core/utils/show_message.dart';
import 'package:mrjoo/features/chat/presentation/views/chat_page.dart';
import 'package:mrjoo/features/login/presentation/views/login_page.dart';
import 'package:mrjoo/core/widgets/asset_image.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_button.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/features/home/presentation/views/widgets/custom_row.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static String id = 'RegisterPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Register"),
        actions: [
          CustomIconButton(
            onPressed: () {
              BlocProvider.of<RegisterCubit>(context).singInWithGoogle();
            },
            icon: const CustomAssetImage(
              imagePath: kGoogleLogo,
              height: 32,
            ),
            iconSize: 50,
          )
        ],
      ),
      body: Background(
        child: BlocConsumer<RegisterCubit, RegisterPageState>(
          listener: (context, state) {
            if (state is Success) {
              ShowMessage.show(context, msg: 'Success');
              BlocProvider.of<ChatCubit>(context).getMessages();
              BlocProvider.of<PaymentCubit>(context).invoiceId = 0;
              Navigator.popAndPushNamed(context, ChatPage.id);
            } else if (state is Failure) {
              ShowMessage.show(context, msg: 'Sign Up is Faild');
            } else if (state is RegisterFailure) {
              ShowMessage.show(context, msg: state.errMessage);
            }
          },
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Form(
                key: BlocProvider.of<RegisterCubit>(context).formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 48),
                    const Avatar(image: kAvaterLogo),
                    const SizedBox(height: 48),
                    CustomFormField(
                      textInputType: TextInputType.name,
                      lablelText: 'Full Name',
                      controller:
                          BlocProvider.of<RegisterCubit>(context).displyName,
                      prefixIcon: const Icon(Icons.account_circle),
                    ),
                    const SizedBox(height:16),
                    CustomFormField(
                      textInputType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      lablelText: "Email",
                      hintText: "Enter Your Email",
                      controller: BlocProvider.of<RegisterCubit>(context).email,
                    ),
                    const SizedBox(height:16),
                    CustomFormField(
                      textInputType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          BlocProvider.of<RegisterCubit>(context)
                              .changeObscureText();
                        },
                        icon:
                            BlocProvider.of<RegisterCubit>(context).obscuretext
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                      ),
                      prefixIcon: const Icon(Icons.security_outlined),
                      lablelText: "Password",
                      hintText: "Enter Your Password",
                      obscureText:
                          BlocProvider.of<RegisterCubit>(context).obscuretext,
                      controller:
                          BlocProvider.of<RegisterCubit>(context).password,
                    ),
                    const SizedBox(height:24),
                    CustomButton(
                      color: Colors.white,
                      onPressed: () async {
                        if (BlocProvider.of<RegisterCubit>(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          BlocProvider.of<RegisterCubit>(context).register();
                        }
                      },
                      child: const CustomText(
                        text: 'Register',
                        fontSize: 16,
                        color: kPrimryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height:16),
                    CustomRow(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      text: "already have an account",
                      textButton: "Sign In",
                      onPressed: () {
                        Navigator.pushNamed(context, LoginPage.id);
                      },
                    ),
                    const SizedBox(height:16),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
