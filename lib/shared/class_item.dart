import 'package:flutter_state_test/shared/global.dart';

class Item {
  int id = 0;
  String title = '';
  bool completed = false;
  Item({required this.id, required this.title, required this.completed});

  @override
  toString() {
    return 'id: $id, title: $title, completed: $completed';
  }
}

class MakeItems {
  static List<Item> go() {
    //Simulate a network request
    List<dynamic> jsonData = jsonDecode(data);

    List<Item> items = [];
    for (var data in jsonData) {
      final item = Item(id: data['id'], title: data['title'], completed: data['completed']);
      items.add(item);
    }
    //:::
    return items;
  }

  static const data = '''[
  {
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  },
  {
    "id": 2,
    "title": "quis ut nam facilis et officia qui",
    "completed": true
  },
  {
    "id": 3,
    "title": "fugiat veniam minus",
    "completed": false
  },
  {
    "id": 4,
    "title": "et porro tempora",
    "completed": true
  },
  {
    "id": 5,
    "title": "laboriosam mollitia et enim quasi adipisci quia provident illum",
    "completed": false
  }
]''';
}
