import 'package:flutter/material.dart';
import './navigation_bar.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _bottomNavigationIndex = 4;
  String? userName; // 声明userName变量，用于保存用户ID

  @override
  Widget build(BuildContext context) {
    // 获取路由参数并保存到userName变量中
    final arguments = ModalRoute.of(context)?.settings.arguments
        as Map<String, dynamic>?; // 使用dynamic接收参数
    userName = arguments?["userName"] as String?; // 尝试将参数转换为int类型
    print("userName=$userName");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[_bottomNavigationIndex],
      bottomNavigationBar: navigationBar(_bottomNavigationIndex, (index) {
        setState(() {
          _bottomNavigationIndex = index;
        });
      }),
    );
  }
}
