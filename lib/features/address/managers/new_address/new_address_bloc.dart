import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import "package:latlong2/latlong.dart" show LatLng;
import 'package:store_app/data/model/address/address_model.dart';
import 'package:store_app/data/repository/address_repository.dart';

import 'new_address_events.dart';
import 'new_address_state.dart';

class NewAddressBloc extends Bloc<NewAddressEvents, NewAddressState> {
  final AddressRepository _repo;

  NewAddressBloc({required AddressRepository repo})
    : _repo = repo,
      super(NewAddressState.initial()) {
    on<GoToCurrentLocation>(_onGoToCurrentLocation);
    on<NewAddressChooseLocation>(_onChosenLocation);
    on<AddNewAddress>(_onAddAddress);
  }

  final controller = MapController();

  Future<void> _onAddAddress(
    AddNewAddress event,
    Emitter<NewAddressState> emit,
  ) async {
    try {
      final result = await _repo.addAddress(
        NewAddressModel(
          title: event.title,
          fullAddress: event.fullAddress,
          lat: event.lat,
          lng: event.lng,
          isDefault: event.isDefault,
        ),
      );
      emit(
        state.copyWith(status: NewAddressStatus.success, errorMassage: result['statusMassage']),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: NewAddressStatus.error,
          errorMassage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onGoToCurrentLocation(
      GoToCurrentLocation event,
      Emitter<NewAddressState> emit,
      ) async {
    var status = await Permission.locationWhenInUse.status;

    if (status.isDenied || status.isRestricted) {
      status = await Permission.locationWhenInUse.request();
    }

    if (!status.isGranted) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final currentPosition = LatLng(position.latitude, position.longitude);

    controller.move(currentPosition, 15);

    emit(state.copyWith(
      currentLocation: currentPosition,
      markers: [
        Marker(
          point: currentPosition,
          width: 40.w,
          height: 40.h,
          child: Icon(Icons.location_on, color: Colors.red, size: 40),
        ),
      ],
    ));
  }


  Future<void> _onChosenLocation(
    NewAddressChooseLocation event,
    Emitter<NewAddressState> emit,
  ) async {
    controller.move(event.chosenLocation, controller.camera.zoom);
    emit(
      state.copyWith(
        currentLocation: event.chosenLocation,
        markers: [
          Marker(
            point: event.chosenLocation,
            width: 40.w,
            height: 40.h,
            child: Icon(Icons.location_on, color: Colors.red, size: 40),
          ),
        ],
      ),
    );
    List<Placemark> placeMarks = await placemarkFromCoordinates(
      event.chosenLocation.latitude,
      event.chosenLocation.longitude,
    );

    if (placeMarks.isNotEmpty) {
      Placemark p = placeMarks.first;
      final addressString =
          '${p.country}, ${p.administrativeArea}, ${p.locality}, ${p.street}, ${p.name}';
      emit(state.copyWith(address: addressString));
    }
    emit(state.copyWith(status: NewAddressStatus.selected));
    emit(state.copyWith(status: NewAddressStatus.idle));
  }
}
