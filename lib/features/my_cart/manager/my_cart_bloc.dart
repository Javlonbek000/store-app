import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/my_cart_repository.dart';
import 'package:store_app/features/my_cart/manager/my_cart_state.dart';

part 'my_cart_events.dart';

class MyCartBloc extends Bloc<MyCartEvents, MyCartState> {
  final MyCartRepository _repo;

  MyCartBloc({required MyCartRepository repo})
      : _repo = repo,
        super(MyCartState.initial()) {
    on<MyCartLoad>(_onLoad);
    on<MyCartDelete>(_onDelete);
    add(MyCartLoad());
  }

  Future<void> _onLoad(MyCartLoad event, Emitter<MyCartState> emit) async {
    try {
      final cart = await _repo.fetchCarts();
      emit(state.copyWith(cart: cart, status: MyCartStatus.success));
    } catch (e) {
      emit(state.copyWith(status: MyCartStatus.error));
    }
  }

  Future<void> _onDelete(MyCartDelete event, Emitter<MyCartState> emit)async{
    try{
      final result = await _repo.deleteCart(id: event.id);
      if (result) {
        await _onLoad(MyCartLoad(), emit);
        emit(state.copyWith(status: MyCartStatus.deleted));
      }else{
        emit(state.copyWith(status: MyCartStatus.error));
      }
    }catch (e){
      emit(state.copyWith(status: MyCartStatus.error, errorMessage: e.toString()));
    }
  }
}
