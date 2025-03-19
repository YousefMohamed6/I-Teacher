import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:mrjoo/features/teacher_profile/presentation/views/social_media_account_view.dart';

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
  Set<AccountModel> accounts = {};
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

  void navigateToEditAccountView({
    required AccountModel account,
    required BuildContext context,
  }) async {
    updateAccount(account: account);
    await showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: this,
        child: SocialMediaAccountView(),
      ),
    );
  }

  void updateAccount({
    required AccountModel account,
  }) {
    accountIconTextController.text = account.icon;
    accountNameTextController.text = account.name;
    accountUrlTextController.text = account.url;
  }

  Future<String> pickImage() async {
    try {
      return await _pickTeacherImage.execute();
    } catch (e) {
      emit(
          TeacherProfileState<PickGalleryImageException>.failure(e.toString()));
      return '';
    }
  }

  Future<void> pickTeacherImage() async {
    emit(TeacherProfileState.initial());
    teacher.imageBase64 = await pickImage();
    emit(TeacherProfileState<TeacherModel>.updateUI());
  }

  Future<void> pickAccountImage() async {
    emit(TeacherProfileState.initial());
    accountIconTextController.text = await pickImage();
    emit(TeacherProfileState<TeacherModel>.updateUI());
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
        await fetchTeacherData();
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
      await fetchTeacherData();
      emit(TeacherProfileState<AccountModel>.success(newAccount));
    } catch (e) {
      emit(TeacherProfileState.failure(e.toString()));
    }
  }

  void clearData() {
    emit(TeacherProfileState.initial());
    accountIconTextController.clear();
    accountNameTextController.clear();
    accountUrlTextController.clear();
    emit(TeacherProfileState.updateUI());
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
