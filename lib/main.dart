import 'package:flutter/rendering.dart';
import 'package:flutter_state_management_comparison/global.dart';

void main() {
  //Register watch_it model
  di.registerSingleton<ModelStuff>(ModelStuff());

  runApp(const MyApp());
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
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        //MARK: Bloc Widget
                        WidgetBloc(),
                        SizedBox(height: 20),
                        //MARK: Riverpod Widget
                        WidgetRiverpod(),
                        SizedBox(height: 20),
                        //MARK: Watch It Widget
                        WidgetWatchIt(),
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
