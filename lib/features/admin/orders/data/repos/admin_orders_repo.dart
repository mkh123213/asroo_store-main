import 'package:asroo_store/core/service/graphql/api_result.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/features/admin/orders/data/data_source/admin_orders_data_source.dart';
import 'package:asroo_store/features/customer/orders/data/models/order_model.dart';

class AdminOrdersRepo {
  const AdminOrdersRepo(this._dataSource);

  final AdminOrdersDataSource _dataSource;

  Stream<List<OrderModel>> getAllOrders() {
    return _dataSource.getAllOrders();
  }

  Future<ApiResult<void>> updateOrderStatus({
    required String orderId,
    required String customerId,
    required String newStatus,
  }) async {
    try {
      await _dataSource.updateOrderStatus(
        orderId: orderId,
        newStatus: newStatus,
      );
      await _dataSource.sendOrderStatusNotification(
        customerId: customerId,
        orderId: orderId,
        status: newStatus,
      );
      return const ApiResult.success(null);
    } catch (e) {
      return const ApiResult.failure(errorMessage);
    }
  }
}
