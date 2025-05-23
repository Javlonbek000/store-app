import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/model/payment/new_card_model.dart';
import 'package:store_app/data/repository/new_card_repository.dart';
import 'package:store_app/features/payment/managers/new_card/new_card_state.dart';

part 'new_card_events.dart';

class NewCardBloc extends Bloc<NewCardEvents, NewCardState> {
  final NewCardRepository _repo;

  NewCardBloc({required NewCardRepository repo})
      : _repo = repo,
        super(NewCardState.initial()) {
    on<AddCard>(_onLoad);
  }

  Future<void> _onLoad(AddCard event, Emitter<NewCardState> emit) async {
    emit(state.copyWith(status: NewCardStatus.loading));
    try {
      final result = await _repo.newCard(NewCardModel(
        cardNumber: event.cardNumber,
        expiryDate: event.expiryDate,
        securityCode: event.securityCode,
      ));
      emit(state.copyWith(status: NewCardStatus.success, errorMassage: result));
    } catch (e) {
      emit(state.copyWith(
          status: NewCardStatus.error, errorMassage: e.toString()));
    }
  }
}
