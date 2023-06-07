import 'package:flutter/material.dart';

class AddItemDialog extends StatelessWidget {
  final Function(String) onAddItem;

  const AddItemDialog({
    Key? key,
    required this.onAddItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    return StatefulBuilder(builder: (BuildContext context, setState) {
      return AlertDialog(
        title: const Text('リスト追加'),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: 'メモ'),
        ),
        actions: [
          TextButton(
            child: const Text('キャンセル'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              setState(() {
                String item = textController.text.trim();
                if (item.isNotEmpty) {
                  onAddItem(item);
                }
                textController.clear();
                Navigator.pop(context);
              });
            },
          ),
        ],
      );
    });
  }
}
