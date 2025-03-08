part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = Initial;
  const factory ChatState.loading() = Loading;
  const factory ChatState.failure(String message) = Failure;
  const factory ChatState.success({required List<types.Message> messages}) =
      Success;
}
