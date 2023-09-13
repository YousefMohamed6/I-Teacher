import 'package:hive_flutter/hive_flutter.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  final String userId;
  @HiveField(1)
  final String userName;
  @HiveField(2)
  final bool isAdmin;

  UserModel({
    required this.userId,
    required this.userName,
    required this.isAdmin,
  });
}
