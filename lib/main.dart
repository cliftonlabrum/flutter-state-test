import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_test/shared/global.dart';
import 'package:flutter_state_test/widget_cubit.dart';
import 'package:flutter_state_test/widget_hooks.dart';
import 'package:flutter_state_test/widget_riverpod_nogen.dart';

void main() {
  //Register watch_it model
  di.registerSingleton<ModelStuff>(ModelStuff());

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management',

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('State Management', style: TextStyle(color: Colors.white)),
        ),
        body: SafeArea(
          child: SizedBox.expand(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //MARK: Bloc Widget
                        WidgetBloc(),
                        SizedBox(height: 20),
                        //MARK: Cubit (Bloc) Widget
                        WidgetCubit(),
                        SizedBox(height: 20),
                        //MARK: Riverpod Widget
                        WidgetRiverpod(),
                        SizedBox(height: 20),
                        //MARK: Watch It Widget
                        WidgetWatchIt(),
                        SizedBox(height: 20),
                        //MARK: Hooks Widget
                        WidgetHooks(),
                        SizedBox(height: 20),
                        //MARK: Riverpod No Generation Widget
                        WidgetRiverpodNoGen(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
