import 'package:flutter/material.dart';

class CategoryMenu extends StatelessWidget {
  final List<IconItem> iconItemList;
  final IconItem? selectedIconItem;
  final Function(IconItem?) onIconItemSelected;

  const CategoryMenu({
    Key? key,
    required this.iconItemList,
    required this.selectedIconItem,
    required this.onIconItemSelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          for (var iconItem in iconItemList)
            IconButton(
              onPressed: () {
                onIconItemSelected(iconItem);
              },
              icon: Icon(
                iconItem.iconData,
                color:
                    iconItem == selectedIconItem ? Colors.white : Colors.grey,
              ),
            ),
        ],
      ),
    );
  }
}

class IconItem {
  final String name;
  final IconData iconData;
  final List<String> itemList;

  IconItem(
      {required this.name, required this.iconData, required this.itemList});
}
