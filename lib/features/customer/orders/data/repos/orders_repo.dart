import 'package:asroo_store/features/customer/orders/data/data_source/orders_remote_data_source.dart';
import 'package:asroo_store/features/customer/orders/data/models/order_model.dart';

class OrdersRepo {
  OrdersRepo(this._dataSource);

  final OrdersRemoteDataSource _dataSource;

  Stream<List<OrderModel>> getCustomerOrders() {
    return _dataSource.getCustomerOrders();
  }

  Future<OrderModel?> getOrderById(String orderId) {
    return _dataSource.getOrderById(orderId);
  }

  Future<void> createOrder({
    required List<Map<String, dynamic>> items,
    required double subtotal,
    required double deliveryFee,
    required double discount,
    required double total,
    required String paymentMethod,
    required Map<String, dynamic> address,
  }) {
    return _dataSource.createOrder(
      items: items,
      subtotal: subtotal,
      deliveryFee: deliveryFee,
      discount: discount,
      total: total,
      paymentMethod: paymentMethod,
      address: address,
    );
  }
}
