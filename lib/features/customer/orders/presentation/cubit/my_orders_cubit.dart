import 'dart:async';

import 'package:asroo_store/features/customer/orders/data/models/order_model.dart';
import 'package:asroo_store/features/customer/orders/data/repos/orders_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_orders_state.dart';
part 'my_orders_cubit.freezed.dart';

enum OrderFilter { all, active, delivered, cancelled }

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit(this._repo) : super(const MyOrdersState.initial());

  final OrdersRepo _repo;
  StreamSubscription<List<OrderModel>>? _subscription;
  List<OrderModel> _allOrders = [];
  OrderFilter _currentFilter = OrderFilter.all;

  OrderFilter get currentFilter => _currentFilter;

  void loadOrders() {
    emit(const MyOrdersState.loading());
    _subscription?.cancel();
    _subscription = _repo.getCustomerOrders().listen(
      (orders) {
        _allOrders = orders;
        _applyFilter();
      },
      onError: (dynamic error) {
        emit(MyOrdersState.failure(error: error.toString()));
      },
    );
  }

  void changeFilter(OrderFilter filter) {
    _currentFilter = filter;
    emit(const MyOrdersState.initial());
    _applyFilter();
  }

  void _applyFilter() {
    final filtered = _filterOrders(_allOrders);
    if (filtered.isEmpty) {
      emit(const MyOrdersState.empty());
    } else {
      emit(MyOrdersState.loaded(orders: filtered));
    }
  }

  List<OrderModel> _filterOrders(List<OrderModel> orders) {
    switch (_currentFilter) {
      case OrderFilter.all:
        return orders;
      case OrderFilter.active:
        return orders
            .where(
              (o) => ['pending', 'confirmed', 'preparing', 'outForDelivery']
                  .contains(o.status),
            )
            .toList();
      case OrderFilter.delivered:
        return orders.where((o) => o.status == 'delivered').toList();
      case OrderFilter.cancelled:
        return orders.where((o) => o.status == 'cancelled').toList();
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
