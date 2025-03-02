class CustomerModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? address;

  CustomerModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        address: json['address'] as String?,
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "address": address
      };
}
