import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/consts/colors.dart';
import 'package:mrjoo/consts/fonts.dart';
import 'package:mrjoo/consts/images.dart';
import 'package:mrjoo/cubits/chat/chat_cubit.dart';
import 'package:mrjoo/cubits/login/login_cubit.dart';
import 'package:mrjoo/cubits/login/login_state.dart';
import 'package:mrjoo/helper/show_message.dart';
import 'package:mrjoo/screens/chat_page.dart';
import 'package:mrjoo/widgets/avatar.dart';
import 'package:mrjoo/widgets/background.dart';
import 'package:mrjoo/widgets/custom_button.dart';
import 'package:mrjoo/widgets/custom_form_field.dart';
import 'package:mrjoo/widgets/custom_row.dart';
import 'package:mrjoo/widgets/custom_text.dart';
import 'package:mrjoo/widgets/custom_text_button.dart';
import 'package:mrjoo/widgets/vertical_sizebox.dart';
import 'package:mrjoo/screens/customer_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String id = "LoginPage";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: "Login",
            fontSize: 24,
            fontFamily: kFontPacifico,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          backgroundColor: kAppBarColor,
        ),
        body: Background(
          child: BlocConsumer<LoginCubit, LoginPageState>(
            listener: (context, state) {
              if (state is LoginLoading) {
              } else if (state is LoginSuccess) {
                ShowMessage.show(context, msg: 'Login');
                BlocProvider.of<ChatCubit>(context).getMessages();
                Navigator.popAndPushNamed(context, ChatPage.id);
              } else if (state is LoginFialure) {
                ShowMessage.show(context, msg: state.errMessage);
              }
              if (state is RestSuccess) {
                ShowMessage.show(context, msg: 'Success Check Gmail');
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView(
                  children: [
                    const VerticalSizedBox(48),
                    const Avatar(image: kAvaterLogo),
                    const VerticalSizedBox(48),
                    Form(
                        key: BlocProvider.of<LoginCubit>(context).emailkey,
                        child: CustomFormField(
                          textInputType: TextInputType.emailAddress,
                          prefixIcon: const Icon(Icons.email),
                          lablelText: "Email",
                          hintText: "Enter Your Email",
                          controller:
                              BlocProvider.of<LoginCubit>(context).email,
                        )),
                    const VerticalSizedBox(16),
                    Form(
                      key: BlocProvider.of<LoginCubit>(context).passwordKey,
                      child: CustomFormField(
                        lablelText: "Password",
                        hintText: "Enter your Password",
                        textInputType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            BlocProvider.of<LoginCubit>(context)
                                .changeObscureText();
                          },
                          icon: BlocProvider.of<LoginCubit>(context).obscuretext
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        obscureText:
                            BlocProvider.of<LoginCubit>(context).obscuretext,
                        controller:
                            BlocProvider.of<LoginCubit>(context).password,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextButton(
                          text: 'Forget Password',
                          fontWeight: FontWeight.bold,
                          onPressed: () async {
                            if (BlocProvider.of<LoginCubit>(context)
                                .emailkey
                                .currentState!
                                .validate()) {
                              BlocProvider.of<LoginCubit>(context)
                                  .restPassword();
                            }
                          },
                        ),
                      ],
                    ),
                    const VerticalSizedBox(24),
                    CustomButton(
                      color: Colors.white,
                      onPressed: () async {
                        if (BlocProvider.of<LoginCubit>(context)
                            .passwordKey
                            .currentState!
                            .validate()) {}
                        if (BlocProvider.of<LoginCubit>(context)
                            .emailkey
                            .currentState!
                            .validate()) {
                          BlocProvider.of<LoginCubit>(context).loginUser();
                        }
                      },
                      child: const CustomText(
                        text: 'Login',
                        color: kPrimryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const VerticalSizedBox(24),
                    CustomRow(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      text: "don't have any account?",
                      textButton: "Register Now",
                      onPressed: () {
                        Navigator.pushNamed(context, CustomerPage.id);
                      },
                    ),
                    const VerticalSizedBox(16),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
