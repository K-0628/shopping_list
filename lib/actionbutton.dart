import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Function(String) onAddItem;

  const ActionButton({
    Key? key,
    required this.onAddItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (() {
        String message = '';
        FocusNode textFieldFocus = FocusNode();
        TextEditingController textController = TextEditingController();

        showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (BuildContext context, setState) {
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
              },
            );
          },
        );

        // ダイアログが表示された後、キーボードを表示する
        FocusScope.of(context).requestFocus(textFieldFocus);
      }),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
