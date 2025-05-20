part of 'new_card_bloc.dart';

sealed class NewCardEvents {}

final class AddCard extends NewCardEvents {
  final String cardNumber, expiryDate, securityCode;

  AddCard({
    required this.cardNumber,
    required this.expiryDate,
    required this.securityCode,
  });
}
