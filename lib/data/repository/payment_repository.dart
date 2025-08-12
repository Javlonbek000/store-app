import 'package:store_app/core/client.dart';

import '../model/payment/payment_model.dart';


class PaymentRepository {
  final ApiClient client;

  PaymentRepository({required this.client});

  List<PaymentModel> payment = [];

  Future<List<PaymentModel>> fetchPayment() async {
    final response =
    await client.genericGetRequest<List<dynamic>>("/cards/list");
    payment = response.map((item) => PaymentModel.fromJson(item)).toList();
    return payment;
  }

  Future<bool> deleteCard(int cardId)async{
    final response = await client.genericDeleteRequest("/cards/delete/$cardId");
    return response;
  }
}
