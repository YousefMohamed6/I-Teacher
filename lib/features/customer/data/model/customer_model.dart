class CustomerModel {
  final String fristName;
  final String lastName;
  final String email;
  final String phone;
  CustomerModel({
    required this.email,
    required this.phone,
    required this.lastName,
    required this.fristName,
  });

  factory CustomerModel.fromUser(Map<String, dynamic> customerData) {
    return CustomerModel(
      fristName: customerData['fristName'],
      lastName: customerData['lastName'],
      email: customerData['email'],
      phone: customerData['phone'],
    );
  }
}
