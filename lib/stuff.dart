import 'package:flutter_state_test/global.dart';

class Stuff extends StatelessWidget {
  final String title;
  final bool flag;
  final List<Item> items;
  final TextEditingController controller;
  final Function toggleFlag;
  final Function onGet;
  final Function onAdd;

  const Stuff({
    super.key,
    required this.title,
    required this.flag,
    required this.items,
    required this.controller,
    required this.toggleFlag,
    required this.onGet,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Row(
            children: [
              //MARK: Flag
              IconButton(
                onPressed: () {
                  toggleFlag();
                },
                icon: Icon(
                  flag ? Icons.flag_rounded : Icons.flag_rounded,
                  color: flag ? Colors.red : Colors.grey.withValues(alpha: 0.5),
                ),
              ),
              //MARK: Title
              Expanded(child: Text(title, style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold))),
              //MARK: Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                onPressed: () {
                  onGet();
                },
                child: Text('Get', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 10),
            ],
          ),
          //MARK: List
          Expanded(
            child: ListView.separated(
              physics: AlwaysScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 5);
              },
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Row(
                  children: [
                    Icon(item.completed ? Icons.check_box_rounded : Icons.check_box_outline_blank),
                    const SizedBox(width: 10),
                    Expanded(child: Text(item.title)),
                  ],
                );
              },
            ),
          ),
          //MARK: Text Field
          Row(
            children: [
              Expanded(child: TextField(controller: controller)),
              IconButton(
                onPressed: () {
                  onAdd();
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
