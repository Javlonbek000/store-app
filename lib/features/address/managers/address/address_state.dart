import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/model/address/address_model.dart';

part 'address_state.freezed.dart';

enum AddressStatus { idle, loading, success, error }

@freezed
abstract class AddressState with _$AddressState {
  const factory AddressState({
    required List<AddressModel> addresses,
    required AddressStatus status,
  }) = _AddressState;

  factory AddressState.initial() {
    return AddressState(addresses: [], status: AddressStatus.idle);
  }
}
