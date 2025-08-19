import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:store_app/features/address/managers/new_address/new_address_bloc.dart';
import 'package:store_app/features/address/managers/new_address/new_address_events.dart';

class NewAddressMap extends StatelessWidget {
  const NewAddressMap({super.key, required this.markers, required this.address});

  final List<Marker> markers;
  final String? address;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FlutterMap(
            mapController: context.read<NewAddressBloc>().controller,
            options: MapOptions(
              initialCenter: LatLng(41.285799883900715, 69.20363493014382),
              onTap: (tapPosition, point) {
                context.read<NewAddressBloc>().add(
                  NewAddressChooseLocation(chosenLocation: point),
                );
              },
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(markers: markers),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Address: $address'),
        ),
      ],
    );
  }
}
