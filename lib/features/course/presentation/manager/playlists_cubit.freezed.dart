// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlists_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaylistsState<T> implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'PlaylistsState<$T>'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PlaylistsState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaylistsState<$T>()';
  }
}

/// @nodoc
class $PlaylistsStateCopyWith<T, $Res> {
  $PlaylistsStateCopyWith(
      PlaylistsState<T> _, $Res Function(PlaylistsState<T>) __);
}

/// Adds pattern-matching-related methods to [PlaylistsState].
extension PlaylistsStatePatterns<T> on PlaylistsState<T> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaylistsInitial<T> value)? initial,
    TResult Function(PlaylistsLoading<T> value)? loading,
    TResult Function(PlaylistsSuccess<T> value)? success,
    TResult Function(PlaylistsFailure<T> value)? failure,
    TResult Function(ExpiredSubscription<T> value)? expiredSubscription,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PlaylistsInitial() when initial != null:
        return initial(_that);
      case PlaylistsLoading() when loading != null:
        return loading(_that);
      case PlaylistsSuccess() when success != null:
        return success(_that);
      case PlaylistsFailure() when failure != null:
        return failure(_that);
      case ExpiredSubscription() when expiredSubscription != null:
        return expiredSubscription(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaylistsInitial<T> value) initial,
    required TResult Function(PlaylistsLoading<T> value) loading,
    required TResult Function(PlaylistsSuccess<T> value) success,
    required TResult Function(PlaylistsFailure<T> value) failure,
    required TResult Function(ExpiredSubscription<T> value) expiredSubscription,
  }) {
    final _that = this;
    switch (_that) {
      case PlaylistsInitial():
        return initial(_that);
      case PlaylistsLoading():
        return loading(_that);
      case PlaylistsSuccess():
        return success(_that);
      case PlaylistsFailure():
        return failure(_that);
      case ExpiredSubscription():
        return expiredSubscription(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaylistsInitial<T> value)? initial,
    TResult? Function(PlaylistsLoading<T> value)? loading,
    TResult? Function(PlaylistsSuccess<T> value)? success,
    TResult? Function(PlaylistsFailure<T> value)? failure,
    TResult? Function(ExpiredSubscription<T> value)? expiredSubscription,
  }) {
    final _that = this;
    switch (_that) {
      case PlaylistsInitial() when initial != null:
        return initial(_that);
      case PlaylistsLoading() when loading != null:
        return loading(_that);
      case PlaylistsSuccess() when success != null:
        return success(_that);
      case PlaylistsFailure() when failure != null:
        return failure(_that);
      case ExpiredSubscription() when expiredSubscription != null:
        return expiredSubscription(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? failure,
    TResult Function()? expiredSubscription,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PlaylistsInitial() when initial != null:
        return initial();
      case PlaylistsLoading() when loading != null:
        return loading();
      case PlaylistsSuccess() when success != null:
        return success(_that.data);
      case PlaylistsFailure() when failure != null:
        return failure(_that.message);
      case ExpiredSubscription() when expiredSubscription != null:
        return expiredSubscription();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) failure,
    required TResult Function() expiredSubscription,
  }) {
    final _that = this;
    switch (_that) {
      case PlaylistsInitial():
        return initial();
      case PlaylistsLoading():
        return loading();
      case PlaylistsSuccess():
        return success(_that.data);
      case PlaylistsFailure():
        return failure(_that.message);
      case ExpiredSubscription():
        return expiredSubscription();
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? failure,
    TResult? Function()? expiredSubscription,
  }) {
    final _that = this;
    switch (_that) {
      case PlaylistsInitial() when initial != null:
        return initial();
      case PlaylistsLoading() when loading != null:
        return loading();
      case PlaylistsSuccess() when success != null:
        return success(_that.data);
      case PlaylistsFailure() when failure != null:
        return failure(_that.message);
      case ExpiredSubscription() when expiredSubscription != null:
        return expiredSubscription();
      case _:
        return null;
    }
  }
}

/// @nodoc

class PlaylistsInitial<T>
    with DiagnosticableTreeMixin
    implements PlaylistsState<T> {
  const PlaylistsInitial();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'PlaylistsState<$T>.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PlaylistsInitial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaylistsState<$T>.initial()';
  }
}

/// @nodoc

class PlaylistsLoading<T>
    with DiagnosticableTreeMixin
    implements PlaylistsState<T> {
  const PlaylistsLoading();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'PlaylistsState<$T>.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PlaylistsLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaylistsState<$T>.loading()';
  }
}

/// @nodoc

class PlaylistsSuccess<T>
    with DiagnosticableTreeMixin
    implements PlaylistsState<T> {
  const PlaylistsSuccess(this.data);

  final T data;

  /// Create a copy of PlaylistsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaylistsSuccessCopyWith<T, PlaylistsSuccess<T>> get copyWith =>
      _$PlaylistsSuccessCopyWithImpl<T, PlaylistsSuccess<T>>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'PlaylistsState<$T>.success'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaylistsSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaylistsState<$T>.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $PlaylistsSuccessCopyWith<T, $Res>
    implements $PlaylistsStateCopyWith<T, $Res> {
  factory $PlaylistsSuccessCopyWith(
          PlaylistsSuccess<T> value, $Res Function(PlaylistsSuccess<T>) _then) =
      _$PlaylistsSuccessCopyWithImpl;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$PlaylistsSuccessCopyWithImpl<T, $Res>
    implements $PlaylistsSuccessCopyWith<T, $Res> {
  _$PlaylistsSuccessCopyWithImpl(this._self, this._then);

  final PlaylistsSuccess<T> _self;
  final $Res Function(PlaylistsSuccess<T>) _then;

  /// Create a copy of PlaylistsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(PlaylistsSuccess<T>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class PlaylistsFailure<T>
    with DiagnosticableTreeMixin
    implements PlaylistsState<T> {
  const PlaylistsFailure(this.message);

  final String message;

  /// Create a copy of PlaylistsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaylistsFailureCopyWith<T, PlaylistsFailure<T>> get copyWith =>
      _$PlaylistsFailureCopyWithImpl<T, PlaylistsFailure<T>>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'PlaylistsState<$T>.failure'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaylistsFailure<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaylistsState<$T>.failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $PlaylistsFailureCopyWith<T, $Res>
    implements $PlaylistsStateCopyWith<T, $Res> {
  factory $PlaylistsFailureCopyWith(
          PlaylistsFailure<T> value, $Res Function(PlaylistsFailure<T>) _then) =
      _$PlaylistsFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$PlaylistsFailureCopyWithImpl<T, $Res>
    implements $PlaylistsFailureCopyWith<T, $Res> {
  _$PlaylistsFailureCopyWithImpl(this._self, this._then);

  final PlaylistsFailure<T> _self;
  final $Res Function(PlaylistsFailure<T>) _then;

  /// Create a copy of PlaylistsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(PlaylistsFailure<T>(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ExpiredSubscription<T>
    with DiagnosticableTreeMixin
    implements PlaylistsState<T> {
  const ExpiredSubscription();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty(
          'type', 'PlaylistsState<$T>.expiredSubscription'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExpiredSubscription<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaylistsState<$T>.expiredSubscription()';
  }
}

// dart format on
