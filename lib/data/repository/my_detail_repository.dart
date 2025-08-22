import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/my_detail/my_detail_model.dart';

class MyDetailRepository {
  final ApiClient client;

  MyDetailRepository({required this.client});

  Future<bool> updateUser({required MyDetailModel data}) async {
    final result = await client.genericPatchRequest(
      '/auth/update',
      data: data.toJson(),
    );
    return result;
  }
}
