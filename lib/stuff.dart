import 'package:flutter_state_management_comparison/global.dart';

class Stuff extends StatelessWidget {
  final String title;
  final bool flag;
  final List<Item> items;
  final Function onPressed;

  const Stuff({super.key, required this.title, required this.flag, required this.items, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            //MARK: Flag
            Icon(flag ? Icons.flag_rounded : Icons.flag_rounded, color: flag ? Colors.red : Colors.grey.withValues(alpha: 0.5)),
            //MARK: Title
            Expanded(child: Text(title, style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold))),
            //MARK: Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: () {
                onPressed();
              },
              child: Text('Change', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        //MARK: List
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
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
      ],
    );
  }
}
