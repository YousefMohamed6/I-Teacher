import 'package:flutter/material.dart';
import 'package:iteacher/core/enums/user_role.dart';
import 'package:iteacher/features/live_lesson/domain/entities/live_lesson_entity.dart';
import 'package:iteacher/features/live_lesson/presentation/Screens/student_live_view.dart';
import 'package:iteacher/features/live_lesson/presentation/Screens/teacher_live_view.dart';
import 'package:iteacher/features/live_lesson/presentation/widgets/live_lesson_pre_join_view.dart';

class LiveLessonView extends StatefulWidget {
  static const String routeName = '/live-lesson';

  const LiveLessonView({
    super.key,
    required this.lesson,
    required this.role,
    required this.userId,
    required this.userName,
  });

  final LiveLessonEntity lesson;
  final UserRole role;
  final String userId;
  final String userName;

  @override
  State<LiveLessonView> createState() => _LiveLessonViewState();
}

class _LiveLessonViewState extends State<LiveLessonView> {
  bool _permissionsGranted = false;

  @override
  Widget build(BuildContext context) {
    if (!_permissionsGranted) {
      return LiveLessonPreJoinView(
        onPermissionsGranted: () {
          setState(() {
            _permissionsGranted = true;
          });
        },
      );
    }

    if (widget.role == UserRole.teacher) {
      return TeacherLiveView(
        lesson: widget.lesson,
        userId: widget.userId,
        userName: widget.userName,
      );
    } else {
      return StudentLiveView(
        lesson: widget.lesson,
        userId: widget.userId,
        userName: widget.userName,
      );
    }
  }
}
