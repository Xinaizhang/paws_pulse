// help.dart
import 'package:flutter/material.dart';
import '../../common/card_filter.dart';
import 'help_card_list.dart';

class HelpPage extends StatefulWidget {
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final List<String> options = ['推荐', '附近', '最新'];
  String selectedOption = '推荐';

  void _handleOptionChange(String newOption) {
    setState(() {
      selectedOption = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 定义选中时的标签样式
    final TextStyle selectedTabStyle = TextStyle(
      fontSize: 22,
      color: Theme.of(context).colorScheme.onBackground,
      fontWeight: FontWeight.bold,
    );
    // 定义未选中时的标签样式
    final TextStyle unselectedTabStyle = TextStyle(
      fontSize: 18,
      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
      fontWeight: FontWeight.bold,
    );

    return DefaultTabController(
      length: 3, // 有3个tab
      child: Scaffold(
        backgroundColor:
            Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.3),

        // appBar
        appBar: AppBar(
          title:
              const Text('互助中心', style: TextStyle(fontWeight: FontWeight.w800)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          actions: [
            IconButton(
                icon: Icon(Icons.person_pin_rounded),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/my_help',
                  );
                }),
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/add_help',
                  );
                })
          ],
        ),

        // body
        body: Column(
            children: [
              // TabBar1
              Container(
              padding: EdgeInsets.only(right: 200, top: 4),
                color: Theme.of(context).colorScheme.background,
                child: TabBar(
                  labelStyle: selectedTabStyle,
                  unselectedLabelStyle: unselectedTabStyle,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 18.0,
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                    ),
                    insets: EdgeInsets.only(bottom: 6),
                  ),
                  tabs: [
                    Tab(text: '帮遛'),
                    Tab(text: '寄养'),
                    Tab(text: '相亲'),
                  ],
                ),
              ),
          
              // 筛选框，推荐 附近 最新
              CardFilter(
                onFilterChange: _handleOptionChange,
                tags: options,
              ),

              // TabBarView部分
              Expanded(
                child: TabBarView(
                  children: [
                    // 使用新的CardList组件替代原来直接调用HelpCard的代码
                    CardList(tabIndex: 0, filterOption: selectedOption),
                    CardList(tabIndex: 1, filterOption: selectedOption),
                    CardList(tabIndex: 2, filterOption: selectedOption),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
