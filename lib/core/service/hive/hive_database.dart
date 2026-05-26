import 'package:asroo_store/features/admin/add_notifications/data/models/add_notification_model.dart';
import 'package:asroo_store/features/customer/cart/data/models/cart_item_model.dart';
import 'package:asroo_store/features/customer/checkout/data/models/shipping_address_model.dart';
import 'package:asroo_store/features/customer/favorites/data/models/favorites_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  factory HiveDatabase() => _instance;

  HiveDatabase._();

  static final HiveDatabase _instance = HiveDatabase._();

  Box<AddNotificationModel>? notificationBox;
  Box<FavoritesModel>? favoritesBox;
  Box<CartItemModel>? cartBox;
  Box<ShippingAddressModel>? addressBox;

  Future<void> setup() async {
    await Hive.initFlutter();

    Hive
      ..registerAdapter(AddNotificationModelAdapter())
      ..registerAdapter(FavoritesModelAdapter())
      ..registerAdapter(CartItemModelAdapter())
      ..registerAdapter(ShippingAddressModelAdapter());

    notificationBox =
        await Hive.openBox<AddNotificationModel>('notification_box');

    favoritesBox = await Hive.openBox<FavoritesModel>('favorites_box');
    cartBox = await Hive.openBox<CartItemModel>('cart_box');
    addressBox = await Hive.openBox<ShippingAddressModel>('address_box');
  }

  Future<void> clearAllBox() async {
    await notificationBox!.clear();
    await favoritesBox!.clear();
    await cartBox!.clear();
    await addressBox!.clear();
  }
}
