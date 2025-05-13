import 'package:flutter_state_test/riverpod/page_model.dart';
import 'package:flutter_state_test/shared/global.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stuff_controller.g.dart';

@riverpod
class StuffController extends _$StuffController {
  RiverpodPageModel model = RiverpodPageModel(title: 'Riverpod', flag: false, items: []);
  final textController = TextEditingController();

  @override
  FutureOr<RiverpodPageModel> build() async {
    final test = RiverpodPageModel(title: 'Riverpod', flag: false, items: []);
    return test;
  }

  void getItems() async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 1));
    final newItems = model.items;
    newItems.addAll(MakeItems.go());
    final newModel = RiverpodPageModel(title: 'Riverpod (${newItems.length})', flag: model.flag, items: newItems);

    state = AsyncValue.data(newModel);
  }

  void toggleFlag() {
    final newModel = RiverpodPageModel(title: model.title, flag: !model.flag, items: model.items);
    state = AsyncValue.data(newModel);
  }

  void add() {
    if (textController.text.isEmpty) return;
    final item = Item(
      id: (model.items.isNotEmpty ? model.items.last.id : 0) + 1,
      title: textController.text,
      completed: false,
    );
    final newItems = model.items;
    newItems.insert(0, item);
    final newModel = RiverpodPageModel(title: 'Riverpod (${newItems.length})', flag: model.flag, items: newItems);
    textController.clear();
    state = AsyncValue.data(newModel);
  }
}
