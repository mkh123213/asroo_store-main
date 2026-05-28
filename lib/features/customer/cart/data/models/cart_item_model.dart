import 'package:hive_flutter/hive_flutter.dart';

part 'cart_item_model.g.dart';

@HiveType(typeId: 2)
class CartItemModel extends HiveObject {
  CartItemModel({
    required this.productId,
    required this.title,
    required this.image,
    required this.price,
    required this.originalPrice,
    required this.variant,
    required this.quantity,
  });

  @HiveField(0)
  final int productId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final double originalPrice;

  @HiveField(5)
  final String variant;

  @HiveField(6)
  int quantity;
}
