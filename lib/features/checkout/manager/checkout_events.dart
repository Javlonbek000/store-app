part of'checkout_bloc.dart';

sealed class CheckoutEvents{}

final class CheckoutSummery extends CheckoutEvents{
  final PaymentModel? card;
  final AddressModel? address;

  CheckoutSummery({ this.card ,this.address});
}