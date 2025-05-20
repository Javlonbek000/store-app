import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/model/payment/payment_model.dart';


part 'payment_state.freezed.dart';

enum PaymentStatus { idle, loading, success, error }

@freezed
abstract class PaymentState with _$PaymentState {
  const factory PaymentState({
    required List<PaymentModel> cards,
    required PaymentStatus status,
  }) = _PaymentState;

  factory PaymentState.initial() =>
      const PaymentState(cards: [], status: PaymentStatus.idle);
}
