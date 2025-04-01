part of 'chatbot_cubit.dart';

@freezed
class ChatbotState<T> with _$ChatbotState {
  const factory ChatbotState.initial() = Initial;
  const factory ChatbotState.loading() = Loading;
  const factory ChatbotState.success(T data) = Success;
  const factory ChatbotState.failure(String message) = Failure;
  const factory ChatbotState.updateUI() = UpdateUI;
}
