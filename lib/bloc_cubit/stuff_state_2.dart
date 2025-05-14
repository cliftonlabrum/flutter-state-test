import 'package:flutter_state_test/shared/global.dart';

class StuffState2 {
  final String title;
  final bool flag;
  final List<Item> items;

  StuffState2({required this.title, required this.flag, required this.items});

  StuffState2 copyWith({String? title, bool? flag, List<Item>? items, String? addItem}) {
    return StuffState2(title: title ?? this.title, flag: flag ?? this.flag, items: items ?? this.items);
  }
}
