part of 'playlists_cubit.dart';

@freezed
sealed class PlaylistsState<T> with _$PlaylistsState<T> {
  const factory PlaylistsState.initial() = PlaylistsInitial;
  const factory PlaylistsState.loading() = PlaylistsLoading;
  const factory PlaylistsState.success(T data) = PlaylistsSuccess;
  const factory PlaylistsState.failure(String message) = PlaylistsFailure;
  const factory PlaylistsState.expiredSubscription() = ExpiredSubscription;
}
