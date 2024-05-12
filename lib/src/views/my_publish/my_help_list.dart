// card_list.dart
import 'package:flutter/material.dart';
import '../help/help_card.dart';
import './left_slide_actions.dart';

class MyHelpList extends StatefulWidget {
  MyHelpList({
    super.key,
  });

  @override
  State<MyHelpList> createState() => _MyHelpListState();
}

class _MyHelpListState extends State<MyHelpList> {
  // 此处模拟数据，实际应用中应从数据库或网络获取
  List<Map<String, dynamic>> mockData = [
    {
      'help_id': 1,
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
      'help_id': 2,
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
      'help_id': 3,
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
      'help_id': 4,
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

  final Map<int, VoidCallback> _mapForHideActions = {};

  void _removeHelp(int index) {
    setState(() {
      mockData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // 使用ListView.builder创建列表视图
    return ListView.builder(
      itemCount: mockData.length, // 列表项的数量
      itemBuilder: (context, index) {
        // 获取单个数据项
        var data = mockData[index];
        return LeftSlideActions(
          key: Key(data['help_id'].toString()), // 使用一个唯一标识符作为Key
          actionsWidth: 70,
          actions: [
            _buildDeleteBtn(context, index),
            SizedBox(width: 16),
          ],
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
          actionsWillShow: () {
            for (int i = 0; i < mockData.length; i++) {
              if (index == i) continue;
              final tempKey = mockData[i]['help_id'];
              final hideActions = _mapForHideActions[tempKey];
              hideActions?.call();
            }
          },
          exportHideActions: (hideActions) {
            _mapForHideActions[data['help_id']] = hideActions;
          },
        );
      },
    );
  }

  Widget _buildDeleteBtn(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => _showDeleteConfirmationDialog(context, index),
      child: Container(
        width: 60,
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('确认删除？'),
          content: Text('删除后数据无法恢复，确定要删除这项互助吗？'),
          actions: [
            TextButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('确认'),
              onPressed: () {
                _removeHelp(index);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("互助已删除")),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
