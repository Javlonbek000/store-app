sealed class HomeEvents {}

final class CategoryLoad extends HomeEvents {}

final class FilterProducts extends HomeEvents {
  final int? categoryId;
  final String? orderBy, title;
  final int? sizeId;

  FilterProducts({
    this.categoryId,
    this.title,
    this.orderBy,
    this.sizeId,
  });
}

final class HomeSaved extends HomeEvents {
  final int productId;

  HomeSaved({required this.productId});
}

final class HomeUnSaved extends HomeEvents {
  final int productId;

  HomeUnSaved({required this.productId});
}
