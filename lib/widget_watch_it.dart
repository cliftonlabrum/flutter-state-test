import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import 'stuff.dart';
import 'watch_it/model_stuff.dart';

class WidgetWatchIt extends StatelessWidget with WatchItMixin {
  const WidgetWatchIt({super.key});

  @override
  Widget build(BuildContext context) {
    //+++
    //Accessed directly below so reactive variables stand out with syntax highlighting [A]
    watchPropertyValue((ModelStuff model) => model.title);
    watchPropertyValue((ModelStuff model) => model.flag);
    //Can also access with an `items` variable [B]
    final items = watchPropertyValue((ModelStuff model) => model.items);
    //+++
    return Stuff(
      title: ModelStuff.to.title, // [A]
      flag: ModelStuff.to.flag, // [A]
      items: items, // [B]
      controller: ModelStuff.to.controller,
      toggleFlag: () {
        ModelStuff.to.flag = !ModelStuff.to.flag;
      },
      onGet: () {
        ModelStuff.to.get();
      },
      onAdd: () {
        ModelStuff.to.add();
      },
    );
  }
}
