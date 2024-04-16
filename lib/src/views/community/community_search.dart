// community - community_search.dart
import 'package:flutter/material.dart';

class CommunitySearch extends StatelessWidget {
  const CommunitySearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: '搜索帖子...',
              prefixIcon: Icon(Icons.search,
                  color: Theme.of(context).colorScheme.primary, size: 30),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.background,
            ),
          ),
        ),
      ),
    );
  }
}
