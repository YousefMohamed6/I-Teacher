import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:iteacher/core/enums/user_role.dart';
import 'package:iteacher/core/services/sf_service.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/core/utils/constants/sf_keys.dart';
import 'package:iteacher/features/auth/login/data/repos/login_repo_impl.dart';
import 'package:iteacher/features/auth/login/di/login_service.dart';
import 'package:iteacher/features/auth/login/presentation/Screens/login_view.dart';
import 'package:iteacher/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:iteacher/features/auth/register/di/register_service.dart';
import 'package:iteacher/features/auth/register/domain/repos/i_register_repo.dart';
import 'package:iteacher/features/auth/register/presentation/Screens/register_view.dart';
import 'package:iteacher/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:iteacher/features/auth/reset_password/presentation/Screens/reset_password_view.dart';
import 'package:iteacher/features/auth/reset_password/presentation/manager/reset_password_cubit.dart';
import 'package:iteacher/features/chat/di/chat_service.dart';
import 'package:iteacher/features/chat/domain/repos/i_chat_repo.dart';
import 'package:iteacher/features/chat/presentation/Screens/chat_view.dart';
import 'package:iteacher/features/chat/presentation/Screens/chats_view.dart';
import 'package:iteacher/features/chat/presentation/manager/chat_cubit.dart';
import 'package:iteacher/features/chatbot/di/chatbot_service.dart';
import 'package:iteacher/features/chatbot/domain/repos/i_chatbot_repo.dart';
import 'package:iteacher/features/chatbot/presentation/Screens/chatbot_view.dart';
import 'package:iteacher/features/chatbot/presentation/manager/chatbot_cubit.dart';
import 'package:iteacher/features/course/di/course_service.dart';
import 'package:iteacher/features/course/domain/repos/I_course_repo.dart';
import 'package:iteacher/features/course/presentation/Screens/course_view.dart';
import 'package:iteacher/features/course/presentation/Screens/video_player_view.dart';
import 'package:iteacher/features/course/presentation/manager/course_cubit.dart';
import 'package:iteacher/features/payment/di/payment_service.dart';
import 'package:iteacher/features/payment/domain/repos/i_payment_repo.dart';
import 'package:iteacher/features/payment/presentation/Screens/payment_view.dart';
import 'package:iteacher/features/payment/presentation/manager/payment_cubit.dart';
import 'package:iteacher/features/register_student/data/model/student_model.dart';
import 'package:iteacher/features/register_student/di/register_student_service.dart';
import 'package:iteacher/features/register_student/domain/repos/i_register_student_repo.dart';
import 'package:iteacher/features/register_student/presentation/Screens/student_view.dart';
import 'package:iteacher/features/register_student/presentation/manager/register_student_cubit.dart';
import 'package:iteacher/features/register_teacher/di/register_teacher_service.dart';
import 'package:iteacher/features/register_teacher/domain/repos/i_register_teacher.dart';
import 'package:iteacher/features/register_teacher/presentation/Screens/register_teacher_view.dart';
import 'package:iteacher/features/register_teacher/presentation/manager/register_teacher_cubit.dart';
import 'package:iteacher/features/student_profile/presentation/Screens/student_profile_view.dart';
import 'package:iteacher/features/teacher_profile/data/model/teacher_model.dart';
import 'package:iteacher/features/teacher_profile/di/teacher_profile_service.dart';
import 'package:iteacher/features/teacher_profile/domain/repos/i_teacher_profile_repo.dart';
import 'package:iteacher/features/teacher_profile/presentation/Screens/edit_teacher_profile_view.dart';
import 'package:iteacher/features/teacher_profile/presentation/Screens/teacher_profile_view.dart';
import 'package:iteacher/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:iteacher/features/terms_and_conditions/di/terms_and_conditions_service.dart';
import 'package:iteacher/features/terms_and_conditions/domain/repos/i_terms_and_conditions.dart';
import 'package:iteacher/features/terms_and_conditions/presentation/Screens/terms_and_conditions.dart';
import 'package:iteacher/features/terms_and_conditions/presentation/manager/terms_and_conditions_cubit.dart';

