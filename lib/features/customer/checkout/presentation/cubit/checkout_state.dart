part of 'checkout_cubit.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = _Initial;
  const factory CheckoutState.updated() = CheckoutUpdatedState;
  const factory CheckoutState.loading() = CheckoutLoadingState;
  const factory CheckoutState.orderPlaced() = OrderPlacedState;
  const factory CheckoutState.error(String message) = CheckoutErrorState;
}
