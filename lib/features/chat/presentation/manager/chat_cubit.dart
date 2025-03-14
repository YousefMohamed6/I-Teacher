import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mrjoo/core/exceptions/pick_file_exception.dart';
import 'package:mrjoo/core/exceptions/pick_image_exception.dart';
import 'package:mrjoo/core/models/user_model.dart';
import 'package:mrjoo/core/services/audio_recorder_service.dart';
import 'package:mrjoo/core/utils/constants/firebase_keys.dart';
import 'package:mrjoo/features/chat/data/models/audio_message_model/audio_message_model.dart';
import 'package:mrjoo/features/chat/data/models/file_message_model/file_message_model.dart';
import 'package:mrjoo/features/chat/data/models/image_message_model/image_message_model.dart';
import 'package:mrjoo/features/chat/data/models/message_model/message_model.dart';
import 'package:mrjoo/features/chat/data/models/text_message_model/text_message_model.dart';
import 'package:mrjoo/features/chat/domin/use_cases/download_files_use_case.dart';
import 'package:mrjoo/features/chat/domin/use_cases/handle_audio_message_use_case.dart';
import 'package:mrjoo/features/chat/domin/use_cases/handle_file_selection.dart';
import 'package:mrjoo/features/chat/domin/use_cases/handle_image_selection.dart';
import 'package:mrjoo/features/chat/domin/use_cases/listen_to_messages_use_case.dart';
import 'package:mrjoo/features/chat/domin/use_cases/send_message_use_case.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ListenToMessagesUseCase _listenToMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final HandleFileSelectionUseCase _handleFileSelectionUseCase;
  final HandleImageSelectionUseCase _handleImageSelectionUseCase;
  final DownloadFilesUseCase _downloadFilesUseCase;
  final HandleAudioMessageUseCase _handleAudioMessageUseCase;
  final AudioRecorderService audioRecorder;
  ChatCubit(
    this._listenToMessagesUseCase,
    this._sendMessageUseCase,
    this._handleFileSelectionUseCase,
    this._handleImageSelectionUseCase,
    this._downloadFilesUseCase,
    this._handleAudioMessageUseCase,
    this.audioRecorder,
  ) : super(ChatState.initial());
  List<MessageModel> messages = [];
  late UserModel user;
  final CollectionReference reference =
      FirebaseFirestore.instance.collection(ChatKeys.kChatCollection);
  bool getSender(UserModel value) {
    return value.email == user.email;
  }

  Future<void> sendMessage(MessageModel message) async {
    try {
      await _sendMessageUseCase.execute(message);
    } on Exception catch (e) {
      emit(ChatState.failure(e.toString()));
    }
  }

  Future<void> sendFileMessage() async {
    try {
      final FileMessageModel message =
          await _handleFileSelectionUseCase.execute(userModel: user);
      await sendMessage(message);
    } on PickedFileException catch (e) {
      emit(ChatState<PickedFileException>.failure(e.toString()));
    } on PickFilePermissionException catch (e) {
      emit(ChatState<PickFilePermissionException>.failure(e.toString()));
    }
  }

  Future<void> downloadFile(FileMessageModel message) async {
    try {
      await _downloadFilesUseCase.execute(
        fileName: message.fileName,
        bytes: base64Decode(message.fileBase64),
      );
    } on Exception catch (e) {
      emit(ChatState.failure(e.toString()));
    }
  }

  Future<void> sendImageMessage() async {
    try {
      final ImageMessageModel message =
          await _handleImageSelectionUseCase.execute(userModel: user);
      await sendMessage(message);
    } on PickGalleryImageException catch (_) {
      emit(ChatState<PickGalleryImageException>.failure(''));
    }
  }

  Future<void> sendAudioMessage() async {
    try {
      final File file = File(audioRecorder.audioPath!);
      final AudioMessageModel message =
          await _handleAudioMessageUseCase.execute(userModel: user, file: file);
      await sendMessage(message);
    } on PickGalleryImageException catch (_) {
      emit(ChatState<PickGalleryImageException>.failure(''));
    }
  }

  Future<void> sendTextMessage(String text) async {
    try {
      final message = TextMessageModel(
        userModel: user,
        text: text,
        createdAt: DateTime.now().toString(),
      );
      await sendMessage(message);
    } on Exception catch (e) {
      emit(ChatState.failure(e.toString()));
    }
  }

  Future<void> startRecording() async {
    emit(ChatState.initial());
    await audioRecorder.startRecording();
    emit(ChatState.updateUI());
  }

  Future<void> stopRecording() async {
    emit(ChatState.initial());
    await audioRecorder.stopRecording();
    await sendAudioMessage();
    emit(ChatState.updateUI());
  }

  Future<void> cancelRecord() async {
    emit(ChatState.initial());
    await audioRecorder.cancelRecord();
    emit(ChatState.updateUI());
  }

  void listenToMessages() async {
    _listenToMessagesUseCase.execute(
      onChange: (docs) {
        emit(ChatState.initial());
        messages = docs
            .map((e) => MessageModel.fromJson(e.data() as Map<String, dynamic>))
            .toList();
        emit(ChatState.success(messages: messages));
      },
    );
  }
}
