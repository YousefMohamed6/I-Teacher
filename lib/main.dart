import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/cubits/chat/chat_cubit.dart';
import 'package:mrjoo/cubits/course/course_cubit.dart';
import 'package:mrjoo/cubits/customer/customer_cubit.dart';
import 'package:mrjoo/cubits/login/login_cubit.dart';
import 'package:mrjoo/cubits/payment/payment_cubit.dart';
import 'package:mrjoo/cubits/register/register_cubit.dart';
import 'package:mrjoo/cubits/homepage/homepage_cubit.dart';
import 'package:mrjoo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mrjoo/screens/chat_page.dart';
import 'package:mrjoo/screens/login_page.dart';
import 'package:mrjoo/screens/payment_page.dart';
import 'package:mrjoo/screens/customer_page.dart';
import 'package:mrjoo/screens/register_page.dart';
import 'package:mrjoo/screens/splash_page.dart';
import 'package:mrjoo/screens/home_page.dart';
import 'package:mrjoo/theme/theme.dart';
import 'package:mrjoo/theme/theme_manger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MrJoo());
}

class MrJoo extends StatelessWidget {
  const MrJoo({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomepageCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => CustomerCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
        BlocProvider(
          create: (context) => PaymentCubit(),
        ),
        BlocProvider(
          create: (context) => CourseCubit(),
        ),
      ],
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeManger().themeMode,
        routes: {
          SplashPage.id: (context) => const SplashPage(),
          HomePage.id: (context) => const HomePage(),
          LoginPage.id: (context) => const LoginPage(),
          CustomerPage.id: (context) => const CustomerPage(),
          PaymentPage.id: (context) => const PaymentPage(),
          RegisterPage.id: (context) => const RegisterPage(),
          ChatPage.id: (context) => const ChatPage(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: ChatPage.id,
      ),
    );
  }
}
