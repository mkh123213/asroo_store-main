import 'package:asroo_store/core/service/hive/hive_database.dart';
import 'package:asroo_store/features/customer/cart/data/models/cart_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial());

  List<CartItemModel> get cartItems {
    return HiveDatabase().cartBox!.values.toList();
  }

  int get cartCount => cartItems.length;

  double get subtotal {
    return cartItems.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  double get shipping => subtotal > 0 ? 5.99 : 0;

  double get discount => subtotal > 100 ? -20.00 : 0;

  double get total => subtotal + shipping + discount;

  Future<void> addToCart({
    required int productId,
    required String title,
    required String image,
    required double price,
    required double originalPrice,
    required String variant,
  }) async {
    emit(const CartState.initial());
    final existingIndex = HiveDatabase()
        .cartBox!
        .values
        .toList()
        .indexWhere((e) => e.productId == productId);

    if (existingIndex >= 0) {
      final item = HiveDatabase().cartBox!.getAt(existingIndex)!;
      item.quantity++;
      await item.save();
    } else {
      await HiveDatabase().cartBox!.add(
            CartItemModel(
              productId: productId,
              title: title,
              image: image,
              price: price,
              originalPrice: originalPrice,
              variant: variant,
              quantity: 1,
            ),
          );
    }
    emit(const CartState.updated());
  }

  Future<void> removeFromCart(int productId) async {
    emit(const CartState.initial());
    final index = HiveDatabase()
        .cartBox!
        .values
        .toList()
        .indexWhere((e) => e.productId == productId);
    if (index >= 0) {
      await HiveDatabase().cartBox!.deleteAt(index);
    }
    emit(const CartState.updated());
  }

  Future<void> incrementQuantity(int productId) async {
    emit(const CartState.initial());
    final index = HiveDatabase()
        .cartBox!
        .values
        .toList()
        .indexWhere((e) => e.productId == productId);
    if (index >= 0) {
      final item = HiveDatabase().cartBox!.getAt(index)!;
      item.quantity++;
      await item.save();
    }
    emit(const CartState.updated());
  }

  Future<void> decrementQuantity(int productId) async {
    emit(const CartState.initial());
    final index = HiveDatabase()
        .cartBox!
        .values
        .toList()
        .indexWhere((e) => e.productId == productId);
    if (index >= 0) {
      final item = HiveDatabase().cartBox!.getAt(index)!;
      if (item.quantity > 1) {
        item.quantity--;
        await item.save();
      } else {
        await HiveDatabase().cartBox!.deleteAt(index);
      }
    }
    emit(const CartState.updated());
  }

  Future<void> clearCart() async {
    emit(const CartState.initial());
    await HiveDatabase().cartBox!.clear();
    emit(const CartState.updated());
  }
}
