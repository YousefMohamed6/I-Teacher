import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mrjoo/core/exceptions/pick_image_exception.dart';
import 'package:mrjoo/features/profile/data/model/account_model.dart';
import 'package:mrjoo/features/profile/data/model/teacher_model.dart';
import 'package:mrjoo/features/teacher_profile/domin/use_cases/add_account_use_case.dart';
import 'package:mrjoo/features/teacher_profile/domin/use_cases/delete_account_use_case.dart';
import 'package:mrjoo/features/teacher_profile/domin/use_cases/edit_account_data_use_case.dart';
import 'package:mrjoo/features/teacher_profile/domin/use_cases/get_teacher_data_use_case.dart';
import 'package:mrjoo/features/teacher_profile/domin/use_cases/get_user_email_use_case.dart';
import 'package:mrjoo/features/teacher_profile/domin/use_cases/pick_teacher_image.dart';
import 'package:mrjoo/features/teacher_profile/domin/use_cases/save_teache_data_use_case.dart';

part 'teacher_profile_cubit.freezed.dart';
part 'teacher_profile_state.dart';

class TeacherProfileCubit extends Cubit<TeacherProfileState> {
  final FetchTeacherDataUseCase _fetchTeacherDataUseCase;
  final GetUserEmailUseCase _getUserEmailUseCase;
  final SaveTeacherDataUseCase _saveTeacherDataUseCase;
  final PickTeacherImageUseCase _pickTeacherImage;
  final AddAccountUseCase _addAccountUseCase;
  final EditAccountUseCase _editAccountUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;
  TeacherProfileCubit(
    this._fetchTeacherDataUseCase,
    this._getUserEmailUseCase,
    this._saveTeacherDataUseCase,
    this._pickTeacherImage,
    this._editAccountUseCase,
    this._addAccountUseCase,
    this._deleteAccountUseCase,
  ) : super(TeacherProfileState.initial());
  final formkey = GlobalKey<FormState>();
  final accountformkey = GlobalKey<FormState>();
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final teacherIdTextController = TextEditingController();
  final coursePriceTextController = TextEditingController();
  final courseLinkTextController = TextEditingController();
  final departmentTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  late TeacherModel teacher;
  TeacherModel get newTeacher => TeacherModel(
        firstName: firstNameTextController.text,
        lastName: lastNameTextController.text,
        email: teacher.email,
        phone: phoneTextController.text,
        department: departmentTextController.text,
        coursePrice: coursePriceTextController.text,
        courseLink: courseLinkTextController.text,
        description: descriptionTextController.text,
        teacherId: teacherIdTextController.text,
        accounts: teacher.accounts,
        imageBase64: teacher.imageBase64,
      );
  // Account
  final accountNameTextController = TextEditingController();
  final accountUrlTextController = TextEditingController();
  final accountIconTextController = TextEditingController();
  bool isNewAccount = false;
  AccountModel get newAccount => AccountModel(
        icon: accountIconTextController.text,
        name: accountNameTextController.text,
        url: accountUrlTextController.text,
      );

  Future<void> fetchTeacherData() async {
    try {
      emit(TeacherProfileState<TeacherModel>.loading());
      final email = await _getUserEmailUseCase.execute();
      teacher = await _fetchTeacherDataUseCase.execute(email: email);
      updateTeacherData(teacher: teacher);
      emit(TeacherProfileState<TeacherModel>.updateUI());
    } catch (e) {
      emit(TeacherProfileState.failure(e.toString()));
    }
  }

  void updateTeacherData({required TeacherModel teacher}) async {
    firstNameTextController.text = teacher.firstName;
    lastNameTextController.text = teacher.lastName;
    phoneTextController.text = teacher.phone;
    departmentTextController.text = teacher.department;
    coursePriceTextController.text = teacher.coursePrice;
    courseLinkTextController.text = teacher.courseLink;
    descriptionTextController.text = teacher.description;
    teacherIdTextController.text = teacher.teacherId;
  }

  Future<void> pickTeacherImage() async {
    try {
      emit(TeacherProfileState.initial());
      final image = await _pickTeacherImage.execute();
      teacher.imageBase64 = image;
      emit(TeacherProfileState<TeacherModel>.updateUI());
    } catch (e) {
      emit(
          TeacherProfileState<PickGalleryImageException>.failure(e.toString()));
    }
  }

  Future<void> pickAccountImage() async {
    try {
      emit(TeacherProfileState.initial());
      final image = await _pickTeacherImage.execute();
      accountIconTextController.text = image;
      emit(TeacherProfileState<TeacherModel>.updateUI());
    } catch (e) {
      emit(
          TeacherProfileState<PickGalleryImageException>.failure(e.toString()));
    }
  }

  Future<void> saveData() async {
    if (formkey.currentState!.validate()) {
      try {
        emit(TeacherProfileState.loading());
        await _saveTeacherDataUseCase.execute(teacherModel: newTeacher);
        emit(TeacherProfileState<TeacherModel>.success(newTeacher));
        emit(TeacherProfileState<TeacherModel>.updateUI());
      } catch (e) {
        emit(TeacherProfileState.failure(e.toString()));
      }
    }
  }

  Future<void> addAccountData() async {
    try {
      if (accountformkey.currentState!.validate()) {
        emit(TeacherProfileState.loading());
        await _addAccountUseCase.execute(
          account: newAccount,
          email: teacher.email,
        );
        emit(TeacherProfileState<AccountModel>.success(newAccount));
      }
    } catch (e) {
      emit(TeacherProfileState.failure(e.toString()));
    }
  }

  Future<void> editAccountData() async {
    try {
      emit(TeacherProfileState.loading());
      await _editAccountUseCase.execute(
        account: newAccount,
        email: teacher.email,
      );
      emit(TeacherProfileState<AccountModel>.success(newAccount));
    } catch (e) {
      emit(TeacherProfileState.failure(e.toString()));
    }
  }

  Future<void> deleteAccount() async {
    try {
      emit(TeacherProfileState.loading());
      await _deleteAccountUseCase.execute(
        account: newAccount,
        email: teacher.email,
      );
      clearData();
      emit(TeacherProfileState<AccountModel>.success(newAccount));
    } catch (e) {
      emit(TeacherProfileState.failure(e.toString()));
    }
  }

  void clearData() {
    accountIconTextController.clear();
    accountNameTextController.clear();
    accountUrlTextController.clear();
  }

  @override
  Future<void> close() {
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    phoneTextController.dispose();
    teacherIdTextController.dispose();
    coursePriceTextController.dispose();
    courseLinkTextController.dispose();
    departmentTextController.dispose();
    descriptionTextController.dispose();
    accountNameTextController.dispose();
    accountUrlTextController.dispose();
    accountIconTextController.dispose();
    return super.close();
  }
}
