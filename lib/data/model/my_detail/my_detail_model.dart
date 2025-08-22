import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/interfaces/serializable.dart';
part'my_detail_model.freezed.dart';
part 'my_detail_model.g.dart';

@freezed
abstract class MyDetailModel with _$MyDetailModel implements IJsonSerializable{
  const factory MyDetailModel({
    required String gender,
    required String fullName,
    required String email,
    required String phoneNumber,
    required String birthDate,
  }) = _MyDetailModel;

  factory MyDetailModel.fromJson(Map<String, dynamic> json) => _$MyDetailModelFromJson(json);
}
