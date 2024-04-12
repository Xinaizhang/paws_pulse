import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 定义选中时的标签样式
    final TextStyle selectedTabStyle = TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    // 定义未选中时的标签样式
    final TextStyle unselectedTabStyle = TextStyle(
      fontSize: 18,
      color: Colors.black54,
    );

    // TabBar的背景色
    final Color tabBarBackgroundColor = Colors.white;

    return DefaultTabController(
      length: 3, // 你有三个 tab
      child: Scaffold(
        appBar: AppBar(
          title:
              const Text('互助', style: TextStyle(fontWeight: FontWeight.w800)),
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(35.0), // 高度需要手动设置
            child: Container(
              color: tabBarBackgroundColor,
              child: TabBar(
                isScrollable: true, // 设为可滚动
                labelPadding: EdgeInsets.symmetric(
                    horizontal: 15.0), // 两侧的padding可以根据需求调整
                labelStyle: selectedTabStyle,
                unselectedLabelStyle: unselectedTabStyle,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), // 圆角度可以根据需求调整
                  color: Theme.of(context)
                      .colorScheme
                      .tertiaryContainer, // 指示器颜色也可以根据需求调整
                ),
                tabs: [
                  Tab(text: '帮遛'),
                  Tab(text: '寄养'),
                  Tab(text: '相亲'),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabBarView(
            children: [
              // 对应 “帮遛” tab 的内容
              Column(
                children: [
                  // 互助帖卡片
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://gallery.pawspulse.top/pawspulse/labuladuo.jpg'),
                            ),
                            title: Text('2岁金毛寻找搭档'),
                            subtitle: Text('上海 杨浦'),
                            trailing: Chip(
                              label: Text('45元/次'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Chip(
                                avatar: Icon(Icons.pets),
                                label: Text('Jun'),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('申请接单'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ... 其他卡片组件
                ],
              ),

              // 对应 “寄养” tab 的内容
              Center(child: Text('寄养内容')),
              // 对应 “相亲” tab 的内容
              Center(child: Text('相亲内容')),
            ],
          ),
        ),
      ),
    );
  }
}
