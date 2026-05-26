// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckoutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() updated,
    required TResult Function() loading,
    required TResult Function() orderPlaced,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? updated,
    TResult? Function()? loading,
    TResult? Function()? orderPlaced,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? updated,
    TResult Function()? loading,
    TResult Function()? orderPlaced,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CheckoutUpdatedState value) updated,
    required TResult Function(CheckoutLoadingState value) loading,
    required TResult Function(OrderPlacedState value) orderPlaced,
    required TResult Function(CheckoutErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CheckoutUpdatedState value)? updated,
    TResult? Function(CheckoutLoadingState value)? loading,
    TResult? Function(OrderPlacedState value)? orderPlaced,
    TResult? Function(CheckoutErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CheckoutUpdatedState value)? updated,
    TResult Function(CheckoutLoadingState value)? loading,
    TResult Function(OrderPlacedState value)? orderPlaced,
    TResult Function(CheckoutErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
          CheckoutState value, $Res Function(CheckoutState) then) =
      _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CheckoutState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() updated,
    required TResult Function() loading,
    required TResult Function() orderPlaced,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? updated,
    TResult? Function()? loading,
    TResult? Function()? orderPlaced,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? updated,
    TResult Function()? loading,
    TResult Function()? orderPlaced,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CheckoutUpdatedState value) updated,
    required TResult Function(CheckoutLoadingState value) loading,
    required TResult Function(OrderPlacedState value) orderPlaced,
    required TResult Function(CheckoutErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CheckoutUpdatedState value)? updated,
    TResult? Function(CheckoutLoadingState value)? loading,
    TResult? Function(OrderPlacedState value)? orderPlaced,
    TResult? Function(CheckoutErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CheckoutUpdatedState value)? updated,
    TResult Function(CheckoutLoadingState value)? loading,
    TResult Function(OrderPlacedState value)? orderPlaced,
    TResult Function(CheckoutErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CheckoutState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$CheckoutUpdatedStateImplCopyWith<$Res> {
  factory _$$CheckoutUpdatedStateImplCopyWith(
          _$CheckoutUpdatedStateImpl value,
          $Res Function(_$CheckoutUpdatedStateImpl) then) =
      __$$CheckoutUpdatedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckoutUpdatedStateImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutUpdatedStateImpl>
    implements _$$CheckoutUpdatedStateImplCopyWith<$Res> {
  __$$CheckoutUpdatedStateImplCopyWithImpl(_$CheckoutUpdatedStateImpl _value,
      $Res Function(_$CheckoutUpdatedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckoutUpdatedStateImpl implements CheckoutUpdatedState {
  const _$CheckoutUpdatedStateImpl();

  @override
  String toString() {
    return 'CheckoutState.updated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutUpdatedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() updated,
    required TResult Function() loading,
    required TResult Function() orderPlaced,
    required TResult Function(String message) error,
  }) {
    return updated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? updated,
    TResult? Function()? loading,
    TResult? Function()? orderPlaced,
    TResult? Function(String message)? error,
  }) {
    return updated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? updated,
    TResult Function()? loading,
    TResult Function()? orderPlaced,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CheckoutUpdatedState value) updated,
    required TResult Function(CheckoutLoadingState value) loading,
    required TResult Function(OrderPlacedState value) orderPlaced,
    required TResult Function(CheckoutErrorState value) error,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CheckoutUpdatedState value)? updated,
    TResult? Function(CheckoutLoadingState value)? loading,
    TResult? Function(OrderPlacedState value)? orderPlaced,
    TResult? Function(CheckoutErrorState value)? error,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CheckoutUpdatedState value)? updated,
    TResult Function(CheckoutLoadingState value)? loading,
    TResult Function(OrderPlacedState value)? orderPlaced,
    TResult Function(CheckoutErrorState value)? error,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class CheckoutUpdatedState implements CheckoutState {
  const factory CheckoutUpdatedState() = _$CheckoutUpdatedStateImpl;
}

/// @nodoc
abstract class _$$CheckoutLoadingStateImplCopyWith<$Res> {
  factory _$$CheckoutLoadingStateImplCopyWith(
          _$CheckoutLoadingStateImpl value,
          $Res Function(_$CheckoutLoadingStateImpl) then) =
      __$$CheckoutLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckoutLoadingStateImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutLoadingStateImpl>
    implements _$$CheckoutLoadingStateImplCopyWith<$Res> {
  __$$CheckoutLoadingStateImplCopyWithImpl(_$CheckoutLoadingStateImpl _value,
      $Res Function(_$CheckoutLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckoutLoadingStateImpl implements CheckoutLoadingState {
  const _$CheckoutLoadingStateImpl();

  @override
  String toString() {
    return 'CheckoutState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() updated,
    required TResult Function() loading,
    required TResult Function() orderPlaced,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? updated,
    TResult? Function()? loading,
    TResult? Function()? orderPlaced,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? updated,
    TResult Function()? loading,
    TResult Function()? orderPlaced,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CheckoutUpdatedState value) updated,
    required TResult Function(CheckoutLoadingState value) loading,
    required TResult Function(OrderPlacedState value) orderPlaced,
    required TResult Function(CheckoutErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CheckoutUpdatedState value)? updated,
    TResult? Function(CheckoutLoadingState value)? loading,
    TResult? Function(OrderPlacedState value)? orderPlaced,
    TResult? Function(CheckoutErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CheckoutUpdatedState value)? updated,
    TResult Function(CheckoutLoadingState value)? loading,
    TResult Function(OrderPlacedState value)? orderPlaced,
    TResult Function(CheckoutErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CheckoutLoadingState implements CheckoutState {
  const factory CheckoutLoadingState() = _$CheckoutLoadingStateImpl;
}

/// @nodoc
abstract class _$$OrderPlacedStateImplCopyWith<$Res> {
  factory _$$OrderPlacedStateImplCopyWith(_$OrderPlacedStateImpl value,
          $Res Function(_$OrderPlacedStateImpl) then) =
      __$$OrderPlacedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderPlacedStateImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$OrderPlacedStateImpl>
    implements _$$OrderPlacedStateImplCopyWith<$Res> {
  __$$OrderPlacedStateImplCopyWithImpl(_$OrderPlacedStateImpl _value,
      $Res Function(_$OrderPlacedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderPlacedStateImpl implements OrderPlacedState {
  const _$OrderPlacedStateImpl();

  @override
  String toString() {
    return 'CheckoutState.orderPlaced()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderPlacedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() updated,
    required TResult Function() loading,
    required TResult Function() orderPlaced,
    required TResult Function(String message) error,
  }) {
    return orderPlaced();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? updated,
    TResult? Function()? loading,
    TResult? Function()? orderPlaced,
    TResult? Function(String message)? error,
  }) {
    return orderPlaced?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? updated,
    TResult Function()? loading,
    TResult Function()? orderPlaced,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (orderPlaced != null) {
      return orderPlaced();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CheckoutUpdatedState value) updated,
    required TResult Function(CheckoutLoadingState value) loading,
    required TResult Function(OrderPlacedState value) orderPlaced,
    required TResult Function(CheckoutErrorState value) error,
  }) {
    return orderPlaced(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CheckoutUpdatedState value)? updated,
    TResult? Function(CheckoutLoadingState value)? loading,
    TResult? Function(OrderPlacedState value)? orderPlaced,
    TResult? Function(CheckoutErrorState value)? error,
  }) {
    return orderPlaced?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CheckoutUpdatedState value)? updated,
    TResult Function(CheckoutLoadingState value)? loading,
    TResult Function(OrderPlacedState value)? orderPlaced,
    TResult Function(CheckoutErrorState value)? error,
    required TResult orElse(),
  }) {
    if (orderPlaced != null) {
      return orderPlaced(this);
    }
    return orElse();
  }
}

abstract class OrderPlacedState implements CheckoutState {
  const factory OrderPlacedState() = _$OrderPlacedStateImpl;
}

/// @nodoc
abstract class _$$CheckoutErrorStateImplCopyWith<$Res> {
  factory _$$CheckoutErrorStateImplCopyWith(_$CheckoutErrorStateImpl value,
          $Res Function(_$CheckoutErrorStateImpl) then) =
      __$$CheckoutErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CheckoutErrorStateImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutErrorStateImpl>
    implements _$$CheckoutErrorStateImplCopyWith<$Res> {
  __$$CheckoutErrorStateImplCopyWithImpl(_$CheckoutErrorStateImpl _value,
      $Res Function(_$CheckoutErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CheckoutErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckoutErrorStateImpl implements CheckoutErrorState {
  const _$CheckoutErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CheckoutState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutErrorStateImplCopyWith<_$CheckoutErrorStateImpl> get copyWith =>
      __$$CheckoutErrorStateImplCopyWithImpl<_$CheckoutErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() updated,
    required TResult Function() loading,
    required TResult Function() orderPlaced,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? updated,
    TResult? Function()? loading,
    TResult? Function()? orderPlaced,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? updated,
    TResult Function()? loading,
    TResult Function()? orderPlaced,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CheckoutUpdatedState value) updated,
    required TResult Function(CheckoutLoadingState value) loading,
    required TResult Function(OrderPlacedState value) orderPlaced,
    required TResult Function(CheckoutErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CheckoutUpdatedState value)? updated,
    TResult? Function(CheckoutLoadingState value)? loading,
    TResult? Function(OrderPlacedState value)? orderPlaced,
    TResult? Function(CheckoutErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CheckoutUpdatedState value)? updated,
    TResult Function(CheckoutLoadingState value)? loading,
    TResult Function(OrderPlacedState value)? orderPlaced,
    TResult Function(CheckoutErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CheckoutErrorState implements CheckoutState {
  const factory CheckoutErrorState(final String message) =
      _$CheckoutErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$CheckoutErrorStateImplCopyWith<_$CheckoutErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
