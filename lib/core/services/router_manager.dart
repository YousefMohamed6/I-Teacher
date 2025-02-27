import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:mrjoo/features/auth/login/presentation/views/login_view.dart';
import 'package:mrjoo/features/auth/rest_Password/persentation/manager/rest_password_cubit.dart';
import 'package:mrjoo/features/auth/rest_Password/persentation/view/rest_password_view.dart';
import 'package:mrjoo/features/chat/presentation/views/chat_view.dart';
import 'package:mrjoo/features/payment/di/payment_service.dart';
import 'package:mrjoo/features/payment/domain/repos/i_payment_repo.dart';
import 'package:mrjoo/features/payment/presentation/manager/payment_cubit.dart';
import 'package:mrjoo/features/payment/presentation/views/payment_view.dart';
import 'package:mrjoo/features/profile/presentation/manager/profile_cubit.dart';
import 'package:mrjoo/features/profile/presentation/views/profile_view.dart';
import 'package:mrjoo/features/settings/presentation/views/setting_view.dart';
import 'package:mrjoo/features/splash/views/splash_view.dart';
import 'package:mrjoo/features/student_data/data/model/customer_model.dart';
import 'package:mrjoo/features/student_data/presentation/manager/customer_cubit.dart';
import 'package:mrjoo/features/student_data/presentation/views/customer_view.dart';

abstract class RouterManager {
  static GoRouter routConfig = GoRouter(
    initialLocation: SplashView.path,
    routes: [
      GoRoute(
        path: SplashView.path,
        builder: (context, state) {
          return SplashView();
        },
      ),
      GoRoute(
        path: SettingsView.routeName,
        name: SettingsView.routeName,
        builder: (context, state) {
          return SettingsView();
        },
      ),
      GoRoute(
        path: ProfileView.routeName,
        name: ProfileView.routeName,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => ProfileCubit(),
            child: ProfileView(),
          );
        },
      ),
      GoRoute(
        path: LoginView.routeName,
        name: LoginView.routeName,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginView(),
          );
        },
      ),
      GoRoute(
        path: RestPasswordView.routeName,
        name: RestPasswordView.routeName,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => RestPasswordCubit(),
            child: RestPasswordView(),
          );
        },
      ),
      GoRoute(
        path: CustomerView.routeName,
        name: CustomerView.routeName,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => CustomerCubit(),
            child: CustomerView(),
          );
        },
      ),
      GoRoute(
        path: PaymentView.routeName,
        name: PaymentView.routeName,
        builder: (context, state) {
          PaymentService().initDi();
          final customer = state.extra as CustomerModel;
          return RepositoryProvider(
            create: (context) => GetIt.instance<IPaymentRepo>(),
            child: BlocProvider(
              create: (context) => GetIt.instance<PaymentCubit>()
                ..initState(customer)
                ..fetchPaymentMethods(),
              child: PaymentView(),
            ),
          );
        },
      ),
      GoRoute(
        path: ChatView.id,
        name: ChatView.id,
        builder: (context, state) {
          return ChatView();
        },
      ),
    ],
  );
}
// {
//           SplashView.id: (context) => const SplashView(),
//           HomeView.id: (context) => const HomeView(),
//           LoginView.id: (context) => const LoginView(),
//           CustomerView.id: (context) => const CustomerView(),
//           PaymentView.id: (context) => const PaymentView(),
//           ChatView.id: (context) => const ChatView(),
//           CourseView.id: (context) => const CourseView(),
//           TermsConditionsView.id: (context) => const TermsConditionsView(),
//           PrivacyPolicyView.id: (context) => const PrivacyPolicyView(),
//           ForgetPasswordView.id: (context) => const ForgetPasswordView(),
//         }
