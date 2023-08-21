import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/cubits/course/course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());
}
