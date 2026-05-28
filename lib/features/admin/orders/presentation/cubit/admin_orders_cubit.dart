import 'dart:async';

import 'package:asroo_store/features/admin/orders/data/repos/admin_orders_repo.dart';
import 'package:asroo_store/features/customer/orders/data/models/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'admin_orders_state.dart';

class AdminOrdersCubit extends Cubit<AdminOrdersState> {
  AdminOrdersCubit(this._repo) : super(const AdminOrdersInitial());

  final AdminOrdersRepo _repo;
  StreamSubscription<List<OrderModel>>? _subscription;
  List<OrderModel> _allOrders = [];
  String _currentFilter = 'all';

  String get currentFilter => _currentFilter;

  void loadOrders() {
    emit(const AdminOrdersLoading());
    _subscription?.cancel();
    _subscription = _repo.getAllOrders().listen(
      (orders) {
        _allOrders = orders;
        _applyFilter();
      },
      onError: (dynamic error) {
        emit(AdminOrdersFailure(error: error.toString()));
      },
    );
  }

  void changeFilter(String filter) {
    _currentFilter = filter;
    _applyFilter();
  }

  void _applyFilter() {
    final filtered = _filterOrders(_allOrders);
    if (filtered.isEmpty) {
      emit(const AdminOrdersEmpty());
    } else {
      emit(AdminOrdersLoaded(orders: filtered));
    }
  }

  static const _paymentFilters = {
    'cashOnDelivery',
    'creditCard',
    'wallet',
    'shamCash',
  };

  List<OrderModel> _filterOrders(List<OrderModel> orders) {
    if (_currentFilter == 'all') return orders;
    if (_paymentFilters.contains(_currentFilter)) {
      return orders.where((o) => o.paymentMethod == _currentFilter).toList();
    }
    return orders.where((o) => o.status == _currentFilter).toList();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

class UpdateOrderStatusCubit extends Cubit<UpdateOrderStatusState> {
  UpdateOrderStatusCubit(this._repo)
      : super(const UpdateOrderStatusInitial());

  final AdminOrdersRepo _repo;

  Future<void> updateStatus({
    required String orderId,
    required String customerId,
    required String newStatus,
  }) async {
    emit(UpdateOrderStatusLoading(orderId: orderId));

    final result = await _repo.updateOrderStatus(
      orderId: orderId,
      customerId: customerId,
      newStatus: newStatus,
    );

    result.when(
      success: (_) {
        emit(const UpdateOrderStatusSuccess());
      },
      failure: (error) {
        emit(UpdateOrderStatusError(error: error));
      },
    );
  }
}
