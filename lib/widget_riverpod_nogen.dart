import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_state_test/riverpod_no_generation/stuff_model_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import './stuff.dart';

class WidgetRiverpodNoGen extends HookConsumerWidget {
  const WidgetRiverpodNoGen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageModel = ref.watch(stuffModelNotifierProvider);
    final pageModelNotifier = ref.watch(stuffModelNotifierProvider.notifier);
    final controller = useTextEditingController();

    return Stuff(
      title: pageModel.title,
      flag: pageModel.flag,
      items: pageModel.items,
      controller: controller,
      toggleFlag: () => pageModelNotifier.toggleFlag(),
      onGet: () => pageModelNotifier.getItems(),
      onAdd: () => pageModelNotifier.add(controller),
    );
  }
}
