import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_state_test/riverpod/stuff_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import './stuff.dart';

class WidgetRiverpod extends HookConsumerWidget {
  const WidgetRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(stuffControllerProvider);
    final controllerNotifier = ref.watch(stuffControllerProvider.notifier);
    final flag = useState(false);
    final textController = useTextEditingController();

    return Stack(
      alignment: Alignment.center,
      children: [
        Stuff(
          title: controllerNotifier.title,
          flag: flag.value,
          items: controller.value ?? [],
          controller: textController,
          toggleFlag: () {
            flag.value = !flag.value;
          },
          onGet: () => controllerNotifier.getItems(),
          onAdd: () {
            controllerNotifier.add(textController.text);
            textController.clear();
          },
        ),
        Visibility(visible: controller.isLoading, child: Center(child: const CircularProgressIndicator())),
      ],
    );
  }
}
