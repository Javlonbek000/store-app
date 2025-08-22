import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_detail_state.freezed.dart';

enum MyDetailStatus { idle, loading, success, error }

@freezed
abstract class MyDetailState with _$MyDetailState {
  const factory MyDetailState({
    required MyDetailStatus status,
    required String? errorMessage,
  }) = _MyDetailState;

  factory MyDetailState.initial() {
    return MyDetailState(status: MyDetailStatus.idle, errorMessage: null);
  }
}
