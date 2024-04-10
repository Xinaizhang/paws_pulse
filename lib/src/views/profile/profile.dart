// profile.dart
import 'package:flutter/material.dart';
import './setting.dart';
import './overview.dart';
import './my_baby.dart';

class ProfilePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width, // 设置宽度匹配屏幕
          height: 1000,
          child: Stack(
            children: [
              UserProfileOverview(
                avatarUrl: 'http://gallery.pawspulse.top/pawspulse/blue.png',
                nickname: 'Littleight小八',
                hasPassedExam: false,
                userId: '123456',
                region: '上海 杨浦',
                onSettingsPressed: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
              ),
              Positioned(
                top: 260,
                left: 0,
                right: 0,
                child: Container(
                  height: 700,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        spreadRadius: 3, // 阴影的大小
                        blurRadius: 3, // 阴影模糊度的大小，值越大阴影范围也越大，但也更透明
                        offset: Offset(0, -3), // 阴影分别在水平和垂直方向上的偏移量
                      ),
                    ],
                  ),
                  child: MyBaby(),
                ),
              ),
            ],
          ),
        ),
      ),
      
      endDrawer: Setting(),
    );
  }
}
