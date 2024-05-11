// my_publish - index.dart
import 'package:flutter/material.dart';
import './my_post_list.dart';

class MyPublishPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'new_post') {
                  Navigator.pushNamed(context, '/add_community');
                } else if (value == 'new_help') {
                  Navigator.pushNamed(context, '/add_help');
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'new_post',
                    child: Row(
                      children: [
                        SizedBox(width: 6),
                        Icon(Icons.post_add),
                        SizedBox(width: 8),
                        Text('发布新的帖子'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'new_help',
                    child: Row(
                      children: [
                        SizedBox(width: 6),
                        Icon(Icons.add_business),
                        SizedBox(width: 8),
                        Text('发布新的互助'),
                      ],
                    ),
                  ),
                ];
              },
              icon: Icon(Icons.add),
              offset: Offset(0, 40),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.diversity_3),
                text: '我的帖子',
              ),
              Tab(
                icon: Icon(Icons.volunteer_activism),
                text: '我的互助',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyPostList(),
            Text('我的互助'),
          ],
        ),
      ),
    );
  }
}
