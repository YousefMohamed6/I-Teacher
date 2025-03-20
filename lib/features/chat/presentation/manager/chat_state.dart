part of 'chat_cubit.dart';

@freezed
class ChatState<T> with _$ChatState<T> {
  const factory ChatState.initial() = Initial;
  const factory ChatState.loading() = Loading;
  const factory ChatState.failure(String message) = Failure;
  const factory ChatState.success(T data) = Success;
  const factory ChatState.updateUI() = UpdateUI;
}
