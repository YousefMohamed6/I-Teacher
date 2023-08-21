abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentVisa extends PaymentState {}

class Paid extends PaymentState {}

<<<<<<< HEAD
class PaymentFaild extends PaymentState {}
=======
class UnPaid extends PaymentState {}
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840

class PaymentWellats extends PaymentState {}

class PaymentLoading extends PaymentState {}

<<<<<<< HEAD
class ProcessSuccess extends PaymentState {}

class ProcessFailure extends PaymentState {}
=======
class PaymentSuccess extends PaymentState {}

class PaymentFailure extends PaymentState {}
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840
