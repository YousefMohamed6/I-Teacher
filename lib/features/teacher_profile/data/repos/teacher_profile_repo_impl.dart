import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/services/image_picker_service.dart';
import 'package:iteacher/core/utils/constants/firebase_keys.dart';
import 'package:iteacher/features/profile/data/model/account_model.dart';
import 'package:iteacher/features/profile/data/model/teacher_model.dart';
import 'package:iteacher/features/teacher_profile/domin/repos/i_teacher_profile_repo.dart';

class TeacherProfileRepoImpl implements ITeacherProfileRepo {
  final FirebaseFirestoreService _firebaseFirestoreService;
  final ImagePickerService _imagePickerService;
  TeacherProfileRepoImpl(
    this._imagePickerService,
    this._firebaseFirestoreService,
  );

  @override
  Future<TeacherModel> getTeacherData({required String email}) async {
    final response = await _firebaseFirestoreService.getDocument(
      collectionId: TeacherKeys.kTeachersCollection,
      documentId: email,
    );
    final accounts = await _firebaseFirestoreService.getSubCollection(
      collectionId: TeacherKeys.kTeachersCollection,
      documentId: email,
      subCollectionId: AccountsKeys.kAccountsCollection,
    );
    Map<String, dynamic> json = response.data() as Map<String, dynamic>;
    json.addAll({AccountsKeys.kAccountsCollection: accounts});
    return TeacherModel.fromJson(json);
  }

  @override
  Future<void> saveTeacherData({required TeacherModel teacherModel}) async {
    await _firebaseFirestoreService.updateDocument(
      collectionId: TeacherKeys.kTeachersCollection,
      documentId: teacherModel.email,
      data: teacherModel.toJson(),
    );
  }

  @override
  Future<String> pickTeacherImage() async {
    return await _imagePickerService.pickImageAsBase64FromGallery();
  }

  @override
  Future<void> addAccount(
      {required AccountModel account, required String email}) async {
    return _firebaseFirestoreService.addSubDocumentUsingId(
      collectionId: TeacherKeys.kTeachersCollection,
      subCollectionId: AccountsKeys.kAccountsCollection,
      documentId: email,
      subDocumentId: account.name,
      data: account.toJson(),
    );
  }

  @override
  Future<void> editAccount({
    required AccountModel account,
    required String email,
  }) async {
    await _firebaseFirestoreService.updateSubCollectionDocument(
      collectionId: TeacherKeys.kTeachersCollection,
      subCollectionId: AccountsKeys.kAccountsCollection,
      documentId: email,
      subDocumentId: account.name,
      data: account.toJson(),
    );
  }

  @override
  Future<void> deleteAccount({
    required AccountModel account,
    required String email,
  }) async {
    await _firebaseFirestoreService.deleteSubCollectionDocument(
      collectionId: TeacherKeys.kTeachersCollection,
      subCollectionId: AccountsKeys.kAccountsCollection,
      documentId: email,
      subDocumentId: account.name,
    );
  }
}
