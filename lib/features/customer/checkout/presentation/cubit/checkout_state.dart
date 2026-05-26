part of 'checkout_cubit.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = _Initial;
  const factory CheckoutState.updated() = CheckoutUpdatedState;
  const factory CheckoutState.orderPlaced() = OrderPlacedState;
}
