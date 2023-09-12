import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mrjoo/core/utils/constants/text.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_cubit.dart';
import 'package:mrjoo/features/chat/data/model/message_model.dart';
import 'package:mrjoo/features/chat/data/model/user_model.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_cubit.dart';
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
  await Hive.initFlutter();
  Hive.registerAdapter<MessageModel>(MessageModelAdapter());
  await Hive.openBox<MessageModel>(kMessageBox);
  Hive.registerAdapter<UserModel>(UserModelAdapter());
  await Hive.openBox<UserModel>(kUserBox);
  runApp(const MrJoo());
}

class MrJoo extends StatelessWidget {
  const MrJoo({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CustomerCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
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
