import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import './stuff.dart';
import './watch_it/model_stuff.dart';

class WidgetWatchIt extends StatelessWidget with WatchItMixin {
  const WidgetWatchIt({super.key});

  @override
  Widget build(BuildContext context) {
    //+++
    final title = watchPropertyValue((ModelStuff model) => model.title);
    final flag = watchPropertyValue((ModelStuff model) => model.flag);
    final items = watchPropertyValue((ModelStuff model) => model.items);
    //+++
    return Stuff(
      title: title,
      flag: flag,
      items: items,
      onPressed: () {
        print('bro?');
        ModelStuff.to.changeStuff();
      },
    );
  }
}
