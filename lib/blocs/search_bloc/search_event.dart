abstract class SearchEvent {}

class EventSearchProduct extends SearchEvent {
  String keyword;
  EventSearchProduct({required this.keyword});
}

class EventLoadData extends SearchEvent {
  int offset;
  String keyword;
  EventLoadData({required this.offset, required this.keyword});
}
