import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_buy/blocs/order_bloc/order_event.dart';
import 'package:share_buy/blocs/order_bloc/order_state.dart';
import 'package:share_buy/models/order/order_model.dart';
import 'package:share_buy/repositories/order_repository.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderState()) {
    on<EventLoadingOrderTopay>(_loadingOrderToPay);
    on<EventLoadingOrderPreparing>(_loadingOrdePreparing);
    on<EventLoadingOrderToDelivery>(_loadingOrderToDilevery);
    on<EventLoadingOrderToReceive>(_loadingOrderToReceive);
    on<EventLoadingOrderToReturn>(_loadingOrderToReturn);
    on<EventLoadingOrderToCancel>(_loadingOrderToCancel);
  }

  Future<void> _loadingOrderToPay(OrderEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      List<OrderModel> ordersToPay = await OrderRepository().getOrdersToPay();
      emit(state.copyWith(
        isLoading: false,
        ordersToPay: ordersToPay,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _loadingOrdePreparing(OrderEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      List<OrderModel> ordersPreparing =
          await OrderRepository().getOrdersPreparing();
      emit(state.copyWith(
        isLoading: false,
        ordersPreparing: ordersPreparing,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _loadingOrderToDilevery(OrderEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      List<OrderModel> ordersToDeliver =
          await OrderRepository().getOrdersToDelivery();
      emit(state.copyWith(
        isLoading: false,
        ordersToDeliver: ordersToDeliver,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _loadingOrderToReceive(OrderEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      List<OrderModel> ordersToReceive =
          await OrderRepository().getOrdersCompleted();
      emit(state.copyWith(
        isLoading: false,
        ordersToReceive: ordersToReceive,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _loadingOrderToReturn(OrderEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      List<OrderModel> ordersToReturn =
          await OrderRepository().getOrdersReturn();
      emit(state.copyWith(
        isLoading: false,
        ordersToReturn: ordersToReturn,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _loadingOrderToCancel(OrderEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      List<OrderModel> ordersToCancel =
          await OrderRepository().getOrdersCanceled();
      emit(state.copyWith(
        isLoading: false,
        ordersToCancel: ordersToCancel,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
