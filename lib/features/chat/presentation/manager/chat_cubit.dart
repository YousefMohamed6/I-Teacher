import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:mrjoo/core/utils/constants/firebase_keys.dart';
import 'package:mrjoo/features/chat/domin/use_cases/get_all_messages_use_case.dart';
import 'package:mrjoo/features/chat/domin/use_cases/send_message_use_case.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ReadAllMessagesUseCase _getAllMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  ChatCubit(
    this._getAllMessagesUseCase,
    this._sendMessageUseCase,
  ) : super(ChatState.initial());
  List<types.Message> messages = [];
  final CollectionReference reference =
      FirebaseFirestore.instance.collection(ChatKeys.kChatCollection);

  Future<void> handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );
    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: types.User(
          id: FirebaseAuth.instance.currentUser?.uid ?? '',
          firstName: FirebaseAuth.instance.currentUser?.displayName ?? '',
          imageUrl: FirebaseAuth.instance.currentUser?.photoURL ?? '',
        ),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: FirebaseAuth.instance.currentUser?.uid ?? '',
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );
      await sendMessage(message);
    }
  }

  Future<XFile?> handleImageSelection() async {
    final XFile? image = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );
    return image;
  }

  Future<void> sendMessage(types.Message message) async {
    await _sendMessageUseCase.execute(message);
  }

  void fetchFirebaseMessages() async {
    messages = await _getAllMessagesUseCase.execute();
    reference
        .orderBy(
          ChatKeys.kCreatedAtField,
          descending: true,
        )
        .snapshots()
        .listen((event) {
      emit(ChatState.loading());
      messages = event.docs
          .map((e) => types.Message.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      emit(ChatState.success(messages: messages));
    });
  }
}