sealed class RouterManager {
  static final navigationKey = GlobalKey<NavigatorState>();
  static GoRouter routeConfig = GoRouter(
    redirect: (context, state) async {
      if (state.fullPath?.isNotEmpty ?? false) return state.fullPath;
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        switch (await _userRole) {
          case UserRole.student:
            return CourseView.routeName;
          case UserRole.teacher:
            return EditTeacherProfileView.routeName;
        }
      } else {
        return LoginView.routeName;
      }
    },
    navigatorKey: navigationKey,
    routes: [
      GoRoute(
        path: TeacherProfileView.routeName,
        name: TeacherProfileView.routeName,
        builder: (context, state) {
          final teacherModel = state.extra as TeacherModel;
          return TeacherProfileView(teacher: teacherModel);
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
        path: ResetPasswordView.routeName,
        name: ResetPasswordView.routeName,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => ResetPasswordCubit(),
            child: ResetPasswordView(),
          );
        },
      ),
      GoRoute(
        path: StudentView.routeName,
        name: StudentView.routeName,
        builder: (context, state) {
          RegisterStudentService().initDi();
          return RepositoryProvider(
            create: (context) => GetIt.instance<IRegisterStudentRepo>(),
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
          final String receiverId =
              state.uri.queryParameters[ChatKeys.kReciverField] ?? '';
          return RepositoryProvider(
            create: (context) => GetIt.instance<IChatRepo>(),
            child: BlocProvider(
              create: (context) => GetIt.instance<ChatCubit>()
                ..receiverId = receiverId
                ..getSenderId()
                ..listenToMessages(),
              child: ChatView(),
            ),
          );
        },
      ),
      GoRoute(
        path: ChatsView.routeName,
        name: ChatsView.routeName,
        builder: (context, state) {
          ChatService().initDi();
          return RepositoryProvider(
            create: (context) => GetIt.instance<IChatRepo>(),
            child: BlocProvider(
              create: (context) => GetIt.instance<ChatCubit>()
                ..getAllTeachers()
                ..getSenderId(),
              child: ChatsView(),
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
                  GetIt.instance<CourseCubit>()..fetchAllPlaylists(),
              child: CourseView(),
            ),
          );
        },
      ),
      GoRoute(
        path: VideoPlayerView.routeName,
        name: VideoPlayerView.routeName,
        builder: (context, state) {
          final playlistId = state.extra as String;
          CourseService().initDi();
          return RepositoryProvider(
            create: (context) => GetIt.instance<ICourseRepo>(),
            child: BlocProvider(
              create: (context) => GetIt.instance<CourseCubit>()
                ..fetchPlaylistVideos(
                  playListId: playlistId,
                ),
              child: VideoPlayerView(),
            ),
          );
        },
      ),
      GoRoute(
        path: RegisterView.routeName,
        name: RegisterView.routeName,
        builder: (context, state) {
          final student = state.extra as StudentModel;
          RegisterService().initDi();
          return RepositoryProvider(
            create: (context) => GetIt.instance<IRegisterRepo>(),
            child: BlocProvider(
              create: (context) =>
                  GetIt.instance<RegisterCubit>()..initStudentModel(student),
              child: RegisterView(),
            ),
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
        path: EditTeacherProfileView.routeName,
        name: EditTeacherProfileView.routeName,
        builder: (context, state) {
          TeacherProfileService().initDi();
          return RepositoryProvider(
            create: (context) => GetIt.instance<ITeacherProfileRepo>(),
            child: BlocProvider(
              create: (context) =>
                  GetIt.instance<TeacherProfileCubit>()..fetchTeacherData(),
              child: EditTeacherProfileView(),
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
      GoRoute(
        path: StudentProfileView.routeName,
        name: StudentProfileView.routeName,
        builder: (context, state) {
          final student = state.extra as StudentModel;
          return StudentProfileView(
            student: student,
          );
        },
      ),
      GoRoute(
        path: RegisterTeacherView.routeName,
        name: RegisterTeacherView.routeName,
        builder: (context, state) {
          RegisterTeacherService().initDi();
          return RepositoryProvider(
            create: (context) => GetIt.instance<IRegisterTeacherRepo>(),
            child: BlocProvider(
              create: (context) => GetIt.instance<RegisterTeacherCubit>(),
              child: RegisterTeacherView(),
            ),
          );
        },
      ),
    ],
  );
  static Future<UserRole> get _userRole async {
    final String userRole =
        await SharedPreferencesService.getString(SfKeys.userRole) ?? '';
    switch (userRole) {
      case 'teacher':
        return UserRole.teacher;
      default:
        return UserRole.student;
    }
  }
}
