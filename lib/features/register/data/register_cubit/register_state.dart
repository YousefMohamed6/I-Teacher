abstract class RegisterPageState {}

class Loading extends RegisterPageState {}

class Success extends RegisterPageState {}

class Failure extends RegisterPageState {}

class RegisterFailure extends RegisterPageState {
  final String errMessage;

  RegisterFailure({required this.errMessage});
}

class RegisterInitial extends RegisterPageState {}
