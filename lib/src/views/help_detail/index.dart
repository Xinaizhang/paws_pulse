// help_detail.dart
import 'package:flutter/material.dart';
import './title.dart';
import './owner.dart';

class HelpDetailPage extends StatefulWidget {
  @override
  State<HelpDetailPage> createState() => _HelpDetailPageState();
}

class _HelpDetailPageState extends State<HelpDetailPage> {
  @override
  Widget build(BuildContext context) {
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
    ];
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.ios_share_rounded), onPressed: () {}),
        ],
      ),

      //body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HelpDetailTitle(),
            Divider(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3)),
            HelpDetailOwner(),
            Divider(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3)),
            Text(
              '宠物信息',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              '互助详情',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.secondaryContainer,
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(fontSize: 16, letterSpacing: 2),
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.symmetric(vertical: 20)),
            // 添加的阴影效果
            elevation: MaterialStateProperty.all<double>(4.0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          child: Text('立即沟通'),
        ),
      ),
    );
  }
}
