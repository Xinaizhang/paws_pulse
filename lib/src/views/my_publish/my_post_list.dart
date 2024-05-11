// my_publish - my_post_list.dart
import 'package:flutter/material.dart';
import '../community/community_card.dart';
import './left_slide_actions.dart';

typedef _BaseFunction<T> = void Function(T o);

class MyPostList extends StatefulWidget {
  @override
  State<MyPostList> createState() => _MyPostListState();
}

class _MyPostListState extends State<MyPostList> {
  final List<Map<String, dynamic>> mockData = [
    {
      'post_id': 1,
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
      'post_id': 2,
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
    // 其他数据...
  ];

  final Map<int, VoidCallback> _mapForHideActions = {};

  void _removePost(int index) {
    setState(() {
      mockData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mockData.length,
      itemBuilder: (BuildContext context, int index) {
        final data = mockData[index];
        return LeftSlideActions(
          key: Key(data['post_id'].toString()),
          actionsWidth: 70,
          actions: [
            _buildDeleteBtn(context, index),
            SizedBox(width: 16),
          ],
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
          actionsWillShow: () {
            for (int i = 0; i < mockData.length; i++) {
              if (index == i) continue;
              final tempKey = mockData[i]['post_id'];
              final hideActions = _mapForHideActions[tempKey];
              hideActions?.call();
            }
          },
          exportHideActions: (hideActions) {
            _mapForHideActions[data['post_id']] = hideActions;
          },
        );
      },
    );
  }

  Widget _buildDeleteBtn(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => _showDeleteConfirmationDialog(context, index),
      child: Container(
        width: 60,
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('确认删除？'),
          content: Text('确定要删除此帖子吗？'),
          actions: [
            TextButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('确认'),
              onPressed: () {
                _removePost(index);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("帖子已删除")),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
