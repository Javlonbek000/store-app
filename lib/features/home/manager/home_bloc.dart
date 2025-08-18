import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/manager/home_events.dart';
import 'package:store_app/features/home/manager/home_state.dart';
import '../../../data/repository/category_repository.dart';
import '../../../data/repository/product_repository.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  final ProductRepository _repo;
  final CategoryRepository _catRepo;

  HomeBloc({
    required ProductRepository repo,
    required CategoryRepository catRepo,
  }) : _catRepo = catRepo,
       _repo = repo,
       super(HomeState.initial()) {
    on<CategoryLoad>(_onLoad);
    on<HomeSaved>(_homeSaved);
    on<HomeUnSaved>(_homeUnSaved);
    on<FilterProducts>(_changedCategory);
    add(CategoryLoad());
  }

  Future<void> _onLoad(CategoryLoad event, Emitter<HomeState> emit) async {
    final products = await _repo.getProducts();
    final categories = await _catRepo.getCategories();
    categories.sort((a, b) => a.id.compareTo(b.id));

    emit(
      state.copyWith(
        categories: categories,
        products: products,
        status: HomeStatus.success,
      ),
    );
  }

  Future<void> _changedCategory(
    FilterProducts event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    final products = await _repo.getProducts(
      categoryId: event.categoryId,
      orderBy: event.orderBy,
      sizeId: event.sizeId,
      title: event.title,
    );

    emit(
      state.copyWith(
        selectedCategory: event.categoryId,
        sizeId: event.sizeId,
        orderBy: event.orderBy,
        products: products,
        status: HomeStatus.success,
      ),
    );
  }

  Future<void> _homeUnSaved(HomeUnSaved event, Emitter<HomeState> emit) async {
    await _repo.unSavedItem(productId: event.productId);
  }

  Future<void> _homeSaved(HomeSaved event, Emitter<HomeState> emit) async {
    await _repo.savedItem(productId: event.productId);
  }
}
