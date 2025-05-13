import 'package:flutter_state_test/shared/global.dart';

class ModelStuff with ChangeNotifier {
  //+++
  static ModelStuff get to => di<ModelStuff>();
  //+++

  //MARK: Properties
  //Getters and setters are optional, but they provide a reliable way to ensure the state is updated consistently
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

  final controller = TextEditingController();

  //MARK: Get Items
  get() async {
    //Simulate a network request
    items.addAll(MakeItems.go());

    //Update the item count in the title
    title = 'Watch It (${items.length})';
  }

  //MARK: Add Item
  add() {
    if (controller.text.isEmpty) return;
    final item = Item();
    item.id = 100;
    item.title = controller.text;
    item.completed = true;

    List<Item> ready = List.from(items);
    ready.insert(0, item);
    //:::
    items = ready;
    //Clear textfield
    controller.text = '';
  }
}
