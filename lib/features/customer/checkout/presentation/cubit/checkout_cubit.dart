import 'package:asroo_store/core/service/hive/hive_database.dart';
import 'package:asroo_store/features/customer/cart/data/models/cart_item_model.dart';
import 'package:asroo_store/features/customer/checkout/data/models/shipping_address_model.dart';
import 'package:asroo_store/features/customer/orders/data/repos/orders_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_state.dart';
part 'checkout_cubit.freezed.dart';

enum PaymentMethod { cashOnDelivery, creditCard, wallet }

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this._ordersRepo) : super(const CheckoutState.initial());

  final OrdersRepo _ordersRepo;

  PaymentMethod _paymentMethod = PaymentMethod.cashOnDelivery;

  PaymentMethod get paymentMethod => _paymentMethod;

  String get paymentMethodLabel {
    switch (_paymentMethod) {
      case PaymentMethod.cashOnDelivery:
        return 'Cash on Delivery';
      case PaymentMethod.creditCard:
        return 'Credit Card';
      case PaymentMethod.wallet:
        return 'Wallet';
    }
  }

  ShippingAddressModel? get savedAddress {
    final box = HiveDatabase().addressBox!;
    if (box.isNotEmpty) {
      return box.getAt(0);
    }
    return null;
  }

  Future<void> saveAddress({
    required String fullName,
    required String phoneNumber,
    required String city,
    required String area,
    required String street,
    required String buildingNo,
    required String floor,
    required String addressNotes,
  }) async {
    emit(const CheckoutState.initial());
    final box = HiveDatabase().addressBox!;
    await box.clear();
    await box.add(
      ShippingAddressModel(
        fullName: fullName,
        phoneNumber: phoneNumber,
        city: city,
        area: area,
        street: street,
        buildingNo: buildingNo,
        floor: floor,
        addressNotes: addressNotes,
      ),
    );
    emit(const CheckoutState.updated());
  }

  void selectPaymentMethod(PaymentMethod method) {
    emit(const CheckoutState.initial());
    _paymentMethod = method;
    emit(const CheckoutState.updated());
  }

  Future<void> placeOrder({
    required List<CartItemModel> cartItems,
    required double subtotal,
    required double shipping,
    required double discount,
    required double total,
  }) async {
    emit(const CheckoutState.loading());
    try {
      final address = savedAddress;
      final items = cartItems
          .map(
            (item) => {
              'productId': item.productId.toString(),
              'name': item.title,
              'imageUrl': item.image,
              'price': item.price,
              'quantity': item.quantity,
              'total': item.price * item.quantity,
            },
          )
          .toList();

      final addressMap = address != null
          ? {
              'fullName': address.fullName,
              'phone': address.phoneNumber,
              'city': address.city,
              'area': address.area,
              'street': address.street,
              'buildingNo': address.buildingNo,
              'floorOrApartment': address.floor,
              'notes': address.addressNotes,
            }
          : <String, dynamic>{};

      await _ordersRepo.createOrder(
        items: items,
        subtotal: subtotal,
        deliveryFee: shipping,
        discount: discount,
        total: total,
        paymentMethod: _paymentMethod.name,
        address: addressMap,
      );

      emit(const CheckoutState.orderPlaced());
    } catch (e) {
      emit(CheckoutState.error(e.toString()));
    }
  }
}
