part of 'stuff_bloc.dart';

class StuffState {
  final String title;
  final bool flag;
  final List<Item> items;
  final String addItem;

  StuffState({required this.title, required this.flag, required this.items, required this.addItem});

  StuffState copyWith({required String title, required bool flag, required List<Item> items, required String addItem}) {
    return StuffState(title: title, flag: flag, items: items, addItem: addItem);
  }
}
