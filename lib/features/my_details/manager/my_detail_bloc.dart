import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/my_detail_repository.dart';
import 'package:store_app/features/my_details/manager/my_detail_events.dart';
import 'package:store_app/features/my_details/manager/my_detail_state.dart';

class MyDetailBloc extends Bloc<MyDetailEvents, MyDetailState> {
  final MyDetailRepository _repo;

  MyDetailBloc({required MyDetailRepository repo})
    : _repo = repo,
      super(MyDetailState.initial()) {
    on<MyDetailUpdate>(_onUpdateUser);
  }

  Future<void> _onUpdateUser(
    MyDetailUpdate event,
    Emitter<MyDetailState> emit,
  ) async {
    emit(state.copyWith(status: MyDetailStatus.loading));
    try {
      final result = await _repo.updateUser(data: event.model);
      if (result) {
        emit(state.copyWith(status: MyDetailStatus.success));
      } else {
        emit(state.copyWith(status: MyDetailStatus.error, errorMessage: "Xatolik yuz berdi iltimos qayta login qilib koring!"));
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: MyDetailStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
