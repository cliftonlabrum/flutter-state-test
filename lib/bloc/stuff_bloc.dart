import 'package:flutter_state_management_comparison/global.dart';

part 'stuff_event.dart';
part 'stuff_state.dart';

class StuffBloc extends Bloc<StuffEvent, StuffState> {
  String title;
  bool flag;
  List<Item> items;

  StuffBloc({this.title = 'Bloc', this.flag = false, this.items = const []})
    : super(StuffState(title: title, flag: flag, items: items)) {
    on<StuffEventSetStuff>(_onSetStuff);
  }

  void _onSetStuff(StuffEventSetStuff event, Emitter<StuffState> emit) {
    //Simulate a network request that gets some data
    items.addAll(MakeItems.go());

    flag = !flag;

    title = 'Bloc (${items.length})';

    emit(state.copyWith(title: title, flag: flag, items: items));
  }
}
