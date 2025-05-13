import 'package:flutter_state_management_comparison/global.dart';

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
            onPressed: () {
              bloc.add(StuffEventSetStuff());
            },
          );
        },
      ),
    );
  }
}
