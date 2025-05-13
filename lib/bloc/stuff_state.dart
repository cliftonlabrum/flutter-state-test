part of 'stuff_bloc.dart';

class StuffState {
  final String title;
  final bool flag;
  final List<Item> items;

  StuffState({required this.title, required this.flag, required this.items});

  StuffState copyWith({required String title, required bool flag, required List<Item> items}) {
    return StuffState(title: title, flag: flag, items: items);
  }
}
