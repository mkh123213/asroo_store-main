import 'package:asroo_store/features/customer/orders/data/models/order_model.dart';
import 'package:asroo_store/features/customer/orders/data/repos/orders_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class OrderTrackingState {}

class OrderTrackingInitial extends OrderTrackingState {}

class OrderTrackingLoading extends OrderTrackingState {}

class OrderTrackingLoaded extends OrderTrackingState {
  OrderTrackingLoaded(this.order);
  final OrderModel order;
}

class OrderTrackingError extends OrderTrackingState {
  OrderTrackingError(this.message);
  final String message;
}

class OrderTrackingCubit extends Cubit<OrderTrackingState> {
  OrderTrackingCubit(this._repo) : super(OrderTrackingInitial());

  final OrdersRepo _repo;

  Future<void> loadOrder(String orderId) async {
    emit(OrderTrackingLoading());
    try {
      final order = await _repo.getOrderById(orderId);
      if (order != null) {
        emit(OrderTrackingLoaded(order));
      } else {
        emit(OrderTrackingError('الطلب غير موجود'));
      }
    } catch (e) {
      emit(OrderTrackingError(e.toString()));
    }
  }
}
