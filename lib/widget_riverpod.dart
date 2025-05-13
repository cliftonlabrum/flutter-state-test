import 'package:flutter/material.dart';
import './stuff.dart';

class WidgetRiverpod extends StatelessWidget {
  const WidgetRiverpod({super.key});

  @override
  Widget build(BuildContext context) {
    return Stuff(
      title: 'Riverpod',
      flag: true,
      items: [],
      controller: TextEditingController(text: 'todo'),
      toggleFlag: () {},
      onGet: () {},
      onAdd: () {},
    );
  }
}
