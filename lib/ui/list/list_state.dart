import '../../models/list_response.dart';

class ListState {

  final List<ListResponse> list;
  ListState({this.list = const []});

  ListState copyWith({List<ListResponse>? list}) {
    return ListState(
      list: list ?? this.list,
    );
  }

  ListState init() {
    return ListState();
  }

  ListState clone() {
    return ListState();
  }
}
