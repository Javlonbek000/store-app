import 'package:latlong2/latlong.dart';

sealed class NewAddressEvents {}

final class GoToCurrentLocation extends NewAddressEvents {}

final class NewAddressChooseLocation extends NewAddressEvents {
  final LatLng chosenLocation;

  NewAddressChooseLocation({required this.chosenLocation});
}

final class AddNewAddress extends NewAddressEvents {
  final String title, fullAddress;
  final double lat, lng;
  final bool isDefault;

  AddNewAddress({
    required this.title,
    required this.fullAddress,
    required this.lat,
    required this.lng,
    required this.isDefault,
  });
}
