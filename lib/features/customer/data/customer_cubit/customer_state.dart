abstract class CustomerState {}

class CustomerInitial extends CustomerState {}

class EnterData extends CustomerState {}

class SendData extends CustomerState {}

class Loading extends CustomerState {}

class Failure extends CustomerState {}

class PrivacySuccses extends CustomerState {
  final String privacy;

  PrivacySuccses({required this.privacy});
}

class TremsSuccses extends CustomerState {
  final String trems;

  TremsSuccses({required this.trems});
}

class PrivacyFailure extends CustomerState {}
