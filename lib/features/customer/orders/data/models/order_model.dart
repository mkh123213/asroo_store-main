import 'package:asroo_store/features/customer/orders/data/models/order_address_model.dart';
import 'package:asroo_store/features/customer/orders/data/models/order_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  OrderModel({
    required this.id,
    required this.orderId,
    required this.customerId,
    required this.status,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.subtotal,
    required this.deliveryFee,
    required this.discount,
    required this.total,
    required this.items,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderModel.fromFirestore(DocumentSnapshot doc) {
    final json = doc.data()! as Map<String, dynamic>;
    return OrderModel(
      id: doc.id,
      orderId: json['orderId'] as String? ?? '',
      customerId: json['customerId'] as String? ?? '',
      status: json['status'] as String? ?? 'pending',
      paymentMethod: json['paymentMethod'] as String? ?? 'cashOnDelivery',
      paymentStatus: json['paymentStatus'] as String? ?? 'pending',
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
      total: (json['total'] as num?)?.toDouble() ?? 0,
      items: (json['items'] as List<dynamic>?)
              ?.map(
                (e) => OrderItemModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
      address: json['address'] != null
          ? OrderAddressModel.fromJson(json['address'] as Map<String, dynamic>)
          : OrderAddressModel(
              fullName: '',
              phone: '',
              city: '',
              area: '',
              street: '',
              buildingNo: '',
              floorOrApartment: '',
            ),
      createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (json['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  final String id;
  final String orderId;
  final String customerId;
  final String status;
  final String paymentMethod;
  final String paymentStatus;
  final double subtotal;
  final double deliveryFee;
  final double discount;
  final double total;
  final List<OrderItemModel> items;
  final OrderAddressModel address;
  final DateTime createdAt;
  final DateTime updatedAt;

  int get itemsCount =>
      items.fold(0, (sum, item) => sum + item.quantity);
}
