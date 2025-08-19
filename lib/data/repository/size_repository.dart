import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/size/size_model.dart';

class SizeRepository {
  final ApiClient client;

  SizeRepository({required this.client});

  Future<List<SizeModel>> fetchSizes() async {
    final rowSize = await client.genericGetRequest<List<dynamic>>('/sizes/list');
    return rowSize.map((e) => SizeModel.fromJson(e)).toList();
  }
}
