import 'package:get_it/get_it.dart';
import 'package:iteacher/core/extentions/getit_extension.dart';
import 'package:iteacher/core/services/firebase_firestore_service.dart';
import 'package:iteacher/core/services/image_picker_service.dart';
import 'package:iteacher/features/teacher_profile/data/repos/teacher_profile_repo_impl.dart';
import 'package:iteacher/features/teacher_profile/domin/repos/i_teacher_profile_repo.dart';
import 'package:iteacher/features/teacher_profile/domin/use_cases/add_account_use_case.dart';
import 'package:iteacher/features/teacher_profile/domin/use_cases/delete_account_use_case.dart';
import 'package:iteacher/features/teacher_profile/domin/use_cases/edit_account_data_use_case.dart';
import 'package:iteacher/features/teacher_profile/domin/use_cases/get_teacher_data_use_case.dart';
import 'package:iteacher/features/teacher_profile/domin/use_cases/get_user_email_use_case.dart';
import 'package:iteacher/features/teacher_profile/domin/use_cases/pick_teacher_image.dart';
import 'package:iteacher/features/teacher_profile/domin/use_cases/save_teache_data_use_case.dart';
import 'package:iteacher/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';

class TeacherProfileService {
  final sl = GetIt.I;
  void initDi() {
    sl.registerLazySingletonSafely<FirebaseFirestoreService>(
      () => FirebaseFirestoreService(),
    );
    sl.registerLazySingletonSafely<ImagePickerService>(
      () => ImagePickerService(),
    );
    sl.registerLazySingletonSafely<ITeacherProfileRepo>(
      () => TeacherProfileRepoImpl(
        sl(),
        sl(),
      ),
    );
    sl.registerLazySingletonSafely<FetchTeacherDataUseCase>(
      () => FetchTeacherDataUseCase(sl()),
    );
    sl.registerLazySingletonSafely<GetUserEmailUseCase>(
      () => GetUserEmailUseCase(),
    );
    sl.registerLazySingletonSafely<SaveTeacherDataUseCase>(
      () => SaveTeacherDataUseCase(sl()),
    );
    sl.registerLazySingletonSafely<PickTeacherImageUseCase>(
      () => PickTeacherImageUseCase(sl()),
    );
    sl.registerLazySingletonSafely<AddAccountUseCase>(
      () => AddAccountUseCase(sl()),
    );
    sl.registerLazySingletonSafely<EditAccountUseCase>(
      () => EditAccountUseCase(sl()),
    );
    sl.registerLazySingletonSafely<DeleteAccountUseCase>(
      () => DeleteAccountUseCase(sl()),
    );
    sl.registerFactorySafely<TeacherProfileCubit>(
      () => TeacherProfileCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
