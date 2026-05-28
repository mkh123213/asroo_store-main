import 'package:asroo_store/core/extensions/string_exetension.dart';
import 'package:asroo_store/core/service/push_notification/firebase_cloud_messaging.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/core/utils/app_values.dart';
import 'package:asroo_store/features/customer/notifications/data/models/notification_model.dart';
import 'package:asroo_store/features/customer/orders/data/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminOrdersDataSource {
  final _firestore = FirebaseFirestore.instance;

  Stream<List<OrderModel>> getAllOrders() {
    return _firestore
        .collection(ordersCollection)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(OrderModel.fromFirestore).toList();
    });
  }

  Future<void> updateOrderStatus({
    required String orderId,
    required String newStatus,
  }) async {
    await _firestore.collection(ordersCollection).doc(orderId).update({
      'status': newStatus,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> sendOrderStatusNotification({
    required String customerId,
    required String orderId,
    required String status,
  }) async {
    final userDoc =
        await _firestore.collection(usersCollection).doc(customerId).get();
    final fcmToken = userDoc.data()?['fcmToken'] as String?;

    final title = 'Order Update';
    final body = _statusNotificationBody(status, orderId);

    if (fcmToken != null && fcmToken.isNotEmpty) {
      await FirebaseCloudMessaging().sendToDeviceToken(
        deviceToken: fcmToken,
        title: title,
        body: body,
        orderId: orderId,
      );
    }

    final notificationId = AppValues.randomStringId;
    const createAt = '';

    await _firestore
        .collection(usersCollection)
        .doc(customerId)
        .collection(notificationCollection)
        .doc(notificationId)
        .set(
          NotificationModel(
            body: body,
            title: title,
            productId: -1,
            isSeen: false,
            createdAt: createAt.convertDataFormate(),
            notificationId: notificationId,
          ).toJson(),
        );
  }

  String _statusNotificationBody(String status, String orderId) {
    switch (status) {
      case 'confirmed':
        return 'Your order #$orderId has been confirmed!';
      case 'preparing':
        return 'Your order #$orderId is being prepared.';
      case 'outForDelivery':
        return 'Your order #$orderId is out for delivery!';
      case 'delivered':
        return 'Your order #$orderId has been delivered successfully!';
      case 'cancelled':
        return 'Your order #$orderId has been cancelled.';
      default:
        return 'Your order #$orderId status has been updated to $status.';
    }
  }
}
