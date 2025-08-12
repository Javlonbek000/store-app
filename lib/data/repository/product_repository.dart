import 'package:store_app/core/client.dart';
import 'package:store_app/data/model/detail/detail_model.dart';
import 'package:store_app/data/model/product/product_model.dart';
import 'package:store_app/data/model/size/size_model.dart';

class ProductRepository {
  ProductRepository({required this.client});

  final ApiClient client;

  Future<List<ProductModel>> getProducts({required int productId}) async {
    var rawProducts = await client.genericGetRequest<List<dynamic>>(
      '/products/list',
      queryParams: {"CategoryId": productId},
    );

    return rawProducts
        .map((category) => ProductModel.fromJson(category))
        .toList();
  }

  Future<List<ProductModel>> getSavedItems() async {
    var rawSavedItems = await client.genericGetRequest<List<dynamic>>(
      '/products/saved-products',
    );
    return rawSavedItems.map((item) => ProductModel.fromJson(item)).toList();
  }

  Future<void> savedItem({required productId}) async {
    await client.genericPostRequestV2('/auth/save/$productId');
  }

  Future<void> unSavedItem({required productId}) async {
    await client.genericPostRequestV2('/auth/unsave/$productId');
  }

  Future<DetailModel?> fetchProductDetail(int productId) async {
    final rawDetail = await client.genericGetRequest<Map<String, dynamic>>(
      '/products/detail/$productId',
    );
    return DetailModel.fromJson(rawDetail);
  }

  Future<List<SizeModel>> fetchSizes() async {
    var rawSizes = await client.genericGetRequest<List<dynamic>>('/sizes/list');
    return rawSizes.map((size) => SizeModel.fromJson(size)).toList();
  }

  Future<bool> addProduct({required int productId, required int sizeId}) async {
    var result = await client.genericPostRequestV2(
      '/my-cart/add-item',
      data: {"productId": productId, "sizeId": sizeId},
    );
    return result;
  }
}
