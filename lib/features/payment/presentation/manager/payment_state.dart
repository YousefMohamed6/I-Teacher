abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class Paid extends PaymentState {}



class PaymentVisa extends PaymentState {}

class PaymentWellats extends PaymentState {}

class PaymentLoading extends PaymentState {}

class ProcessSuccess extends PaymentState {}

class ProcessFailure extends PaymentState {}

class PaymentSuccess extends PaymentState {}

class PaymentFailure extends PaymentState {}
