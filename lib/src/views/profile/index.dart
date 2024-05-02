// profile - index.dart
import 'package:flutter/material.dart';
import './setting.dart';
import './overview.dart';
import './my_baby.dart';
import './pet_function.dart';
import './my_post.dart';

class ProfilePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // 获取状态栏高度
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor:
          Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserProfileOverview(
              avatarUrl: 'http://gallery.pawspulse.top/pawspulse/blue.png',
              nickname: 'Littleight小八',
              hasPassedExam: false,
              userId: '123456',
              region: '上海 杨浦',
              BarHeight: statusBarHeight,
              onSettingsPressed: () {
                print("设置按钮被点击了");
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    spreadRadius: 3, // 阴影的大小
                    blurRadius: 3, // 阴影模糊度的大小，值越大阴影范围也越大，但也更透明
                    offset: Offset(0, -2), // 阴影分别在水平和垂直方向上的偏移量
                  ),
                ],
              ),
              child: Column(
                children: [
                  MyBaby(),
                  PetFunction(),
                ],
              ),
            ),
      
            MyPost(),
          ],
        ),
      ),
      endDrawer: Setting(),
    );
  }
}
