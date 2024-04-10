import 'package:flutter/material.dart';

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // 控制滑动方向，.horizontal水平滑动(默认)，.vertical垂直滑动
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        // 添加你的页面视图
        Container(
          color: Colors.red,
          child: Center(
              child: Text('页面 1',
                  style: TextStyle(fontSize: 32, color: Colors.white))),
        ),
        Container(
          color: Colors.blue,
          child: Center(
              child: Text('页面 2',
                  style: TextStyle(fontSize: 32, color: Colors.white))),
        ),
        Container(
          color: Colors.green,
          child: Center(
              child: Text('页面 3',
                  style: TextStyle(fontSize: 32, color: Colors.white))),
        ),
      ],
    );
  }
}
