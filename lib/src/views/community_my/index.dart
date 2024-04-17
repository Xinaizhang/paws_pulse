// community_my - index.dart
import 'package:flutter/material.dart';
import '../../common/alert_dialog.dart';

class MyCommunityPage extends StatefulWidget {
  @override
  State<MyCommunityPage> createState() => _MyCommunityPageState();
}

class _MyCommunityPageState extends State<MyCommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的帖子", style: TextStyle(fontWeight: FontWeight.w800)),
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
