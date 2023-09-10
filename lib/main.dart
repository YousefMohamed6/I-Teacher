import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/theme/theme_cubit.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_cubit.dart';
import 'package:mrjoo/features/home/data/home_cubit/home_cubit.dart';
import 'package:mrjoo/core/utils/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mrjoo/features/chat/presentation/views/chat_View.dart';
import 'package:mrjoo/features/home/presentation/views/home_view.dart';
import 'package:mrjoo/features/login/presentation/views/login_view.dart';
import 'package:mrjoo/features/payment/presentation/views/payment_view.dart';
import 'package:mrjoo/features/customer/presentation/views/customer_view.dart';
import 'package:mrjoo/features/register/presentation/views/register_view.dart';
import 'package:mrjoo/features/splash/views/splash_view.dart';
import 'package:mrjoo/core/utils/simple_bloc_obsever.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObServer();
  runApp(const MrJoo());
}

class MrJoo extends StatelessWidget {
  const MrJoo({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeViewCubit(),
        ),
        BlocProvider(
          create: (context) => CustomerCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          SplashView.id: (context) => const SplashView(),
          HomeView.id: (context) => const HomeView(),
          LoginView.id: (context) => const LoginView(),
          CustomerView.id: (context) => const CustomerView(),
          PaymentView.id: (context) => const PaymentView(),
          RegisterView.id: (context) => const RegisterView(),
          ChatView.id: (context) => const ChatView(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: SplashView.id,
      ),
    );
  }
}
