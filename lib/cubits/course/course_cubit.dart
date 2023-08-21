<<<<<<< HEAD
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/cubits/course/course_state.dart';
=======
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'course_state.dart';
>>>>>>> b2db2189bd5d52409229ac81e9bf8c27e25b0840

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());
}
