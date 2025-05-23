import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/payment/managers/payment/payment_state.dart';
import '../../../../data/repository/payment_repository.dart';

part 'payment_events.dart';

class PaymentBloc extends Bloc<PaymentEvents, PaymentState> {
  final PaymentRepository _repo;

  PaymentBloc({required PaymentRepository repo})
      : _repo = repo,
        super(PaymentState.initial()) {
    on<PaymentLoad>(_onLoad);
    on<DeleteCard>(_onDelete);
    add(PaymentLoad());
  }

  Future<void> _onLoad(PaymentLoad event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(status: PaymentStatus.loading));
    try {
      final card = await _repo.fetchPayment();
      emit(state.copyWith(cards: card, status: PaymentStatus.success));
    } catch (e) {
      emit(state.copyWith(status: PaymentStatus.error));
    }
  }

  Future _onDelete(DeleteCard event, Emitter<PaymentState> emit) async{
    await _repo.deleteCard(event.id);
  }
}
