import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/my_cart/cart_model.dart';

part 'checkout_state.freezed.dart';

enum CheckoutStatus { idle, loading, success, error }

@freezed
abstract class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    required CartModel? cart,
    required CheckoutStatus status,
  }) = _CheckoutState;

  factory CheckoutState.initial() {
    return CheckoutState(
      cart: null,
      status: CheckoutStatus.idle,
    );
  }
}
