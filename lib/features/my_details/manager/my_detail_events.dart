import 'package:store_app/data/model/my_detail/my_detail_model.dart';

sealed class MyDetailEvents {}

final class MyDetailUpdate extends MyDetailEvents {
  final MyDetailModel model;

  MyDetailUpdate({required this.model});
}
