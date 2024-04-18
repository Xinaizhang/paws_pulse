// bottomNavigationBar.dart
import 'package:flutter/material.dart';
import '../index.dart';

//底部导航页-切换页面
final pages = [
  CommunityPage(), // 社区页面
  HelpPage(), // 互助页面
  HomePage(), // 首页
  MessagesPage(), // 消息页面
  ProfilePage(), // 个人主页
];


NavigationBar navigationBar(int currentIndex, Function(int) onTap) {
  return NavigationBar(
    selectedIndex: currentIndex,
    onDestinationSelected: onTap,
    destinations: [
      NavigationDestination(
        icon: Icon(Icons.groups_rounded),
        label: '社区',
      ),
      NavigationDestination(
        icon: Icon(Icons.handshake_rounded),
        label: '互助',
      ),
      NavigationDestination(
        icon: Icon(Icons.house_rounded),
        label: '首页',
      ),
      NavigationDestination(
        icon: Icon(Icons.forum_rounded),
        label: '消息',
      ),
      NavigationDestination(
        icon: Icon(Icons.face_rounded),
        label: '我的',
      ),
    ],
  );
}
