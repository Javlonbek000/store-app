import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/product/order/order_model.dart';

class OrderRepository {
  final ApiClient client;

  OrderRepository({required this.client});

  Future<List<OrderModel>> fetchOrders() async {
    final rawOrders = await client.genericGetRequest<List<dynamic>>('/orders/list');
    return rawOrders.map((order) => OrderModel.fromJson(order)).toList();
  }
}
