abstract class LoginPageState {}

class ShowPassword extends LoginPageState {}

class HidenPassword extends LoginPageState {}

class LoginLoading extends LoginPageState {}

class InitialState extends LoginPageState {}

class LoginSuccess extends LoginPageState {}
class RestSuccess extends LoginPageState {}

class LoginFialure extends LoginPageState {
  final String errMessage;

  LoginFialure({required this.errMessage});
}
