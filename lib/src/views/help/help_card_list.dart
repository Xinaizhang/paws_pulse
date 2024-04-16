// card_list.dart
import 'package:flutter/material.dart';
import './help_card.dart';

class CardList extends StatelessWidget {
  final int tabIndex; // 当前选中的tab索引
  final String filterOption; // 当前选中的筛选选项

  CardList({
    super.key,
    required this.tabIndex,
    required this.filterOption,
  });

  @override
  Widget build(BuildContext context) {
    // 此处模拟数据，实际应用中应从数据库或网络获取
    List<Map<String, dynamic>> mockData = [
      {
        'petAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/labuladuo.jpg',
        'title': '2岁金毛帮遛',
        'address': '上海 杨浦',
        'cost': '45元/次',
        'userAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/cat.jpg',
        'userName': 'Jun',
        'publishTime': '2024-04-14 10:00',
        'orderStatus': 1,
      },
      {
        'petAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/labuladuo.jpg',
        'title': '2岁金毛帮遛',
        'address': '上海 杨浦',
        'cost': '45元/次',
        'userAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/cat.jpg',
        'userName': 'Jun',
        'publishTime': '2024-04-14 10:00',
        'orderStatus': 1,
      },
      {
        'petAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/labuladuo.jpg',
        'title': '2岁金毛帮遛',
        'address': '上海 杨浦',
        'cost': '45元/次',
        'userAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/cat.jpg',
        'userName': 'Jun',
        'publishTime': '2024-04-14 10:00',
        'orderStatus': 1,
      },
      {
        'petAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/labuladuo.jpg',
        'title': '2岁金毛帮遛',
        'address': '上海 杨浦',
        'cost': '45元/次',
        'userAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/cat.jpg',
        'userName': 'Jun',
        'publishTime': '2024-04-14 10:00',
        'orderStatus': 1,
      },
      {
        'petAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/labuladuo.jpg',
        'title': '2岁金毛帮遛',
        'address': '上海 杨浦',
        'cost': '45元/次',
        'userAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/cat.jpg',
        'userName': 'Jun',
        'publishTime': '2024-04-14 10:00',
        'orderStatus': 1,
      },
      {
        'petAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/labuladuo.jpg',
        'title': '2岁金毛帮遛',
        'address': '上海 杨浦',
        'cost': '45元/次',
        'userAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/cat.jpg',
        'userName': 'Jun',
        'publishTime': '2024-04-14 10:00',
        'orderStatus': 1,
      },
      // 更多数据...
    ];

    // 使用ListView.builder创建列表视图
    return ListView.builder(
      itemCount: mockData.length, // 列表项的数量
      itemBuilder: (context, index) {
        // 获取单个数据项
        var data = mockData[index];
        return GestureDetector(
          onTap: () {
            // 点击HelpCard时的操作：导航到详细页面
            Navigator.pushNamed(
              context,
              '/help_detail',
            );
          },
          // 构建每个HelpCard
          child: HelpCard(
            petAvatarUrl: data['petAvatarUrl'],
            title: data['title'],
            address: data['address'],
            cost: data['cost'],
            userAvatarUrl: data['userAvatarUrl'],
            userName: data['userName'],
            publishTime: data['publishTime'],
            orderStatus: data['orderStatus'],
          ),
        );
      },
    );
  }
}
