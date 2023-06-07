import 'package:flutter/material.dart';
import 'categorymenu.dart';
import 'shoppinglist.dart';
import 'actionbutton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<IconItem> iconItemList = [
    IconItem(name: 'Favorite', iconData: Icons.favorite, itemList: []),
    IconItem(name: 'Auto Awesome', iconData: Icons.auto_awesome, itemList: []),
    IconItem(name: 'Checkroom', iconData: Icons.checkroom, itemList: []),
    IconItem(name: 'Restaurant', iconData: Icons.restaurant, itemList: []),
    IconItem(name: 'Home', iconData: Icons.home, itemList: []),
    IconItem(name: 'Power', iconData: Icons.power, itemList: []),
    IconItem(name: 'Pets', iconData: Icons.pets, itemList: []),
    IconItem(name: 'Music Note', iconData: Icons.music_note, itemList: []),
    IconItem(
        name: 'Import Contacts', iconData: Icons.import_contacts, itemList: []),
    IconItem(name: 'Local Mall', iconData: Icons.local_mall, itemList: []),
  ];

  IconItem? selectedIconItem;

  void _onIconItemSelected(IconItem? iconItem) {
    setState(() {
      selectedIconItem = iconItem;
    });
  }

  void _addItem(String item) {
    setState(() {
      selectedIconItem!.itemList.add(item);
    });
  }

  void _deleteItem(int index) {
    setState(() {
      selectedIconItem!.itemList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("買い物リスト"),
      ),
      body: Row(
        children: [
          CategoryMenu(
            iconItemList: iconItemList,
            selectedIconItem: selectedIconItem,
            onIconItemSelected: _onIconItemSelected,
          ),
          ShoppingList(
            itemList: selectedIconItem?.itemList ?? [],
            onItemDelete: _deleteItem,
          ),
        ],
      ),
      floatingActionButton: ActionButton(
        onAddItem: _addItem,
      ),
    );
  }
}
