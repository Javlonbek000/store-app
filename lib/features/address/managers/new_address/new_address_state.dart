import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

part 'new_address_state.freezed.dart';

enum NewAddressStatus { idle,selected, loading, success, error }

@freezed
abstract class NewAddressState with _$NewAddressState {
  const factory NewAddressState({
    required LatLng? currentLocation,
    required String? address,
    required List<Marker> markers,
    required NewAddressStatus status,
    required String? errorMassage,
  }) = _NewAddressState;

  factory NewAddressState.initial() {
    return NewAddressState(
      currentLocation: null,
      address: null,
      markers: [],
      status: NewAddressStatus.idle,
      errorMassage: "",
    );
  }
}
