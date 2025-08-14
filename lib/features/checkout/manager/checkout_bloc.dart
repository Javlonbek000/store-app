import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/model/address/address_model.dart';
import 'package:store_app/data/model/checkout/checkout_model.dart';
import 'package:store_app/data/repository/checkout_repository.dart';
import 'package:store_app/data/repository/my_cart_repository.dart';
import 'package:store_app/features/checkout/manager/checkout_state.dart';

import '../../../data/model/payment/payment_model.dart';

part 'checkout_events.dart';

class CheckoutBloc extends Bloc<CheckoutEvents, CheckoutState> {
  final MyCartRepository _repo;
  final CheckoutRepository _checkRepo;

  CheckoutBloc({
    required MyCartRepository repo,
    required PaymentModel? card,
    required AddressModel? address,
    required CheckoutRepository checkRepo,
  }) : _repo = repo,
       _checkRepo = checkRepo,
       super(CheckoutState.initial()) {
    on<CheckoutSummery>(_onLoad);
    on<CheckoutSelectCard>(_onSelectCard);
    on<CheckoutSelectAddress>(_onSelectAddress);
    on<CheckoutAddOrder>(_onCheckoutAdd);
    add(CheckoutSummery(card: card, address: address));
  }

  Future<void> _onLoad(
    CheckoutSummery event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(state.copyWith(status: CheckoutStatus.loading));
    try {
      final cart = await _repo.fetchCarts();
      emit(
        state.copyWith(
          cart: cart,
          status: CheckoutStatus.success,
          card: event.card,
          address: event.address,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: CheckoutStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> _onCheckoutAdd(
    CheckoutAddOrder event,
    Emitter<CheckoutState> emit,
  ) async {
    try {
      await _checkRepo.createOrder(
        CheckoutModel(
          addressId: event.addressId,
          paymentMethod: event.paymentMethod,
          cardId: event.cardId,
        ),
      );
      emit(state.copyWith(status: CheckoutStatus.added));
    }catch(e){
      emit(state.copyWith(status: CheckoutStatus.unAdded, errorMessage: e.toString()));
    }
  }

  Future _onSelectCard(
    CheckoutSelectCard event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(state.copyWith(card: event.card));
  }

  Future _onSelectAddress(
    CheckoutSelectAddress event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(state.copyWith(address: event.address));
  }
}
