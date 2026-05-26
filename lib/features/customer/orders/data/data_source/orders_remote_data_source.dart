import 'package:asroo_store/core/service/shared_pref/pref_keys.dart';
import 'package:asroo_store/core/service/shared_pref/shared_pref.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/features/customer/orders/data/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersRemoteDataSource {
  OrdersRemoteDataSource();

  final _firestore = FirebaseFirestore.instance;

  String get _currentUserId =>
      SharedPref().getInt(PrefKeys.userId).toString();

  Stream<List<OrderModel>> getCustomerOrders() {
    return _firestore
        .collection(ordersCollection)
        .where('customerId', isEqualTo: _currentUserId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(OrderModel.fromFirestore).toList();
    });
  }

  Future<OrderModel?> getOrderById(String orderId) async {
    final doc =
        await _firestore.collection(ordersCollection).doc(orderId).get();
    if (doc.exists) {
      return OrderModel.fromFirestore(doc);
    }
    return null;
  }

  Future<void> createOrder({
    required List<Map<String, dynamic>> items,
    required double subtotal,
    required double deliveryFee,
    required double discount,
    required double total,
    required String paymentMethod,
    required Map<String, dynamic> address,
  }) async {
    await _firestore.collection(ordersCollection).add({
      'customerId': _currentUserId,
      'items': items,
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'discount': discount,
      'total': total,
      'status': 'pending',
      'paymentMethod': paymentMethod,
      'paymentStatus': 'pending',
      'address': address,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
}
