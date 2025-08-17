sealed class HomeEvents {}

final class HomeLoad extends HomeEvents {}

final class FilterProducts extends HomeEvents {
  final int? categoryId;
  final String? orderBy, title;
  final int? sizeId;
  final double? minPrice, maxPrice;

  FilterProducts({
    this.categoryId,
    this.title,
    this.orderBy,
    this.sizeId,
    this.minPrice,
    this.maxPrice,
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
