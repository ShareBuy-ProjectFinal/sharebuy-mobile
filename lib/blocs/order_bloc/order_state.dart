import 'package:share_buy/models/order/order_model.dart';

class OrderState {
  bool isLoading;
  List<OrderModel> ordersToPay;
  List<OrderModel> ordersPreparing;
  List<OrderModel> ordersToDeliver;
  List<OrderModel> ordersToReceive;
  List<OrderModel> ordersToReturn;
  List<OrderModel> ordersToCancel;

  OrderState(
      {this.ordersToPay = const [],
      this.ordersPreparing = const [],
      this.ordersToDeliver = const [],
      this.ordersToReceive = const [],
      this.ordersToReturn = const [],
      this.ordersToCancel = const [],
      this.isLoading = false});

  OrderState copyWith(
      {List<OrderModel>? ordersToPay,
      List<OrderModel>? ordersPreparing,
      List<OrderModel>? ordersToDeliver,
      List<OrderModel>? ordersToReceive,
      List<OrderModel>? ordersToReturn,
      List<OrderModel>? ordersToCancel,
      bool? isLoading}) {
    return OrderState(
        ordersToPay: ordersToPay ?? this.ordersToPay,
        ordersPreparing: ordersPreparing ?? this.ordersPreparing,
        ordersToDeliver: ordersToDeliver ?? this.ordersToDeliver,
        ordersToReceive: ordersToReceive ?? this.ordersToReceive,
        ordersToReturn: ordersToReturn ?? this.ordersToReturn,
        ordersToCancel: ordersToCancel ?? this.ordersToCancel,
        isLoading: isLoading ?? this.isLoading);
  }
}
