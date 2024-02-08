abstract class RegisterState {}

class Loading extends RegisterState {}

class Success extends RegisterState {}

class Failure extends RegisterState {}

class NotAcceptTermsAndPolicy extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String errMessage;

  RegisterFailure({required this.errMessage});
}

class RegisterInitial extends RegisterState {}
