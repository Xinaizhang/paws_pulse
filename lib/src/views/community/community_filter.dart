// community - community_filter.dart
import 'package:flutter/material.dart';
import '../../common/index.dart';
import './community_tag.dart';
import './community_search.dart';

class CommunityFilter extends StatefulWidget {
  final Function(List<String>, String) onFilterSelected;

  CommunityFilter({required this.onFilterSelected});
  @override
  State<CommunityFilter> createState() => _CommunityFilterState();
}

class _CommunityFilterState extends State<CommunityFilter> {
  final List<String> tags = [
    '领养',
    '救援',
    '分享',
    '教程',
  ];
  final List<String> options = ['默认', '最新', '最热'];
  late List<bool> selectedTags; // 修改此处
  String selectedOption = '默认';

  @override
  void initState() {
    super.initState();
    selectedOption = options[0];
    selectedTags = List.filled(tags.length, true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateSelectedFilters();
    });
  }

  void _handleTagChange(int index) {
    setState(() {
      selectedTags[index] = !selectedTags[index];
    });
    _updateSelectedFilters();
  }

  void _handleOptionChange(String newOption) {
    setState(() {
      selectedOption = newOption;
    });
    _updateSelectedFilters();
  }

  void _updateSelectedFilters() {
    // 使用 asMap() 和 entries 来遍历列表，并包含索引
    List<String> selectedTagsList = tags
        .asMap()
        .entries
        .where((entry) => selectedTags[entry.key]) // entry.key 是索引
        .map((entry) => entry.value) // entry.value 是相应的标签
        .toList();

    widget.onFilterSelected(selectedTagsList, selectedOption);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 搜索框 - 暂时不用管
        CommunitySearch(),
        SizedBox(height: 8),

        // 筛选框1
        CommunityTagFilter(
          tags: tags,
          selectedTags: selectedTags,
          onTagSelected: _handleTagChange,
        ),

        // 筛选框2 - 默认、最新、最热
        CardFilter(
          onFilterChange: _handleOptionChange,
          tags: options,
        ),
      ],
    );
  }
}
