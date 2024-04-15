// profile - my_baby.dart
import 'package:flutter/material.dart';
import './baby_card.dart';

class MyBaby extends StatelessWidget {

  final List<Map<String, dynamic>> mockData = [
    {
      'petAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/blue.png',
      'name': '小灰灰',
      'petType': 0, // 0-猫，1-狗
      'gender': 1, // 0-女，1-男
      'age': '1岁3个月',
      'breed': '蓝猫',
    },
    {
      'petAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/labuladuo.jpg',
      'name': '大黄黄',
      'petType': 1, // 0-猫，1-狗
      'gender': 0, // 0-女，1-男
      'age': '1岁3个月',
      'breed': '拉布拉多',
    },
    {
      'petAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/orange.png',
      'name': '小黄黄',
      'petType': 0, // 0-猫，1-狗
      'gender': 0, // 0-女，1-男
      'age': '5个月',
      'breed': '金渐层',
    },
    // ... 添加更多宠物数据
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      height: 250,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '我的baby',
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width, // 设置最小宽度为屏幕宽度
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: mockData.map((data) {
                      return BabyCard(
                        petAvatarUrl: data['petAvatarUrl'],
                        name: data['name'],
                        petType: data['petType'],
                        gender: data['gender'],
                        age: data['age'],
                        breed: data['breed'],
                      );
                    }).toList(),
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
