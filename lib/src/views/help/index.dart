// help.dart
import 'package:flutter/material.dart';
import './card_filter.dart';
import './card_list.dart';

class HelpPage extends StatefulWidget {
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  // CardFilter返回值，1-推荐 2-附近 3-最新，默认为1
  int filterOption = 1;

  void updateFilter(int newFilter) {
    setState(() {
      filterOption = newFilter;
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
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          actions: [
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
        body: Container(
          child: Column(
            children: [
              // TabBar1
              Container(
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
          
              // 筛选框，1-推荐 2-附近 3-最新
              CardFilter(onFilterChange: updateFilter),

              // TabBarView部分
              Expanded(
                child: TabBarView(
                  children: [
                    // 使用新的CardList组件替代原来直接调用HelpCard的代码
                    CardList(tabIndex: 0, filterOption: filterOption),
                    CardList(tabIndex: 1, filterOption: filterOption),
                    CardList(tabIndex: 2, filterOption: filterOption),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
