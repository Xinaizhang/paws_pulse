// community_add - index.dart
import 'package:flutter/material.dart';
import '../../common/alert_dialog.dart';

class AddCommunityPage extends StatefulWidget {
  @override
  State<AddCommunityPage> createState() => _AddCommunityPageState();
}

class _AddCommunityPageState extends State<AddCommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("发布帖子", style: TextStyle(fontWeight: FontWeight.w800)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.emoji_objects),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomAlertDialog(
                    title: '发帖小贴士',
                    buttonText: '我知道啦',
                  ),
                );
              }),
        ],
      ),
    );
  }
}
