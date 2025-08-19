import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/model/category/category_model.dart';
import 'package:store_app/data/model/product/product_model.dart';
import 'package:store_app/data/model/size/size_model.dart';

part 'home_state.freezed.dart';

enum HomeStatus { loading, error, success }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required List<CategoryModel> categories,
    required List<ProductModel> products,
    required List<SizeModel> sizes,
    required int? selectedCategory,
    required String? orderBy,
    required int? sizeId,
    required HomeStatus status,
  }) = _HomeState;

  factory HomeState.initial() {
    return HomeState(
      categories: [],
      products: [],
      sizes: [],
      status: HomeStatus.loading,
      selectedCategory: null,
      orderBy: null,
      sizeId: null,
    );
  }
}
