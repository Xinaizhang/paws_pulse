// bottomNavigationBar.dart
import 'package:flutter/material.dart';
import '../views/views.dart';

//底部导航页-切换页面
final pages = [
  CommunityPage(), // 社区页面
  MessagesPage(), // 消息页面
  HomePage(), // 首页
  WalkPage(), // 帮遛页面
  ProfilePage(), // 个人主页
];


NavigationBar navigationBar(int currentIndex, Function(int) onTap) {
  return NavigationBar(
    selectedIndex: currentIndex,
    onDestinationSelected: onTap,
    destinations: [
      NavigationDestination(
        icon: Icon(Icons.commute_outlined),
        label: '社区',
      ),
      NavigationDestination(
        icon: Icon(Icons.message_outlined),
        label: '消息',
      ),
      NavigationDestination(
        icon: Icon(Icons.home_outlined),
        label: '首页',
      ),
      NavigationDestination(
        icon: Icon(Icons.help_outline),
        label: '帮遛',
      ),
      NavigationDestination(
        icon: Icon(Icons.person_outlined),
        label: '我的',
      ),
    ],
  );
}
