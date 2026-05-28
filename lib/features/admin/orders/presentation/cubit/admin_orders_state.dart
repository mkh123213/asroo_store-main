part of 'admin_orders_cubit.dart';

sealed class AdminOrdersState {
  const AdminOrdersState();
}

class AdminOrdersInitial extends AdminOrdersState {
  const AdminOrdersInitial();
}

class AdminOrdersLoading extends AdminOrdersState {
  const AdminOrdersLoading();
}

class AdminOrdersLoaded extends AdminOrdersState {
  const AdminOrdersLoaded({required this.orders});
  final List<OrderModel> orders;
}

class AdminOrdersEmpty extends AdminOrdersState {
  const AdminOrdersEmpty();
}

class AdminOrdersFailure extends AdminOrdersState {
  const AdminOrdersFailure({required this.error});
  final String error;
}

sealed class UpdateOrderStatusState {
  const UpdateOrderStatusState();
}

class UpdateOrderStatusInitial extends UpdateOrderStatusState {
  const UpdateOrderStatusInitial();
}

class UpdateOrderStatusLoading extends UpdateOrderStatusState {
  const UpdateOrderStatusLoading({required this.orderId});
  final String orderId;
}

class UpdateOrderStatusSuccess extends UpdateOrderStatusState {
  const UpdateOrderStatusSuccess();
}

class UpdateOrderStatusError extends UpdateOrderStatusState {
  const UpdateOrderStatusError({required this.error});
  final String error;
}
