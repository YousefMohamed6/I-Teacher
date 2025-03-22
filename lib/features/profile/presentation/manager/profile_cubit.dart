import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/features/profile/presentation/manager/profile_state.dart';
import 'package:iteacher/features/profile/data/model/teacher_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  late TeacherModel teacherModel;
  void initState({required TeacherModel teacherModel}) {
    this.teacherModel = teacherModel;
  }
}
