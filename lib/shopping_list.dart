import 'package:flutter/material.dart';

class ShoppingList extends StatelessWidget {
  final List<String> itemList;
  final Function(int) onItemDelete;

  const ShoppingList({
    Key? key,
    required this.itemList,
    required this.onItemDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showDeleteItemDialog(int index) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('削除確認'),
            content: const Text('このアイテムを削除しますか？'),
            actions: [
              TextButton(
                child: const Text('キャンセル'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('削除'),
                onPressed: () {
                  onItemDelete(index);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    return Flexible(
      child: Container(
        color: const Color.fromARGB(255, 232, 225, 208),
        child: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(itemList[index]),
                trailing: IconButton(
                  onPressed: () {
                    _showDeleteItemDialog(index);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
