import 'package:store_app/core/client.dart';

import '../model/detail/detail_model.dart';
import '../model/product/product_model.dart';
import '../model/size/size_model.dart';

class ProductRepository {
  ProductRepository({required this.client});

  final ApiClient client;
  List<ProductModel> products = [];
  List<ProductModel> savedItems = [];
  DetailModel? detail;
  List<SizeModel> sizes = [];

  Future<List<ProductModel>> getProducts({
    required int categoryId,
    String? orderBy,
    double? minPrice,
    double? maxPrice,
    int? sizeId,
  }) async {
    var rawProducts = await client.genericGetRequest<List<dynamic>>(
      '/products/list',
      queryParams: {
        "CategoryId": categoryId,
        "OrderBy": orderBy,
        "MinPrice": minPrice,
        "MaxPrice": maxPrice,
        "SizeId": sizeId,
      },
    );
    products =
        rawProducts.map((category) => ProductModel.fromJson(category)).toList();
    return products;
  }

  Future<List<ProductModel>> getSavedItems() async {
    var rawSavedItems = await client.genericGetRequest<List<dynamic>>(
      '/products/saved-products',
    );
    products =
        rawSavedItems.map((item) => ProductModel.fromJson(item)).toList();
    return products;
  }

  Future<void> savedItem({required productId}) async {
    await client.saveItem(productId: productId);
  }

  Future<void> unSavedItem({required productId}) async {
    await client.unSaveItem(productId: productId);
  }

  Future<DetailModel?> fetchProductDetail(int productId) async {
    final rawDetail = await client.genericGetRequest<Map<String, dynamic>>(
      '/products/detail/$productId',
    );
    detail = DetailModel.fromJson(rawDetail);
    return detail!;
  }

  Future<List<SizeModel>> fetchSizes() async {
    var rawSizes = await client.genericGetRequest<List<dynamic>>('/sizes/list');
    sizes = rawSizes.map((size) => SizeModel.fromJson(size)).toList();
    return sizes;
  }

  Future<bool> addProduct({required int productId, required int sizeId}) async {
    var result = await client.addProduct(productId: productId, sizeId: sizeId);
    return result;
  }
}
