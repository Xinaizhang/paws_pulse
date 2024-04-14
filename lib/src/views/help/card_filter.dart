// card_filter.dart
import 'package:flutter/material.dart';

class CardFilter extends StatefulWidget {
  // 回调函数，用于当筛选选项改变时通知父组件。
  final Function(int) onFilterChange;

  // 构造函数
  CardFilter({required this.onFilterChange});

  @override
  State<CardFilter> createState() => _CardFilterState();
}

class _CardFilterState extends State<CardFilter> {
  // 当前选中的筛选选项的索引，默认为 1-推荐。
  int _selectedFilter = 1;

  // 当筛选选项被选择时调用此函数，更新状态并通知父组件。
  void _handleFilterChange(int filter) {
    setState(() {
      _selectedFilter = filter; // 设置新的选中筛选项
    });
    widget.onFilterChange(filter); // 调用回调函数通知父组件选中项已更改
  }

  @override
  Widget build(BuildContext context) {
    // 构建整个筛选栏的UI布局
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: EdgeInsets.only(left: 12),
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildFilterButton(context, '推荐', 1),
          _buildFilterButton(context, '附近', 2),
          _buildFilterButton(context, '最新', 3),
        ],
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context, String text, int filter) {
    // 判断当前按钮是否被选中
    bool isSelected = _selectedFilter == filter;

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
      onTap: () => _handleFilterChange(filter), // 设置点击事件
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 14),
        margin: EdgeInsets.only(bottom: 4),
        child: Stack(
          alignment: Alignment.bottomCenter, // 子组件对齐到底部中心
          children: [
            Text(
              text,
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
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
