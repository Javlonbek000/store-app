sealed class HomeEvents {}

final class HomeLoad extends HomeEvents {
  final int categoryId;
  final String? orderBy;
  final int? sizeId;
  final double? minPrice, maxPrice;

  HomeLoad({
    required this.categoryId,
    this.orderBy,
    this.sizeId,
    this.minPrice,
    this.maxPrice,
  });
}

final class ChangeCategory extends HomeEvents {
  final int categoryId;

  ChangeCategory({required this.categoryId});
}

final class HomeSearch extends HomeEvents {
  final String title;

  HomeSearch({required this.title});
}

final class HomeSaved extends HomeEvents {
  final int productId;

  HomeSaved({required this.productId});
}

final class HomeUnSaved extends HomeEvents {
  final int productId;

  HomeUnSaved({required this.productId});
}
