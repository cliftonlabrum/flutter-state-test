import 'package:flutter_state_test/shared/global.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stuff_controller.g.dart';

@riverpod
class StuffController extends _$StuffController {
  String title = 'Riverpod';
  List<Item> items = [];

  @override
  FutureOr<List<Item>> build() async {
    return items;
  }

  void getItems() async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 1));
    items.addAll(MakeItems.go());
    title = 'Riverpod (${items.length})';
    state = AsyncValue.data(items);
  }

  void add(String title) {
    final item = Item(id: items.last.id + 1, title: title, completed: false);
    items.add(item);
    title = 'Riverpod (${items.length})';
    state = AsyncValue.data(items);
  }
}
