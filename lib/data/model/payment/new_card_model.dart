import 'package:store_app/data/interfaces/serializable.dart';

class NewCardModel implements IJsonSerializable {
  final String cardNumber, expiryDate, securityCode;

  NewCardModel({
    required this.cardNumber,
    required this.expiryDate,
    required this.securityCode,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "cardNumber": cardNumber,
      "expiryDate": expiryDate,
      "securityCode": securityCode,
    };
  }
}
