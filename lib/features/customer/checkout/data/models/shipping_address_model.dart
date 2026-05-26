import 'package:hive_flutter/hive_flutter.dart';

part 'shipping_address_model.g.dart';

@HiveType(typeId: 3)
class ShippingAddressModel extends HiveObject {
  ShippingAddressModel({
    required this.fullName,
    required this.phoneNumber,
    required this.city,
    required this.area,
    required this.street,
    required this.buildingNo,
    required this.floor,
    required this.addressNotes,
  });

  @HiveField(0)
  final String fullName;

  @HiveField(1)
  final String phoneNumber;

  @HiveField(2)
  final String city;

  @HiveField(3)
  final String area;

  @HiveField(4)
  final String street;

  @HiveField(5)
  final String buildingNo;

  @HiveField(6)
  final String floor;

  @HiveField(7)
  final String addressNotes;
}
