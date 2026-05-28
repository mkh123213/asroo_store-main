// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_orders_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyOrdersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderModel> orders) loaded,
    required TResult Function() empty,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderModel> orders)? loaded,
    TResult? Function()? empty,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderModel> orders)? loaded,
    TResult Function()? empty,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyOrdersInitial value) initial,
    required TResult Function(MyOrdersLoading value) loading,
    required TResult Function(MyOrdersLoaded value) loaded,
    required TResult Function(MyOrdersEmpty value) empty,
    required TResult Function(MyOrdersFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyOrdersInitial value)? initial,
    TResult? Function(MyOrdersLoading value)? loading,
    TResult? Function(MyOrdersLoaded value)? loaded,
    TResult? Function(MyOrdersEmpty value)? empty,
    TResult? Function(MyOrdersFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyOrdersInitial value)? initial,
    TResult Function(MyOrdersLoading value)? loading,
    TResult Function(MyOrdersLoaded value)? loaded,
    TResult Function(MyOrdersEmpty value)? empty,
    TResult Function(MyOrdersFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyOrdersStateCopyWith<$Res> {
  factory $MyOrdersStateCopyWith(
          MyOrdersState value, $Res Function(MyOrdersState) then) =
      _$MyOrdersStateCopyWithImpl<$Res, MyOrdersState>;
}

/// @nodoc
class _$MyOrdersStateCopyWithImpl<$Res, $Val extends MyOrdersState>
    implements $MyOrdersStateCopyWith<$Res> {
  _$MyOrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

// **************************************************************************
// MyOrdersInitial
// **************************************************************************

/// @nodoc
abstract class _$$MyOrdersInitialImplCopyWith<$Res> {
  factory _$$MyOrdersInitialImplCopyWith(_$MyOrdersInitialImpl value,
          $Res Function(_$MyOrdersInitialImpl) then) =
      __$$MyOrdersInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyOrdersInitialImplCopyWithImpl<$Res>
    extends _$MyOrdersStateCopyWithImpl<$Res, _$MyOrdersInitialImpl>
    implements _$$MyOrdersInitialImplCopyWith<$Res> {
  __$$MyOrdersInitialImplCopyWithImpl(
      _$MyOrdersInitialImpl _value, $Res Function(_$MyOrdersInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MyOrdersInitialImpl implements MyOrdersInitial {
  const _$MyOrdersInitialImpl();

  @override
  String toString() {
    return 'MyOrdersState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MyOrdersInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderModel> orders) loaded,
    required TResult Function() empty,
    required TResult Function(String error) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderModel> orders)? loaded,
    TResult? Function()? empty,
    TResult? Function(String error)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderModel> orders)? loaded,
    TResult Function()? empty,
    TResult Function(String error)? failure,
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
    required TResult Function(MyOrdersInitial value) initial,
    required TResult Function(MyOrdersLoading value) loading,
    required TResult Function(MyOrdersLoaded value) loaded,
    required TResult Function(MyOrdersEmpty value) empty,
    required TResult Function(MyOrdersFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyOrdersInitial value)? initial,
    TResult? Function(MyOrdersLoading value)? loading,
    TResult? Function(MyOrdersLoaded value)? loaded,
    TResult? Function(MyOrdersEmpty value)? empty,
    TResult? Function(MyOrdersFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyOrdersInitial value)? initial,
    TResult Function(MyOrdersLoading value)? loading,
    TResult Function(MyOrdersLoaded value)? loaded,
    TResult Function(MyOrdersEmpty value)? empty,
    TResult Function(MyOrdersFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MyOrdersInitial implements MyOrdersState {
  const factory MyOrdersInitial() = _$MyOrdersInitialImpl;
}

// **************************************************************************
// MyOrdersLoading
// **************************************************************************

/// @nodoc
abstract class _$$MyOrdersLoadingImplCopyWith<$Res> {
  factory _$$MyOrdersLoadingImplCopyWith(_$MyOrdersLoadingImpl value,
          $Res Function(_$MyOrdersLoadingImpl) then) =
      __$$MyOrdersLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyOrdersLoadingImplCopyWithImpl<$Res>
    extends _$MyOrdersStateCopyWithImpl<$Res, _$MyOrdersLoadingImpl>
    implements _$$MyOrdersLoadingImplCopyWith<$Res> {
  __$$MyOrdersLoadingImplCopyWithImpl(_$MyOrdersLoadingImpl _value,
      $Res Function(_$MyOrdersLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MyOrdersLoadingImpl implements MyOrdersLoading {
  const _$MyOrdersLoadingImpl();

  @override
  String toString() {
    return 'MyOrdersState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MyOrdersLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderModel> orders) loaded,
    required TResult Function() empty,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderModel> orders)? loaded,
    TResult? Function()? empty,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderModel> orders)? loaded,
    TResult Function()? empty,
    TResult Function(String error)? failure,
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
    required TResult Function(MyOrdersInitial value) initial,
    required TResult Function(MyOrdersLoading value) loading,
    required TResult Function(MyOrdersLoaded value) loaded,
    required TResult Function(MyOrdersEmpty value) empty,
    required TResult Function(MyOrdersFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyOrdersInitial value)? initial,
    TResult? Function(MyOrdersLoading value)? loading,
    TResult? Function(MyOrdersLoaded value)? loaded,
    TResult? Function(MyOrdersEmpty value)? empty,
    TResult? Function(MyOrdersFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyOrdersInitial value)? initial,
    TResult Function(MyOrdersLoading value)? loading,
    TResult Function(MyOrdersLoaded value)? loaded,
    TResult Function(MyOrdersEmpty value)? empty,
    TResult Function(MyOrdersFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MyOrdersLoading implements MyOrdersState {
  const factory MyOrdersLoading() = _$MyOrdersLoadingImpl;
}

// **************************************************************************
// MyOrdersLoaded
// **************************************************************************

/// @nodoc
abstract class _$$MyOrdersLoadedImplCopyWith<$Res> {
  factory _$$MyOrdersLoadedImplCopyWith(_$MyOrdersLoadedImpl value,
          $Res Function(_$MyOrdersLoadedImpl) then) =
      __$$MyOrdersLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OrderModel> orders});
}

/// @nodoc
class __$$MyOrdersLoadedImplCopyWithImpl<$Res>
    extends _$MyOrdersStateCopyWithImpl<$Res, _$MyOrdersLoadedImpl>
    implements _$$MyOrdersLoadedImplCopyWith<$Res> {
  __$$MyOrdersLoadedImplCopyWithImpl(
      _$MyOrdersLoadedImpl _value, $Res Function(_$MyOrdersLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
  }) {
    return _then(_$MyOrdersLoadedImpl(
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
    ));
  }
}

/// @nodoc

class _$MyOrdersLoadedImpl implements MyOrdersLoaded {
  const _$MyOrdersLoadedImpl({required final List<OrderModel> orders})
      : _orders = orders;

  final List<OrderModel> _orders;
  @override
  List<OrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'MyOrdersState.loaded(orders: $orders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyOrdersLoadedImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyOrdersLoadedImplCopyWith<_$MyOrdersLoadedImpl> get copyWith =>
      __$$MyOrdersLoadedImplCopyWithImpl<_$MyOrdersLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderModel> orders) loaded,
    required TResult Function() empty,
    required TResult Function(String error) failure,
  }) {
    return loaded(orders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderModel> orders)? loaded,
    TResult? Function()? empty,
    TResult? Function(String error)? failure,
  }) {
    return loaded?.call(orders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderModel> orders)? loaded,
    TResult Function()? empty,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(orders);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyOrdersInitial value) initial,
    required TResult Function(MyOrdersLoading value) loading,
    required TResult Function(MyOrdersLoaded value) loaded,
    required TResult Function(MyOrdersEmpty value) empty,
    required TResult Function(MyOrdersFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyOrdersInitial value)? initial,
    TResult? Function(MyOrdersLoading value)? loading,
    TResult? Function(MyOrdersLoaded value)? loaded,
    TResult? Function(MyOrdersEmpty value)? empty,
    TResult? Function(MyOrdersFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyOrdersInitial value)? initial,
    TResult Function(MyOrdersLoading value)? loading,
    TResult Function(MyOrdersLoaded value)? loaded,
    TResult Function(MyOrdersEmpty value)? empty,
    TResult Function(MyOrdersFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MyOrdersLoaded implements MyOrdersState {
  const factory MyOrdersLoaded({required final List<OrderModel> orders}) =
      _$MyOrdersLoadedImpl;

  List<OrderModel> get orders;
  @JsonKey(ignore: true)
  _$$MyOrdersLoadedImplCopyWith<_$MyOrdersLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// **************************************************************************
// MyOrdersEmpty
// **************************************************************************

/// @nodoc
abstract class _$$MyOrdersEmptyImplCopyWith<$Res> {
  factory _$$MyOrdersEmptyImplCopyWith(
          _$MyOrdersEmptyImpl value, $Res Function(_$MyOrdersEmptyImpl) then) =
      __$$MyOrdersEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyOrdersEmptyImplCopyWithImpl<$Res>
    extends _$MyOrdersStateCopyWithImpl<$Res, _$MyOrdersEmptyImpl>
    implements _$$MyOrdersEmptyImplCopyWith<$Res> {
  __$$MyOrdersEmptyImplCopyWithImpl(
      _$MyOrdersEmptyImpl _value, $Res Function(_$MyOrdersEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MyOrdersEmptyImpl implements MyOrdersEmpty {
  const _$MyOrdersEmptyImpl();

  @override
  String toString() {
    return 'MyOrdersState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MyOrdersEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderModel> orders) loaded,
    required TResult Function() empty,
    required TResult Function(String error) failure,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderModel> orders)? loaded,
    TResult? Function()? empty,
    TResult? Function(String error)? failure,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderModel> orders)? loaded,
    TResult Function()? empty,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyOrdersInitial value) initial,
    required TResult Function(MyOrdersLoading value) loading,
    required TResult Function(MyOrdersLoaded value) loaded,
    required TResult Function(MyOrdersEmpty value) empty,
    required TResult Function(MyOrdersFailure value) failure,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyOrdersInitial value)? initial,
    TResult? Function(MyOrdersLoading value)? loading,
    TResult? Function(MyOrdersLoaded value)? loaded,
    TResult? Function(MyOrdersEmpty value)? empty,
    TResult? Function(MyOrdersFailure value)? failure,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyOrdersInitial value)? initial,
    TResult Function(MyOrdersLoading value)? loading,
    TResult Function(MyOrdersLoaded value)? loaded,
    TResult Function(MyOrdersEmpty value)? empty,
    TResult Function(MyOrdersFailure value)? failure,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class MyOrdersEmpty implements MyOrdersState {
  const factory MyOrdersEmpty() = _$MyOrdersEmptyImpl;
}

// **************************************************************************
// MyOrdersFailure
// **************************************************************************

/// @nodoc
abstract class _$$MyOrdersFailureImplCopyWith<$Res> {
  factory _$$MyOrdersFailureImplCopyWith(_$MyOrdersFailureImpl value,
          $Res Function(_$MyOrdersFailureImpl) then) =
      __$$MyOrdersFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$MyOrdersFailureImplCopyWithImpl<$Res>
    extends _$MyOrdersStateCopyWithImpl<$Res, _$MyOrdersFailureImpl>
    implements _$$MyOrdersFailureImplCopyWith<$Res> {
  __$$MyOrdersFailureImplCopyWithImpl(_$MyOrdersFailureImpl _value,
      $Res Function(_$MyOrdersFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$MyOrdersFailureImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MyOrdersFailureImpl implements MyOrdersFailure {
  const _$MyOrdersFailureImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'MyOrdersState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyOrdersFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyOrdersFailureImplCopyWith<_$MyOrdersFailureImpl> get copyWith =>
      __$$MyOrdersFailureImplCopyWithImpl<_$MyOrdersFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderModel> orders) loaded,
    required TResult Function() empty,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderModel> orders)? loaded,
    TResult? Function()? empty,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderModel> orders)? loaded,
    TResult Function()? empty,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyOrdersInitial value) initial,
    required TResult Function(MyOrdersLoading value) loading,
    required TResult Function(MyOrdersLoaded value) loaded,
    required TResult Function(MyOrdersEmpty value) empty,
    required TResult Function(MyOrdersFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyOrdersInitial value)? initial,
    TResult? Function(MyOrdersLoading value)? loading,
    TResult? Function(MyOrdersLoaded value)? loaded,
    TResult? Function(MyOrdersEmpty value)? empty,
    TResult? Function(MyOrdersFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyOrdersInitial value)? initial,
    TResult Function(MyOrdersLoading value)? loading,
    TResult Function(MyOrdersLoaded value)? loaded,
    TResult Function(MyOrdersEmpty value)? empty,
    TResult Function(MyOrdersFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class MyOrdersFailure implements MyOrdersState {
  const factory MyOrdersFailure({required final String error}) =
      _$MyOrdersFailureImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$MyOrdersFailureImplCopyWith<_$MyOrdersFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
