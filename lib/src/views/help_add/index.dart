// help_add - index.dart
import 'package:flutter/material.dart';
import '../../common/alert_dialog.dart';

class AddHelpPage extends StatefulWidget {
  @override
  State<AddHelpPage> createState() => _AddHelpPageState();
}

class _AddHelpPageState extends State<AddHelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("发布互助", style: TextStyle(fontWeight: FontWeight.w800)),
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
