import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/features/auth/login/data/repos/login_repo_impl.dart';
import 'package:mrjoo/features/auth/login/di/login_service.dart';
import 'package:mrjoo/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:mrjoo/features/auth/login/presentation/views/login_view.dart';
import 'package:mrjoo/features/auth/register/di/register_service.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:mrjoo/features/auth/register/presentation/views/register_view.dart';
import 'package:mrjoo/features/auth/rest_Password/persentation/manager/rest_password_cubit.dart';
import 'package:mrjoo/features/auth/rest_Password/persentation/view/rest_password_view.dart';
import 'package:mrjoo/features/chat/di/chat_service.dart';
import 'package:mrjoo/features/chat/domin/repos/i_chat_repo.dart';
import 'package:mrjoo/features/chat/presentation/manager/chat_cubit.dart';
import 'package:mrjoo/features/chat/presentation/views/chat_view.dart';
import 'package:mrjoo/features/chatbot/di/chatbot_service.dart';
import 'package:mrjoo/features/chatbot/domin/repos/i_chatbot_repo.dart';
import 'package:mrjoo/features/chatbot/presentation/manager/chatbot_cubit.dart';
import 'package:mrjoo/features/chatbot/presentation/views/chatbot_view.dart';
import 'package:mrjoo/features/course/di/course_service.dart';
import 'package:mrjoo/features/course/domain/repos/I_course_repo.dart';
import 'package:mrjoo/features/course/presentation/manager/course_cubit.dart';
import 'package:mrjoo/features/course/presentation/views/course_view.dart';
import 'package:mrjoo/features/payment/di/payment_service.dart';
import 'package:mrjoo/features/payment/domain/repos/i_payment_repo.dart';
import 'package:mrjoo/features/payment/presentation/manager/payment_cubit.dart';
import 'package:mrjoo/features/payment/presentation/views/payment_view.dart';
import 'package:mrjoo/features/profile/data/model/teacher_model.dart';
import 'package:mrjoo/features/profile/presentation/manager/profile_cubit.dart';
import 'package:mrjoo/features/profile/presentation/views/profile_view.dart';
import 'package:mrjoo/features/settings/presentation/views/setting_view.dart';
import 'package:mrjoo/features/splash/presentation/views/splash_view.dart';
import 'package:mrjoo/features/student_data/data/model/student_model.dart';
import 'package:mrjoo/features/student_data/di/student_service.dart';
import 'package:mrjoo/features/student_data/domain/repos/i_student_repo.dart';
import 'package:mrjoo/features/student_data/presentation/manager/student_cubit.dart';
import 'package:mrjoo/features/student_data/presentation/views/student_view.dart';
import 'package:mrjoo/features/teacher_profile/di/teacher_profile_service.dart';
import 'package:mrjoo/features/teacher_profile/domin/repos/i_teacher_profile_repo.dart';
import 'package:mrjoo/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:mrjoo/features/teacher_profile/presentation/views/teacher_profile_view.dart';
import 'package:mrjoo/features/terms_and_conditions/di/terms_and_conditions_service.dart';
import 'package:mrjoo/features/terms_and_conditions/domain/repos/i_terms_and_conditions.dart';
import 'package:mrjoo/features/terms_and_conditions/presentation/manager/terms_and_conditions_cubit.dart';
import 'package:mrjoo/features/terms_and_conditions/presentation/views/terms_and_conditions.dart';

abstract class RouterManager {
  static GoRouter routConfig = GoRouter(
    initialLocation: SplashView.routeName,
    routes: [
      GoRoute(
        path: SplashView.routeName,
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
          final teacherModel = state.extra as TeacherModel;
          return BlocProvider(
            create: (context) =>
                ProfileCubit()..initState(teacherModel: teacherModel),
            child: ProfileView(),
          );
        },
      ),
      GoRoute(
        path: LoginView.routeName,
        name: LoginView.routeName,
        builder: (context, state) {
          LoginService().initDi();
          return RepositoryProvider(
            create: (context) => GetIt.I<LoginRepoImpl>(),
            child: BlocProvider(
              create: (context) => GetIt.I<LoginCubit>(),
              child: LoginView(),
            ),
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
        path: StudentView.routeName,
        name: StudentView.routeName,
        builder: (context, state) {
          StudentService().initDi();
          return RepositoryProvider(
            create: (context) => GetIt.instance<IStudentRepo>(),
            child: BlocProvider(
              create: (context) => GetIt.instance<StudentCubit>(),
              child: StudentView(),
            ),
          );
        },
      ),
      GoRoute(
        path: PaymentView.routeName,
        name: PaymentView.routeName,
        builder: (context, state) {
          PaymentService().initDi();
          final customer = state.extra as StudentModel;
          return RepositoryProvider(
            create: (context) => GetIt.instance<IPaymentRepo>(),
            child: BlocProvider(
              create: (context) => GetIt.instance<PaymentCubit>()
                ..initState(customer)
                ..getTeacherData(),
              child: PaymentView(),
            ),
          );
        },
      ),
      GoRoute(
        path: ChatView.routeName,
        name: ChatView.routeName,
        builder: (context, state) {
          final student = state.extra as StudentModel;
          ChatService().initDi();
          return RepositoryProvider(
            create: (context) => GetIt.instance<IChatRepo>(),
            child: BlocProvider(
              create: (context) => GetIt.instance<ChatCubit>()
                ..user = student
                ..listenToMessages(),
              child: ChatView(),
            ),
          );
        },
      ),
      GoRoute(
        path: CourseView.routeName,
        name: CourseView.routeName,
        builder: (context, state) {
          CourseService().initDi();
          return RepositoryProvider(
            create: (context) => GetIt.instance<ICourseRepo>(),
            child: BlocProvider(
              create: (context) =>
                  GetIt.instance<CourseCubit>()..fetchCourseLink(),
              child: CourseView(),
            ),
          );
        },
      ),
      GoRoute(
        path: RegisterView.routeName,
        name: RegisterView.routeName,
        builder: (context, state) {
          RegisterService().initDi();
          return BlocProvider(
            create: (context) => GetIt.instance<RegisterCubit>(),
            child: RegisterView(),
          );
        },
      ),
      GoRoute(
        path: TermsAndConditionsView.routeName,
        name: TermsAndConditionsView.routeName,
        builder: (context, state) {
          TermsAndConditionsService().initDi();
          return RepositoryProvider(
            create: (context) => GetIt.instance<ITermsAndConditionsRepo>(),
            child: BlocProvider(
              create: (context) => GetIt.instance<TermsAndConditionsCubit>()
                ..fetchTermsAndConditions(),
              child: TermsAndConditionsView(),
            ),
          );
        },
      ),
      GoRoute(
        path: TeacherProfileView.routeName,
        name: TeacherProfileView.routeName,
        builder: (context, state) {
          TeacherProfileService().initDi();
          return RepositoryProvider(
            create: (context) => GetIt.instance<ITeacherProfileRepo>(),
            child: BlocProvider(
              create: (context) =>
                  GetIt.instance<TeacherProfileCubit>()..fetchTeacherData(),
              child: TeacherProfileView(),
            ),
          );
        },
      ),
      GoRoute(
        path: ChatbotView.routeName,
        name: ChatbotView.routeName,
        builder: (context, state) {
          ChatbotService().initDi();
          return RepositoryProvider(
            create: (context) => GetIt.instance<IChatbotRepo>(),
            child: BlocProvider(
              create: (context) => GetIt.instance<ChatbotCubit>(),
              child: ChatbotView(),
            ),
          );
        },
      ),
    ],
  );
}
