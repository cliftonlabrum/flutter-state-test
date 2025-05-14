import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_test/riverpod/page_model.dart';
import 'package:flutter_state_test/shared/global.dart';

class StuffModelNotifier extends StateNotifier<RiverpodPageModel> {
  StuffModelNotifier() : super(RiverpodPageModel(title: 'Riverpod noGen', flag: false, items: []));

  void getItems() async {
    final newItems = MakeItems.go();
    final totalItems = [...state.items, ...newItems];
    state = RiverpodPageModel(title: 'Riverpod noGen (${totalItems.length})', flag: state.flag, items: totalItems);
  }

  void toggleFlag() {
    state = RiverpodPageModel(title: state.title, flag: !state.flag, items: state.items);
  }

  void setTitle() {
    state = RiverpodPageModel(title: 'Riverpod noGen (${state.items.length})', flag: state.flag, items: state.items);
  }

  void add(TextEditingController textController) {
    if (textController.text.isEmpty) return;
    final item = Item(
      id: (state.items.isNotEmpty ? state.items.last.id : 0) + 1,
      title: textController.text,
      completed: false,
    );
    textController.clear();
    final totalItems = [...state.items, item];
    state = RiverpodPageModel(title: 'Riverpod noGen (${totalItems.length})', flag: state.flag, items: totalItems);
  }
}

// Creating a provider registered with WidgetRef to be used on the page
// Could also use dependency injection here to reference dependencies like other
// notifiers or services
final stuffModelNotifierProvider = StateNotifierProvider<StuffModelNotifier, RiverpodPageModel>(
  (ref) => StuffModelNotifier(),
);
