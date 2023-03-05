
import 'package:flutter/material.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: RichTextScreen());
  }
}
class RichTextScreen extends StatefulWidget {
  @override
  State<RichTextScreen> createState() => _RichTextScreenState();
}
class _RichTextScreenState extends State<RichTextScreen> {

  List<String> listData = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ReorderableGridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.5, // child aspect ratio specifies the width/height of grid
          children: [
            for (int i = 0; i < listData.length; i++)
              Container(
                margin: EdgeInsets.all(5),
                key: ValueKey(listData[i]),
                color: Colors.blue.shade900,
                alignment: Alignment.center,
                child: Text(
                  listData[i],
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              )
          ],
          onReorder: (oldIndex, newIndex) {
            setState(() {
              var val = listData.removeAt(oldIndex);
              listData.insert(newIndex, val);
            });
          },
        ));
  }
}