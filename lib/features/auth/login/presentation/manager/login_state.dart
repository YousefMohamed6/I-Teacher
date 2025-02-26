abstract class LoginViewState {}

class LoginInitial extends LoginViewState {}

class LoginLoading extends LoginViewState {}

class InitialState extends LoginViewState {}

class LoginSuccess extends LoginViewState {}

class RestSuccess extends LoginViewState {}

class RestFailure extends LoginViewState {}

class LoginFailure extends LoginViewState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}
