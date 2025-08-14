import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/model/product/product_model.dart';

part 'search_state.freezed.dart';
enum SearchStatus { idle, loading, success, error }

@freezed
abstract class SearchState with _$SearchState {

  const factory SearchState({
    required List<ProductModel> products,
    required SearchStatus status,
    required String? errorMessage,
  }) = _SearchState;

  factory SearchState.initial() {
    return SearchState(
      products: [],
      status: SearchStatus.idle,
      errorMessage: null,
    );
  }
}
