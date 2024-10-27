abstract class OrderEvent {}

class EventLoadingOrderTopay extends OrderEvent {}

class EventLoadingOrderPreparing extends OrderEvent {}

class EventLoadingOrderToDelivery extends OrderEvent {}

class EventLoadingOrderToReceive extends OrderEvent {}

class EventLoadingOrderToReturn extends OrderEvent {}

class EventLoadingOrderToCancel extends OrderEvent {}
