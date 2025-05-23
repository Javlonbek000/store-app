import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/interfaces/serializable.dart';

part 'address_model.freezed.dart';

part 'address_model.g.dart';

@freezed
abstract class AddressModel with _$AddressModel implements IJsonSerializable {
  const factory AddressModel({
    required int id,
    required String title,
    required String fullAddress,
    required double lat,
    required double lng,
    required bool isDefault,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}

@freezed
abstract class NewAddressModel
    with _$NewAddressModel
    implements IJsonSerializable {
  const factory NewAddressModel({
    required String title,
    required String fullAddress,
    required double lat,
    required double lng,
    required bool isDefault,
  }) = _NewAddressModel;

  factory NewAddressModel.fromJson(Map<String, dynamic> json) =>
      _$NewAddressModelFromJson(json);
}
