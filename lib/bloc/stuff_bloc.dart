import 'package:flutter_state_test/shared/global.dart';

part 'stuff_event.dart';
part 'stuff_state.dart';

class StuffBloc extends Bloc<StuffEvent, StuffState> {
  String title;
  bool flag;
  List<Item> items;
  final String addItem;

  StuffBloc({this.title = 'Bloc', this.flag = false, this.items = const [], this.addItem = ''})
    : super(StuffState(title: title, flag: flag, items: items, addItem: addItem)) {
    on<StuffEventSetTitle>(_onSetStuffTitle);
    on<StuffEventSetFlag>(_onSetStuffFlag);
    on<StuffEventSetItems>(_onSetStuffItems);
    on<StuffEventAddItem>(_onSetStuffAddItem);
  }

  void _onSetStuffTitle(StuffEventSetTitle event, Emitter<StuffState> emit) {
    title = 'Bloc (${items.length})';
    emit(state.copyWith(title: title, flag: flag, items: items, addItem: addItem));
  }

  void _onSetStuffFlag(StuffEventSetFlag event, Emitter<StuffState> emit) {
    flag = !flag;
    emit(state.copyWith(title: title, flag: flag, items: items, addItem: addItem));
  }

  void _onSetStuffItems(StuffEventSetItems event, Emitter<StuffState> emit) {
    //Simulate a network request that gets some data
    items.addAll(MakeItems.go());
    //Update the item count in the title
    title = 'Bloc (${items.length})';

    emit(state.copyWith(title: title, flag: flag, items: items, addItem: addItem));
  }

  void _onSetStuffAddItem(StuffEventAddItem event, Emitter<StuffState> emit) {
    final item = Item();
    item.id = 100;
    item.title = event.addItem;
    item.completed = true;
    //:::
    items.insert(0, item);

    //Update state
    emit(state.copyWith(title: title, flag: flag, items: items, addItem: addItem));
  }
}
