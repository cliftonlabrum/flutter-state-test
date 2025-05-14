import 'package:flutter_state_test/shared/global.dart';

class WidgetCubit extends StatelessWidget {
  const WidgetCubit({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return BlocProvider(
      create: (context) => StuffCubit(),
      child: BlocBuilder<StuffCubit, StuffState2>(
        builder: (context, state) {
          // Capture the bloc reference at build time
          final cubit = context.read<StuffCubit>();

          return Stuff(
            title: state.title,
            flag: state.flag,
            items: state.items,
            controller: controller,
            toggleFlag: () {
              cubit.toggleFlag();
            },
            onGet: () {
              cubit.setItems();
            },
            onAdd: () {
              //Add Item
              if (controller.text.isEmpty) return;
              cubit.addItem(controller.text);
            },
          );
        },
      ),
    );
  }
}
