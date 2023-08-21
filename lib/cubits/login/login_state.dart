abstract class LoginPageState {}

class ShowPassword extends LoginPageState {}

class HidenPassword extends LoginPageState {}

class LoginLoading extends LoginPageState {}

class InitialState extends LoginPageState {}
<<<<<<< HEAD

class LoginSuccess extends LoginPageState {}
class RestSuccess extends LoginPageState {}

class LoginFialure extends LoginPageState {
  final String errMessage;

  LoginFialure({required this.errMessage});
}
=======
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840
