import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/model/product/product_model.dart';

part 'saved_items_state.freezed.dart';

enum SavedItemsStatus { loading, error, success }

@freezed
abstract class SavedItemsState with _$SavedItemsState {
  const factory SavedItemsState({
    required List<ProductModel> savedItems,
    required SavedItemsStatus status,
    required String? errorMessage,
  }) = _SavedItemsState;

  factory SavedItemsState.initial() {
    return SavedItemsState(
      savedItems: [],
      status: SavedItemsStatus.loading,
      errorMessage: null,
    );
  }
}
