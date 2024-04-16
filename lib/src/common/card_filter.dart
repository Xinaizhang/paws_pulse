// card_filter.dart
import 'package:flutter/material.dart';

class CardFilter extends StatefulWidget {
  // 回调函数，用于当筛选选项改变时通知父组件。
  final Function(String) onFilterChange;
  // 标签列表
  final List<String> tags;

  // 构造函数
  CardFilter({required this.onFilterChange, required this.tags});

  @override
  State<CardFilter> createState() => _CardFilterState();
}

class _CardFilterState extends State<CardFilter> {
  // 当前选中的筛选选项，默认为列表的第一个元素。
  String _selectedFilter;

  _CardFilterState() : _selectedFilter = '';

  @override
  void initState() {
    super.initState();
    if (widget.tags.isNotEmpty) {
      _selectedFilter = widget.tags[0]; // 默认选中第一个标签
    }
  }

  // 当筛选选项被选择时调用此函数，更新状态并通知父组件。
  void _handleFilterChange(String filter) {
    setState(() {
      _selectedFilter = filter; // 设置新的选中筛选项
    });
    widget.onFilterChange(filter); // 调用回调函数通知父组件选中项已更改
  }

  @override
  Widget build(BuildContext context) {
    // 构建整个筛选栏的UI布局
    return Container(
      //color: Theme.of(context).colorScheme.background,
      padding: EdgeInsets.only(left: 4),
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:
            widget.tags.map((tag) => _buildFilterButton(context, tag)).toList(),
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context, String tag) {
    // 判断当前按钮是否被选中
    bool isSelected = _selectedFilter == tag;

    // 设置文本样式
    TextStyle textStyle = TextStyle(
      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      color: isSelected
          ? Theme.of(context).colorScheme.onBackground
          : Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
      fontSize: 14,
      height: 1.8,
    );

    return InkWell(
      onTap: () => _handleFilterChange(tag), // 设置点击事件
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 14),
        margin: EdgeInsets.only(bottom: 4),
        child: Stack(
          alignment: Alignment.bottomCenter, // 子组件对齐到底部中心
          children: [
            Text(
              tag,
              style: textStyle,
            ),
            // 使用Positioned包裹下划线，确保它位于文本底部
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Visibility(
                visible: isSelected, // 是否可见
                child: Container(
                  height: 4,
                  color:
                      Theme.of(context).colorScheme.tertiary.withOpacity(0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
