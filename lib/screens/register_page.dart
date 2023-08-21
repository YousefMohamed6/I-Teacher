import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/consts/colors.dart';
import 'package:mrjoo/consts/fonts.dart';
import 'package:mrjoo/consts/images.dart';
import 'package:mrjoo/cubits/register/register_cubit.dart';
import 'package:mrjoo/cubits/register/register_state.dart';
import 'package:mrjoo/helper/show_message.dart';
import 'package:mrjoo/screens/chat_page.dart';
import 'package:mrjoo/widgets/asset_image.dart';
import 'package:mrjoo/widgets/avatar.dart';
import 'package:mrjoo/widgets/background.dart';
import 'package:mrjoo/widgets/custom_button.dart';
import 'package:mrjoo/widgets/custom_form_field.dart';
import 'package:mrjoo/widgets/custom_icon_button.dart';
import 'package:mrjoo/widgets/custom_row.dart';
import 'package:mrjoo/widgets/custom_text.dart';
import 'package:mrjoo/widgets/vertical_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:mrjoo/screens/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static String id = 'RegisterPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Register",
          fontSize: 20,
          fontFamily: kFontPacifico,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
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
        backgroundColor: kAppBarColor,
      ),
      body: Background(
        child: BlocConsumer<RegisterCubit, RegisterPageState>(
          listener: (context, state) {
            if (state is Success) {
              ShowMessage.show(context, msg: 'Success');
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
                    const VerticalSizedBox(48),
                    const Avatar(image: kAvaterLogo),
                    const VerticalSizedBox(48),
                    CustomFormField(
                      textInputType: TextInputType.name,
                      lablelText: 'Full Name',
                      controller:
                          BlocProvider.of<RegisterCubit>(context).displyName,
                      prefixIcon: const Icon(Icons.account_circle),
                    ),
                    const VerticalSizedBox(16),
                    CustomFormField(
                      textInputType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      lablelText: "Email",
                      hintText: "Enter Your Email",
                      controller: BlocProvider.of<RegisterCubit>(context).email,
                    ),
                    const VerticalSizedBox(16),
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
                    const VerticalSizedBox(24),
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
                    const VerticalSizedBox(16),
                    CustomRow(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      text: "already have an account",
                      textButton: "Sign In",
                      onPressed: () {
                        Navigator.pushNamed(context, LoginPage.id);
                      },
                    ),
                    const VerticalSizedBox(16),
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
