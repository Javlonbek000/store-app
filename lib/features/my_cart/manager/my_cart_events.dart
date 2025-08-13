part of 'my_cart_bloc.dart';

sealed class MyCartEvents {}

final class MyCartLoad extends MyCartEvents {}

final class MyCartDelete extends MyCartEvents {
  final int id;

  MyCartDelete({required this.id});
}
