// community_list.dart
import 'package:flutter/material.dart';
import 'community_card.dart';

class CommunityList extends StatelessWidget {
  final List<String> selectedTags; // 接收标签列表

  CommunityList({required this.selectedTags});

  // 假设数据依赖于selectedTag，这里简化处理
  final List<Map<String, dynamic>> mockData = [
    {
      'pictureUrl': 'http://gallery.pawspulse.top/pawspulse/labuladuo.jpg',
      'title': 'Pet Help',
      'content': 'Need help with my pet.',
      'userAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/cat.jpg',
      'userName': 'User One',
      'isTest': 1,
      'likeNum': 20,
      'commentNum': 5,
    },
    // 更多数据...
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mockData.length,
      itemBuilder: (context, index) {
        var data = mockData[index];
        return CommunityCard(
          pictureUrl: data['pictureUrl'],
          title: data['title'],
          content: data['content'],
          userAvatarUrl: data['userAvatarUrl'],
          userName: data['userName'],
          isTest: data['isTest'],
          likeNum: data['likeNum'],
          commentNum: data['commentNum'],
        );
      },
    );
  }
}
