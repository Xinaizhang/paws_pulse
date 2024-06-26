// home - page_view.dart
import 'package:flutter/material.dart';
import '../../common/pet_id_card.dart';

class PetIDCard extends StatefulWidget {
  @override
  State<PetIDCard> createState() => _PetIDCardState();
}

class _PetIDCardState extends State<PetIDCard> {
  final List<Map<String, dynamic>> mockData = [
    {
      'name': '大黄黄',
      'petAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/labuladuo.jpg',
      'petType': 1, // 0-猫，1-狗
      'gender': 0, // 0-女，1-男
      'breed': '拉布拉多',
      'birthDate': '2020-05-01',
      'age': '3年',
      'address': '上海市浦东新区',
      'petId': '123456202005011234',
      'isQr': true,
    },
    {
      'name': '小灰灰',
      'petAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/blue.png',
      'gender': 1, // 0-女，1-男
      'petType': 0, // 0-猫，1-狗
      'breed': '英短',
      'birthDate': '2020-05-01',
      'age': '3年',
      'address': '上海市浦东新区',
      'petId': '123456202005011234',
      'isQr': true,
    },
    {
      'name': '小黄黄',
      'petAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/orange.png',
      'gender': 0, // 0-女，1-男
      'petType': 0, // 0-猫，1-狗
      'breed': '金渐层',
      'birthDate': '2020-05-01',
      'age': '3年',
      'address': '上海市浦东新区',
      'petId': '123456202005011234',
      'isQr': true,
    },
  ];

  // 创建PageController实例
  final PageController pageController = PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 320,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 点击时向左翻页
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 17,
                  color: currentPageIndex > 0
                      ? Theme.of(context).colorScheme.onBackground
                      : Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.3),
                ),
                onPressed: currentPageIndex > 0
                    ? () {
                        pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    : null,
              ),
              Text(
                '宠物身份证',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              // 点击时向右翻页
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 17,
                  color: currentPageIndex < mockData.length - 1
                      ? Theme.of(context).colorScheme.onBackground
                      : Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.3),
                ),
                onPressed: currentPageIndex < mockData.length - 1
                    ? () {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    : null,
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: pageController, // 应用PageController
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index; // 更新当前页码
                });
              },
              children: mockData.map((data) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: PetIdCard(
                    name: data['name']!,
                    petAvatarUrl: data['petAvatarUrl'],
                    gender: data['gender']!,
                    petType: data['petType']!,
                    breed: data['breed']!,
                    birthDate: data['birthDate']!,
                    age: data['age']!,
                    address: data['address']!,
                    petId: data['petId']!,
                    isQr: data['isQr']!,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
  
  @override
  void dispose() {
    // 销毁PageController
    pageController.dispose();
    super.dispose();
  }
}
