part of 'payment_bloc.dart';

sealed class PaymentEvents {}

final class PaymentLoad extends PaymentEvents{}

final class DeleteCard extends PaymentEvents{
  final int id;

  DeleteCard({required this.id});
}
