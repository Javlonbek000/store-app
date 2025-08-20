import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/product_repository.dart';
import 'details_state.dart';

part 'details_event.dart';

class DetailsBloc extends Bloc<DetailEvent, DetailState> {
  final ProductRepository _repo;

  DetailsBloc({required ProductRepository repo, required int id})
    : _repo = repo,
      super(DetailState.initial()) {
    on<DetailLoading>(_onLoading);
    on<DetailSaveProduct>(_detailSaved);
    on<DetailUnSaveProduct>(_detailUnSaved);
    on<DetailAddProduct>(_addProduct);
    add(DetailLoading(productId: id));
  }

  Future<void> _onLoading(
    DetailLoading event,
    Emitter<DetailState> emit,
  ) async {
    try {
      final detail = await _repo.fetchProductDetail(event.productId);
      emit(state.copyWith(detail: detail, status: DetailStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DetailStatus.error));
    }
  }

  Future<void> _detailSaved(
    DetailSaveProduct event,
    Emitter<DetailState> emit,
  ) async {
    await _repo.savedItem(productId: event.productId);

    if (state.detail != null) {
      final updatedDetail = state.detail!.copyWith(isLiked: true);
      emit(state.copyWith(detail: updatedDetail));
    }
  }

  Future<void> _detailUnSaved(
    DetailUnSaveProduct event,
    Emitter<DetailState> emit,
  ) async {
    await _repo.unSavedItem(productId: event.productId);

    if (state.detail != null) {
      final updatedDetail = state.detail!.copyWith(isLiked: false);
      emit(state.copyWith(detail: updatedDetail));
    }
  }

  Future<void> _addProduct(
    DetailAddProduct event,
    Emitter<DetailState> emit,
  ) async {
    try {
      final result = await _repo.addProduct(productId: event.productId, sizeId: event.sizeId);
      if (result) {
        emit(state.copyWith(status: DetailStatus.added));
        emit(state.copyWith(status: DetailStatus.success));
      }else{
        emit(state.copyWith(status: DetailStatus.notAdded));
        emit(state.copyWith(status: DetailStatus.success));
      }
    } catch (e) {
      emit(
        state.copyWith(status: DetailStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
