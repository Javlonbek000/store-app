import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:store_app/core/client.dart';
import 'package:store_app/data/repository/address_repository.dart';
import 'package:store_app/data/repository/auth_repository.dart';
import 'package:store_app/data/repository/category_repository.dart';
import 'package:store_app/data/repository/checkout_repository.dart';
import 'package:store_app/data/repository/my_cart_repository.dart';
import 'package:store_app/data/repository/new_card_repository.dart';
import 'package:store_app/data/repository/order_repository.dart';
import 'package:store_app/data/repository/payment_repository.dart';
import 'package:store_app/data/repository/notification_repository.dart';
import 'package:store_app/data/repository/product_repository.dart';
import 'package:store_app/data/repository/reviews_repository.dart';
import 'package:store_app/data/repository/search_repository.dart';
import 'package:store_app/data/repository/size_repository.dart';

final List<SingleChildWidget> providers = [
  Provider(create: (context) => ApiClient()),
  Provider(create: (context) => AuthRepository(client: context.read())),
  Provider(create: (context) => ProductRepository(client: context.read())),
  Provider(create: (context) => SearchRepository(client: context.read())),
  Provider(create: (context) => NotificationRepository(client: context.read())),
  Provider(create: (context) => ReviewRepository(client: context.read())),
  Provider(create: (context) => CategoryRepository(client: context.read())),
  Provider(create: (context) => MyCartRepository(client: context.read())),
  Provider(create: (context) => PaymentRepository(client: context.read())),
  Provider(create: (context) => NewCardRepository(client: context.read())),
  Provider(create: (context) => AddressRepository(client: context.read())),
  Provider(create: (context) => OrderRepository(client: context.read())),
  Provider(create: (context) => CheckoutRepository(client: context.read())),
  Provider(create: (context) => SizeRepository(client: context.read())),
];
