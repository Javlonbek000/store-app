import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/checkout/checkout_model.dart';

class CheckoutRepository{

  CheckoutRepository({required this.client});
  final ApiClient client;

  Future<String> createOrder(CheckoutModel data)async{
    final result = await client.genericPostRequest("/orders/create", data: data);
    return result;
  }
}