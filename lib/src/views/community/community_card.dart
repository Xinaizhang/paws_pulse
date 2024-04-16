// community community_card.dart
import 'package:flutter/material.dart';

class CommunityCard extends StatelessWidget {
  final String pictureUrl;
  final String title;
  final String content;
  final String userAvatarUrl;
  final String userName;
  final int isTest;
  final int likeNum;
  final int commentNum;

  const CommunityCard({
    required this.pictureUrl,
    required this.title,
    required this.content,
    required this.userAvatarUrl,
    required this.userName,
    required this.isTest,
    required this.likeNum,
    required this.commentNum,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(userAvatarUrl, width: 50, height: 50),
        title: Text(title),
        subtitle: Text(content),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.thumb_up, size: 20),
            Text('$likeNum likes'),
          ],
        ),
        onTap: () {
          // Implement navigation logic or interaction
        },
      ),
    );
  }
}
