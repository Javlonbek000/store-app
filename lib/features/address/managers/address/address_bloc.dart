import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/address/address_repository.dart';
import 'package:store_app/features/address/managers/address/address_state.dart';

part 'address_events.dart';

class AddressBloc extends Bloc<AddressEvents, AddressState> {
  final AddressRepository _repo;

  AddressBloc({required AddressRepository repo})
    : _repo = repo,
      super(AddressState.initial()) {
    on<AddressLoad>(_onLoad);
    add(AddressLoad());
  }

  Future<void> _onLoad(AddressEvents event, Emitter<AddressState> emit) async {
    emit(state.copyWith(status: AddressStatus.loading));
    final addresses = await _repo.fetchAddress();
    emit(state.copyWith(status: AddressStatus.success, addresses: addresses));
  }
}
