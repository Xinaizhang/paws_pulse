import 'package:flutter/material.dart';
import 'community_filter.dart';
import 'community_card_list.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  List<String> selectedFilters = []; // 处理多个标签
  String selectedOption = '默认';

  void _handleFilterChange(List<String> tags, String option) {
    setState(() {
      selectedFilters = tags;
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.3),
      appBar: AppBar(
        title:
            const Text('宠物社区', style: TextStyle(fontWeight: FontWeight.w800)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        actions: [
          IconButton(
            icon: Icon(Icons.person_pin_rounded),
            onPressed: () => Navigator.pushNamed(context, '/my_publish'),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/add_community'),
          ),
        ],
      ),
      body: Column(
        children: [
          CommunityFilter(onFilterSelected: _handleFilterChange),
          Expanded(child: CommunityList(selectedTags: selectedFilters)),
        ],
      ),
    );
  }
}
