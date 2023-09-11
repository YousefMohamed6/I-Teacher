import 'package:hive_flutter/hive_flutter.dart';
part 'user_model.g.dart';
@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  String userId;
  @HiveField(1)
  String userName;

  UserModel({required this.userId, required this.userName});
}
