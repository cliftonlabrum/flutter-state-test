import 'package:flutter_state_test/shared/global.dart';

class WidgetBloc extends StatelessWidget {
  const WidgetBloc({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return BlocProvider(
      create: (context) => StuffBloc(title: 'Bloc', flag: false, items: []),
      child: BlocBuilder<StuffBloc, StuffState>(
        builder: (context, state) {
          // Capture the bloc reference at build time
          final bloc = context.read<StuffBloc>();

          return Stuff(
            title: bloc.title,
            flag: bloc.flag,
            items: bloc.items,
            controller: controller,
            toggleFlag: () {
              bloc.add(StuffEventSetFlag());
            },
            onGet: () {
              bloc.add(StuffEventSetItems());
            },
            onAdd: () {
              //Add Item
              if (controller.text.isEmpty) return;
              bloc.add(StuffEventAddItem(controller.text));
            },
          );
        },
      ),
    );
  }
}
