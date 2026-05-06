import 'package:equatable/equatable.dart';

enum LiveLessonType {
  normal,
  signLanguage,
}

class LiveLessonEntity extends Equatable {
  final String id;
  final String teacherId;
  final String teacherName;
  final String title;
  final LiveLessonType type;
  final String channelName;

  const LiveLessonEntity({
    required this.id,
    required this.teacherId,
    required this.teacherName,
    required this.title,
    required this.type,
    required this.channelName,
  });

  @override
  List<Object?> get props => [id, teacherId, teacherName, title, type, channelName];
}
