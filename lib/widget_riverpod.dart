import 'package:flutter/material.dart';
import 'package:flutter_state_test/riverpod/stuff_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import './stuff.dart';

class WidgetRiverpod extends ConsumerWidget {
  const WidgetRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(stuffControllerProvider);
    final controllerNotifier = ref.watch(stuffControllerProvider.notifier);

    return Stack(
      alignment: Alignment.center,
      children: [
        controller.when(
          data:
              (data) => Stuff(
                title: data.title,
                flag: data.flag,
                items: data.items,
                controller: controllerNotifier.textController,
                toggleFlag: () {
                  controllerNotifier.toggleFlag();
                },
                onGet: () => controllerNotifier.getItems(),
                onAdd: () => controllerNotifier.add(),
              ),
          error: (error, stack) => const Text('Error'),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}
