import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/interfaces/serializable.dart';

part 'order_model.freezed.dart';

part 'order_model.g.dart';

@freezed
abstract class OrderModel with _$OrderModel implements IJsonSerializable {
  const factory OrderModel({
    required int id,
    required String title,
    required String image,
    required String size,
    required int price,
    required String status,
    required num? rating,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
}
