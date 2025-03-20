import 'package:get_it/get_it.dart';
import 'package:mrjoo/core/extentions/getit_extension.dart';
import 'package:mrjoo/core/services/audio_recorder_service.dart';
import 'package:mrjoo/core/services/file_manager_service.dart';
import 'package:mrjoo/core/services/firebase_firestore_service.dart';
import 'package:mrjoo/core/services/image_picker_service.dart';
import 'package:mrjoo/features/chat/data/repos/chat_repo_impl.dart';
import 'package:mrjoo/features/chat/domin/repos/i_chat_repo.dart';
import 'package:mrjoo/features/chat/domin/use_cases/download_files_use_case.dart';
import 'package:mrjoo/features/chat/domin/use_cases/get_all_teachers.dart';
import 'package:mrjoo/features/chat/domin/use_cases/handle_audio_message_use_case.dart';
import 'package:mrjoo/features/chat/domin/use_cases/handle_file_selection.dart';
import 'package:mrjoo/features/chat/domin/use_cases/handle_image_selection.dart';
import 'package:mrjoo/features/chat/domin/use_cases/listen_to_messages_use_case.dart';
import 'package:mrjoo/features/chat/domin/use_cases/send_message_use_case.dart';
import 'package:mrjoo/features/chat/presentation/manager/chat_cubit.dart';

class ChatService {
  final sl = GetIt.instance;

  void initDi() {
    sl.registerLazySingletonSafely<FirebaseFirestoreService>(
      () => FirebaseFirestoreService(),
    );
    sl.registerLazySingletonSafely<FileManagerService>(
      () => FileManagerService(),
    );
    sl.registerLazySingletonSafely<ImagePickerService>(
      () => ImagePickerService(),
    );
    sl.registerLazySingletonSafely<AudioRecorderService>(
      () => AudioRecorderService(),
    );
    sl.registerLazySingletonSafely<IChatRepo>(
      () => ChatRepoImpl(sl()),
    );
    sl.registerLazySingletonSafely<GetAllTeachersUseCase>(
      () => GetAllTeachersUseCase(sl()),
    );
    sl.registerFactorySafely<ListenToMessagesUseCase>(
      () => ListenToMessagesUseCase(sl()),
    );
    sl.registerLazySingletonSafely<SendMessageUseCase>(
      () => SendMessageUseCase(sl()),
    );
    sl.registerLazySingletonSafely<HandleFileSelectionUseCase>(
      () => HandleFileSelectionUseCase(sl()),
    );
    sl.registerLazySingletonSafely<HandleImageSelectionUseCase>(
      () => HandleImageSelectionUseCase(sl()),
    );
    sl.registerLazySingletonSafely<DownloadFilesUseCase>(
      () => DownloadFilesUseCase(sl()),
    );
    sl.registerLazySingletonSafely<HandleAudioMessageUseCase>(
      () => HandleAudioMessageUseCase(),
    );
    sl.registerFactorySafely<ChatCubit>(
      () => ChatCubit(
        sl(),
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
