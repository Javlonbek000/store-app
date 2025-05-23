import 'package:store_app/core/client.dart';
import 'package:store_app/data/interfaces/product_repository_interface.dart';
import 'package:store_app/data/model/detail/detail_model.dart';
import 'package:store_app/data/model/product/product_model.dart';
import 'package:store_app/data/model/size/size_model.dart';
import 'package:store_app/data/repository/product/product_repository_local.dart';
import 'package:store_app/data/repository/product/product_repository_remote.dart';

class ProductRepository implements IProductRepository {
  ProductRepository({
    required this.client,
    required this.localRepo,
    required this.remoteRepo,
  });

  final ApiClient client;
  final ProductRepositoryLocal localRepo;
  final ProductRepositoryRemote remoteRepo;

  List<ProductModel> products = [];
  List<ProductModel> savedItems = [];
  DetailModel? detail;
  List<SizeModel> sizes = [];

  @override
  Future<List<ProductModel>> getProducts({required int productId}) async {
    final localProducts = await localRepo.getProducts(productId: productId);
    final remoteProducts = await remoteRepo.getProducts(productId: productId);
    if (localProducts.isEmpty || localProducts != remoteProducts) {
      return remoteProducts;
    } else {
      return localProducts;
    }
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
