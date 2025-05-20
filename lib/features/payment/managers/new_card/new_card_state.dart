import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_card_state.freezed.dart';

enum NewCardStatus { idle, loading, success, error }

@freezed
abstract class NewCardState with _$NewCardState {
  const factory NewCardState({
    required NewCardStatus status,
    required String errorMassage,
  }) = _NewCardState;

  factory NewCardState.initial() {
    return NewCardState(
      status: NewCardStatus.idle,
      errorMassage: '',
    );
  }
}
