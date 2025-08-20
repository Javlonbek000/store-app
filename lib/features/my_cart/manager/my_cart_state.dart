import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/my_cart/cart_model.dart';

part 'my_cart_state.freezed.dart';

enum MyCartStatus { loading, success, error, deleted, canceled}

@freezed
abstract class MyCartState with _$MyCartState {
  const factory MyCartState({
    required CartModel? cart,
    required MyCartStatus status,
    required String? errorMessage,
  }) = _MyCartState;

  factory MyCartState.initial() {
    return MyCartState(
      cart: null,
      status: MyCartStatus.loading,
      errorMessage: null,
    );
  }
}
