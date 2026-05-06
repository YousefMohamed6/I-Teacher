part of 'sign_learning_cubit.dart';

@freezed
sealed class SignLearningState with _$SignLearningState {
  const factory SignLearningState.initial() = Initial;
  const factory SignLearningState.loading() = Loading;
  const factory SignLearningState.success(String message) = Success;
  const factory SignLearningState.failure(String message) = Failure;
  const factory SignLearningState.updateUI(int index) = UpdateUI;
}
