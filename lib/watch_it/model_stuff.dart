import 'package:flutter_state_management_comparison/global.dart';

class ModelStuff with ChangeNotifier {
  //+++
  static ModelStuff get to => di<ModelStuff>();
  //+++

  //MARK: Properties
  //Getters and setters are optional, but they provide a reliable way to ensure the state is altered and updated consistently
  String _title = 'Watch It';
  String get title => _title;
  set title(String value) {
    _title = value;
    notifyListeners();
  }

  bool _flag = false;
  bool get flag => _flag;
  set flag(bool value) {
    _flag = value;
    notifyListeners();
  }

  List<Item> _items = [];
  List<Item> get items => _items;
  set items(List<Item> values) {
    _items = values;
    notifyListeners();
  }

  //MARK: Make Changes
  changeStuff() async {
    //Simulate a network request
    items.addAll(MakeItems.go());

    //Manually change other stuff
    title = 'Watch It (${items.length})';
    flag = !flag;
  }
}
