import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/order_repository.dart';
import 'package:store_app/features/orders/manager/order_state.dart';

part 'order_events.dart';

class OrderBloc extends Bloc<OrderEvents, OrderState>{
  final OrderRepository _repo;
  OrderBloc({required OrderRepository repo}): _repo = repo, super(OrderState.initial()){
    on<OrderLoad>(_onLoad);
    add(OrderLoad());
  }

  Future<void> _onLoad(OrderLoad event, Emitter<OrderState> emit)async{
    emit(state.copyWith(status: OrderStatus.loading));
    final orders = await _repo.fetchOrders();
    emit(state.copyWith(orders: orders, status: OrderStatus.success));
  }
}