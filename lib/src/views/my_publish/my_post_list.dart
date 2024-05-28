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
      'userAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/avatar31.jpg',
      'userName': '小八',
      'isTest': 1,
      'likeNum': 20,
      'commentNum': 5,
      'tag': '领养',
    },
    {
      'post_id': 2,
      'pictureUrl': 'http://gallery.pawspulse.top/pawspulse/orange.png',
      'title': '金渐层猫咪的日常养护分享',
      'content': '''
大家好，我是小八，我的金渐层猫咪已经陪伴我有一年了，今天想跟大家分享一些我在养护它方面的经验和心得。

饮食管理：

饮食选择：我给它选择高品质的猫粮，通常选择含肉量高且无谷物配方的猫粮。此外，我也会定期给它吃一些湿粮和罐头，以增加饮食的多样性和水分摄入。
喂食频率：我每天喂食两次，早晚各一次，避免过量喂食造成的肥胖问题。

''',
      'userAvatarUrl': 'http://gallery.pawspulse.top/pawspulse/avatar31.jpg',
      'userName': '小八',
      'isTest': 0,
      'likeNum': 11,
      'commentNum': 3,
      'tag': '分享',
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
          content: Text('删除后数据无法恢复，确定要删除此帖子吗？'),
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
