abstract class LoginViewState {}

class ShowPassword extends LoginViewState {}

class HidenPassword extends LoginViewState {}

class LoginLoading extends LoginViewState {}

class InitialState extends LoginViewState {}

class LoginSuccess extends LoginViewState {}

class RestSuccess extends LoginViewState {}

class LoginFialure extends LoginViewState {
  final String errMessage;

  LoginFialure({required this.errMessage});
}
