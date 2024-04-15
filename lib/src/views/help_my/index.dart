// help_my - index.dart
import 'package:flutter/material.dart';
import '../../common/alert_dialog.dart';

class MyHelpPage extends StatefulWidget {
  @override
  State<MyHelpPage> createState() => _MyHelpPageState();
}

class _MyHelpPageState extends State<MyHelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的互助", style: TextStyle(fontWeight: FontWeight.w800)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.emoji_objects),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomAlertDialog(
                    title: '互助示例模板',
                    buttonText: '一键填入模板',
                  ),
                );
              }),
        ],
      ),
    );
  }
}
