import 'package:iteacher/core/utils/constants/firebase_keys.dart';

class AccountModel {
  final String url;
  final String icon;
  final String name;
  AccountModel({
    required this.url,
    required this.icon,
    required this.name,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      url: json[AccountsKeys.kUrlField],
      icon: json[AccountsKeys.kIconField],
      name: json[AccountsKeys.kNameField],
    );
  }

  Map<String, dynamic> toJson() => {
        AccountsKeys.kUrlField: url,
        AccountsKeys.kIconField: icon,
        AccountsKeys.kNameField: name,
      };
}
