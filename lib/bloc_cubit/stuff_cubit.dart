import 'package:flutter_state_test/shared/global.dart';

class StuffCubit extends Cubit<StuffState2> {
  StuffCubit() : super(StuffState2(title: 'Cubit', flag: false, items: []));

  void setTitle(String title) {
    emit(state.copyWith(title: title));
  }

  void toggleFlag() {
    emit(state.copyWith(flag: !state.flag));
  }

  void setItems() {
    state.items.addAll(MakeItems.go());
    emit(state.copyWith(items: state.items));
  }

  void addItem(String text) {
    final item = Item(id: 1239, title: text, completed: false);
    state.items.insert(0, item);
    emit(state.copyWith(items: state.items));
  }
}
