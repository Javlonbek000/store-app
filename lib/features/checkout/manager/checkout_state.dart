import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/address/address_model.dart';
import '../../../data/model/my_cart/cart_model.dart';
import '../../../data/model/payment/payment_model.dart';

part 'checkout_state.freezed.dart';

enum CheckoutStatus { idle, loading, success, error, added, unAdded}

@freezed
abstract class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    required CartModel? cart,
    required CheckoutStatus status,
    required PaymentModel? card,
    required AddressModel? address,
    required String? errorMessage,
  }) = _CheckoutState;

  factory CheckoutState.initial() {
    return CheckoutState(
      errorMessage: null,
      cart: null,
      status: CheckoutStatus.idle,
      card: null,
      address: null,
    );
  }
}
