import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/my_cart_repository.dart';
import 'package:store_app/features/checkout/manager/checkout_state.dart';

part 'checkout_events.dart';

class CheckoutBloc extends Bloc<CheckoutEvents, CheckoutState> {
  final MyCartRepository _repo;

  CheckoutBloc({required MyCartRepository repo})
      : _repo = repo,
        super(CheckoutState.initial()) {
    on<CheckoutSummery>(_onLoad);
    add(CheckoutSummery());
  }

  Future<void> _onLoad(
      CheckoutSummery event, Emitter<CheckoutState> emit) async {
    emit(state.copyWith(status: CheckoutStatus.loading));
    try{
      final cart = await _repo.fetchCarts();
      emit(state.copyWith(cart: cart, status: CheckoutStatus.success));
    }catch(e){
      emit(state.copyWith(status: CheckoutStatus.error));
    }
  }
}
