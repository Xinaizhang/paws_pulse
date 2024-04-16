import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommunityTagFilter extends StatelessWidget {
  final List<String> tags;
  final List<bool> selectedTags;
  final Function(int) onTagSelected;

  CommunityTagFilter({
    required this.tags,
    required this.selectedTags,
    required this.onTagSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Text('筛选tag', style: TextStyle(fontSize: 16)),
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
                      selected: selectedTags[index],
                      onSelected: (selected) => onTagSelected(index),
                      backgroundColor: Theme.of(context).colorScheme.background,
                      selectedColor: Theme.of(context).colorScheme.tertiary,
                      labelStyle: TextStyle(
                        color: selectedTags[index]
                            ? Theme.of(context).colorScheme.onTertiary
                            : Theme.of(context).colorScheme.tertiary,
                      ),
                      showCheckmark: false,
                      avatar: selectedTags[index]
                          ? Icon(Icons.sell_rounded,
                              color: Theme.of(context).colorScheme.onTertiary,
                              size: 16)
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
