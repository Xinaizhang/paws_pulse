import 'package:flutter/material.dart';

class AddTag extends StatelessWidget {
  final List<String> tags;
  final List<int> selectedTagIndexes;
  final Function(int) onTagSelected;

  AddTag({
    required this.tags,
    required this.selectedTagIndexes,
    required this.onTagSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '选择tag:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(tags.length, (int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(tags[index]),
                    selected: selectedTagIndexes.contains(index),
                    onSelected: (selected) {
                      if (selected) {
                        onTagSelected(index);
                      } else {
                        // 如果取消选择已选中的标签，则默认选择第一个标签
                        if (selectedTagIndexes.contains(index)) {
                          onTagSelected(0);
                        }
                      }
                    },
                    backgroundColor: Theme.of(context).colorScheme.background,
                    selectedColor: Theme.of(context).colorScheme.tertiary,
                    labelStyle: TextStyle(
                      color: selectedTagIndexes.contains(index)
                          ? Theme.of(context).colorScheme.onTertiary
                          : Theme.of(context).colorScheme.tertiary,
                    ),
                    showCheckmark: false,
                    avatar: selectedTagIndexes.contains(index)
                        ? Icon(Icons.sell_rounded,
                            color: Theme.of(context).colorScheme.onTertiary,
                            size: 16)
                        : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    visualDensity: VisualDensity.compact, // 减小 avatar 的边距
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
