import 'package:flutter/material.dart';
import 'dart:ui'; // 导入dart:ui库以使用ImageFilter

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback? onPressed; // 可选的函数参数

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.buttonText,
    this.onPressed, // 初始化时接收可选参数
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent, // 使Dialog背景透明
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0), // 设置弹窗圆角
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // 应用毛玻璃效果
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color:
                  Theme.of(context).colorScheme.secondaryContainer, // 半透明白色背景
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // 使容器包裹内容
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: onPressed ??
                      () => Navigator.of(context).pop(), // 使用提供的onPressed或默认操作
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
