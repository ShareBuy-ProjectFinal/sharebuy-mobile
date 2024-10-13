abstract class ProductEvent {}

class ProductLoadingEvent extends ProductEvent {
  final String id;
  ProductLoadingEvent({required this.id});
}
