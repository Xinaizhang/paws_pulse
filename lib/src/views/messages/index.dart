import 'package:flutter/material.dart';
import './comment.dart';
import './like.dart';
import './notification.dart';

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title:
              const Text('消息中心', style: TextStyle(fontWeight: FontWeight.w800)),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.reply),
                text: '回复我的',
              ),
              Tab(
                icon: Icon(Icons.thumb_up),
                text: '收到的赞',
              ),
              Tab(
                icon: Icon(Icons.notifications),
                text: '系统通知',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CommentsList(),
            LikesList(),
            NotificationsList(),
          ],
        ),
      ),
    );
  }
}
