// app.dart
import 'package:flutter/material.dart';
import 'common/common.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PawsPulse',
      theme: AppTheme.light, // 定义在common/common.dart中
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomNavigationIndex = 2; //底部导航的索引
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_bottomNavigationIndex], //页面切换
        bottomNavigationBar: _bottomNavigationBar() //底部导航
        );
  }

  //底部导航-样式
  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      items: items(), //底部导航-图标和文字的定义，封装到函数里
      currentIndex: _bottomNavigationIndex,
      onTap: (flag) {
        setState(() {
          _bottomNavigationIndex = flag; //使用底部导航索引
        });
      }, //onTap 点击切换页面
      type: BottomNavigationBarType.fixed, //样式：选中图标后的样式是固定的
    );
  }
}
