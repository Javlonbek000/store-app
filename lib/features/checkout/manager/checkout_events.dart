part of 'checkout_bloc.dart';

sealed class CheckoutEvents {}

final class CheckoutAddOrder extends CheckoutEvents {
  final int addressId;
  final int? cardId;
  final String paymentMethod;

  CheckoutAddOrder({
    required this.addressId,
    required this.cardId,
    required this.paymentMethod,
  });
}

final class CheckoutSummery extends CheckoutEvents {
  final PaymentModel? card;
  final AddressModel? address;

  CheckoutSummery({this.card, this.address});
}

final class CheckoutSelectCard extends CheckoutEvents {
  final PaymentModel card;

  CheckoutSelectCard({required this.card});
}

final class CheckoutSelectAddress extends CheckoutEvents {
  final AddressModel address;

  CheckoutSelectAddress({required this.address});
}
