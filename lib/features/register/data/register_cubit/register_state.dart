abstract class RegisterViewState {}

class Loading extends RegisterViewState {}

class Success extends RegisterViewState {}

class Failure extends RegisterViewState {}

class RegisterFailure extends RegisterViewState {
  final String errMessage;

  RegisterFailure({required this.errMessage});
}

class RegisterInitial extends RegisterViewState {}
