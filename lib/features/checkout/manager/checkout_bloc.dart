import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/model/address/address_model.dart';
import 'package:store_app/data/repository/my_cart_repository.dart';
import 'package:store_app/features/checkout/manager/checkout_state.dart';

import '../../../data/model/payment/payment_model.dart';

part 'checkout_events.dart';

class CheckoutBloc extends Bloc<CheckoutEvents, CheckoutState> {
  final MyCartRepository _repo;

  CheckoutBloc({required MyCartRepository repo, required PaymentModel? card, required AddressModel? address})
      : _repo = repo,
        super(CheckoutState.initial()) {
    on<CheckoutSummery>(_onLoad);
    add(CheckoutSummery(card: card, address: address));
  }

  Future<void> _onLoad(
      CheckoutSummery event, Emitter<CheckoutState> emit) async {
    emit(state.copyWith(status: CheckoutStatus.loading));
    try{
      final cart = await _repo.fetchCarts();
      emit(state.copyWith(cart: cart, status: CheckoutStatus.success, card: event.card, address: event.address));
    }catch(e){
      emit(state.copyWith(status: CheckoutStatus.error));
    }
  }
}
