import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/interfaces/serializable.dart';

part 'checkout_model.freezed.dart';

part 'checkout_model.g.dart';

@freezed
abstract class CheckoutModel with _$CheckoutModel implements IJsonSerializable{
  const factory CheckoutModel({
    required int addressId,
    required String paymentMethod,
    required int? cardId,
  })=_CheckoutModel;

  factory CheckoutModel.fromJson(Map<String, dynamic>json)=> _$CheckoutModelFromJson(json);
}