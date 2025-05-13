import 'package:flutter_state_test/shared/global.dart';

class WidgetBloc extends StatelessWidget {
  const WidgetBloc({super.key});

  @override
  Widget build(BuildContext context) {
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
            controller: TextEditingController(text: 'todo'),
            toggleFlag: () {
              bloc.add(StuffEventSetFlag());
            },
            onGet: () {
              bloc.add(StuffEventSetItems());
            },
            onAdd: () {
              //TODO: Get the value from the TextEditingController and add an item to the list
            },
          );
        },
      ),
    );
  }
}
