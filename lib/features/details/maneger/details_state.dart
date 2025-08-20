import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/model/detail/detail_model.dart';

part 'details_state.freezed.dart';

enum DetailStatus { loading, success, error, added, notAdded }

@freezed
abstract class DetailState with _$DetailState {
  const factory DetailState({
    required DetailModel? detail,
    required DetailStatus status,
    required String? errorMessage,
  }) = _DetailState;

  factory DetailState.initial() {
    return DetailState(
      detail: null,
      status: DetailStatus.loading,
      errorMessage: null,
    );
  }
}
