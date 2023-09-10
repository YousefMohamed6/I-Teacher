import 'package:hive_flutter/hive_flutter.dart';
part 'local_messages.g.dart';

@HiveType(typeId: 0)
class LocalMessage extends HiveObject {
  @HiveField(0)
  final String contant;
  @HiveField(1)
  final String time;
  @HiveField(2)
  final String uId;
  @HiveField(3)
  final String fullName;

  LocalMessage({
    required this.contant,
    required this.time,
    required this.uId,
    required this.fullName,
  });
}
