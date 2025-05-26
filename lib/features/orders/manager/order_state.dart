import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/model/product/order/order_model.dart';

part 'order_state.freezed.dart';

enum OrderStatus { idle, loading, success, error }

@freezed
abstract class OrderState with _$OrderState {
  const factory OrderState({
    required List<OrderModel> orders,
    required OrderStatus status,
  }) = _OrderState;

  factory OrderState.initial() {
    return OrderState(orders: [], status: OrderStatus.idle);
  }
}
