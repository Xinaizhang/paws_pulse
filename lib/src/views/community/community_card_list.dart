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
      'title': '寻找爱心家庭：可爱的拉布拉多寻找新家',
      'content':
          '大家好，我是一个志愿者，我们这里有一只3岁的拉布拉多犬“摩卡”需要寻找一个温暖的家。摩卡非常友好，适合所有年龄段的家庭，对小孩特别有耐心。 性别： 男，年龄： 3岁',
      'userAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/cat.jpg',
      'userName': 'Jun',
      'isTest': 1,
      'likeNum': 20,
      'commentNum': 5,
      'tag': '领养',
    },
    {
      'pictureUrl': 'http://gallery.pawspulse.top/pawspulse/labuladuo.jpg',
      'title': 'Pet Help',
      'content': 'Need help with my pet.',
      'userAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/cat.jpg',
      'userName': 'User One',
      'isTest': 0,
      'likeNum': 20,
      'commentNum': 5,
      'tag': '救援',
    },
    {
      'pictureUrl': 'http://gallery.pawspulse.top/pawspulse/labuladuo.jpg',
      'title': 'Pet Help',
      'content': 'Need help with my pet.',
      'userAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/cat.jpg',
      'userName': 'User One',
      'isTest': 1,
      'likeNum': 20,
      'commentNum': 5,
      'tag': '分享',
    },
    {
      'pictureUrl': 'http://gallery.pawspulse.top/pawspulse/labuladuo.jpg',
      'title': 'Pet Help',
      'content': 'Need help with my pet.',
      'userAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/cat.jpg',
      'userName': 'User One',
      'isTest': 1,
      'likeNum': 20,
      'commentNum': 5,
      'tag': '教程',
    },
    // 更多数据...
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mockData.length,
      itemBuilder: (context, index) {
        var data = mockData[index];
        return GestureDetector(
          onTap: () {
            // 点击HelpCard时的操作：导航到详细页面
            Navigator.pushNamed(
              context,
              '/community_detail',
            );
          },
          // 构建每个CommunityCard
          child: CommunityCard(
            pictureUrl: data['pictureUrl'],
            title: data['title'],
            content: data['content'],
            userAvatarUrl: data['userAvatarUrl'],
            userName: data['userName'],
            isTest: data['isTest'],
            likeNum: data['likeNum'],
            commentNum: data['commentNum'],
            tag: data['tag'],
          ),
        );
      },
    );
  }
}
