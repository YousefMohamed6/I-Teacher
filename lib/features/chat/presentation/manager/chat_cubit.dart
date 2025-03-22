import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iteacher/core/exceptions/pick_file_exception.dart';
import 'package:iteacher/core/exceptions/pick_image_exception.dart';
import 'package:iteacher/core/models/user_model.dart';
import 'package:iteacher/core/services/audio_recorder_service.dart';
import 'package:iteacher/features/chat/data/models/audio_message_model/audio_message_model.dart';
import 'package:iteacher/features/chat/data/models/file_message_model/file_message_model.dart';
import 'package:iteacher/features/chat/data/models/image_message_model/image_message_model.dart';
import 'package:iteacher/features/chat/data/models/message_model/message_model.dart';
import 'package:iteacher/features/chat/data/models/text_message_model/text_message_model.dart';
import 'package:iteacher/features/chat/domin/use_cases/download_files_use_case.dart';
import 'package:iteacher/features/chat/domin/use_cases/get_all_teachers.dart';
import 'package:iteacher/features/chat/domin/use_cases/handle_audio_message_use_case.dart';
import 'package:iteacher/features/chat/domin/use_cases/handle_file_selection.dart';
import 'package:iteacher/features/chat/domin/use_cases/handle_image_selection.dart';
import 'package:iteacher/features/chat/domin/use_cases/listen_to_messages_use_case.dart';
import 'package:iteacher/features/chat/domin/use_cases/send_message_use_case.dart';
import 'package:iteacher/features/profile/data/model/teacher_model.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetAllTeachersUseCase _getAllTeachersUseCase;
  final ListenToMessagesUseCase _listenToMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final HandleFileSelectionUseCase _handleFileSelectionUseCase;
  final HandleImageSelectionUseCase _handleImageSelectionUseCase;
  final DownloadFilesUseCase _downloadFilesUseCase;
  final HandleAudioMessageUseCase _handleAudioMessageUseCase;
  final AudioRecorderService audioRecorder;
  ChatCubit(
    this._getAllTeachersUseCase,
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
  late String reciverId;
  List<TeacherModel> _teachers = [];
  List<TeacherModel> result = [];
  Future<void> getAllTeachers() async {
    try {
      emit(ChatState.loading());
      _teachers = await _getAllTeachersUseCase.execute();
      result.addAll(_teachers);
      emit(ChatState<List<TeacherModel>>.success(_teachers));
    } on Exception catch (e) {
      emit(ChatState.failure(e.toString()));
    }
  }

  void searchTeacher(String value) {
    emit(ChatState.initial());
    result.clear();
    if (value.isEmpty) {
      result.addAll(_teachers);
      return;
    }
    List<TeacherModel> founded = [];
    value = value.toLowerCase();
    for (TeacherModel teacher in _teachers) {
      if (teacher.firstName.toLowerCase().contains(value) ||
          teacher.lastName.toLowerCase().contains(value)) {
        founded.add(teacher);
      }
    }
    result = founded;
    emit(ChatState.updateUI());
  }

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
      final FileMessageModel message = await _handleFileSelectionUseCase
          .execute(userModel: user, reciverId: reciverId);
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
          await _handleImageSelectionUseCase.execute(
        userModel: user,
        reciverId: reciverId,
      );
      await sendMessage(message);
    } on PickGalleryImageException catch (_) {
      emit(ChatState<PickGalleryImageException>.failure(''));
    }
  }

  Future<void> sendAudioMessage() async {
    try {
      final File file = File(audioRecorder.audioPath!);
      final AudioMessageModel message =
          await _handleAudioMessageUseCase.execute(
        userModel: user,
        file: file,
        reciverId: reciverId,
      );
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
        reciverId: reciverId,
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
        List<MessageModel> result = [];
        for (var json in docs) {
          final MessageModel message =
              MessageModel.fromJson(json.data() as Map<String, dynamic>);
          if (message.reciverId == reciverId) {
            result.add(message);
          }
        }
        messages = result;
        emit(ChatState.success(messages));
      },
    );
  }

  @override
  Future<void> close() async {
    await audioRecorder.dispose();
    return super.close();
  }
}
