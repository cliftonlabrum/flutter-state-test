import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_state_test/shared/global.dart';

class WidgetHooks extends HookWidget {
  const WidgetHooks({super.key});

  @override
  Widget build(BuildContext context) {
    final flag = useState(false);
    final textController = useTextEditingController();
    final items = useState<List<Item>>([]);
    final loading = useState(false);
    final title = useState('Hooks');

    return Stack(
      alignment: Alignment.center,
      children: [
        Stuff(
          title: title.value,
          flag: flag.value,
          items: items.value,
          controller: textController,
          toggleFlag: () {
            flag.value = !flag.value;
          },
          onGet: () {
            loading.value = true;
            Future.delayed(const Duration(seconds: 1), () {
              items.value.addAll(MakeItems.go());
              title.value = 'Hooks (${items.value.length})';
              loading.value = false;
            });
          },
          onAdd: () {
            if (textController.text.isEmpty) return;
            final item = Item(
              id: (items.value.isNotEmpty ? items.value.last.id : 0) + 1,
              title: textController.text,
              completed: false,
            );
            items.value.insert(0, item);
            title.value = 'Hooks (${items.value.length})';
            textController.clear();
          },
        ),
        Visibility(visible: loading.value, child: Center(child: const CircularProgressIndicator())),
      ],
    );
  }
}
