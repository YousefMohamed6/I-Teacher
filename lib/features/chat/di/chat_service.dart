import 'package:get_it/get_it.dart';
import 'package:mrjoo/core/extentions/getit_extension.dart';
import 'package:mrjoo/core/services/firebase_firestore_service.dart';
import 'package:mrjoo/features/chat/data/repos/chat_repo_impl.dart';
import 'package:mrjoo/features/chat/domin/repos/i_chat_repo.dart';
import 'package:mrjoo/features/chat/domin/use_cases/get_all_messages_use_case.dart';
import 'package:mrjoo/features/chat/domin/use_cases/send_message_use_case.dart';
import 'package:mrjoo/features/chat/presentation/manager/chat_cubit.dart';

class ChatService {
  final sl = GetIt.instance;

  void initDi() {
    sl.registerLazySingletonSafely<FirebaseFirestoreService>(
      () => FirebaseFirestoreService(),
    );
    sl.registerLazySingletonSafely<IChatRepo>(
      () => ChatRepoImpl(sl()),
    );
    sl.registerLazySingletonSafely<ReadAllMessagesUseCase>(
      () => ReadAllMessagesUseCase(sl()),
    );
    sl.registerLazySingletonSafely<SendMessageUseCase>(
      () => SendMessageUseCase(sl()),
    );
    sl.registerFactorySafely<ChatCubit>(
      () => ChatCubit(
        sl(),
        sl(),
      ),
    );
  }
}
