part of 'my_orders_cubit.dart';

@freezed
class MyOrdersState with _$MyOrdersState {
  const factory MyOrdersState.initial() = MyOrdersInitial;
  const factory MyOrdersState.loading() = MyOrdersLoading;
  const factory MyOrdersState.loaded({
    required List<OrderModel> orders,
  }) = MyOrdersLoaded;
  const factory MyOrdersState.empty() = MyOrdersEmpty;
  const factory MyOrdersState.failure({required String error}) =
      MyOrdersFailure;
}
