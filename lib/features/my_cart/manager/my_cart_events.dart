part of'my_cart_bloc.dart';

sealed class MyCartEvents{}

final class MyCartLoad extends MyCartEvents{}

final class DeleteCart extends MyCartEvents{
  final int id;

  DeleteCart({required this.id});
}