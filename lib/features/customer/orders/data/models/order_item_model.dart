class OrderItemModel {
  OrderItemModel({
    required this.productId,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.total,
    this.color,
    this.size,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      productId: json['productId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toDouble() ?? 0,
      color: json['color'] as String?,
      size: json['size'] as String?,
    );
  }

  final String productId;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;
  final double total;
  final String? color;
  final String? size;

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'name': name,
        'imageUrl': imageUrl,
        'price': price,
        'quantity': quantity,
        'total': total,
        'color': color,
        'size': size,
      };
}
