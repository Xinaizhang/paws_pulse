import 'package:flutter/material.dart';

class Comment {
  final String avatarUrl;
  final String nickname;
  final String content;
  final String post;
  final String createdAt;

  Comment({
    required this.avatarUrl,
    required this.nickname,
    required this.content,
    required this.post,
    required this.createdAt,
  });
}

class CommentWidget extends StatelessWidget {
  final Comment comment;

  const CommentWidget({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Comment Avatar
              CircleAvatar(
                backgroundImage: NetworkImage(comment.avatarUrl),
                radius: 24.0,
              ),
              SizedBox(width: 16),
              // Comment Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Comment Nickname
                    Row(
                      children: [
                        Text(
                          comment.nickname,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "回复了我",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    // Comment Content
                    Row(
                      children: [
                        Text(
                          '@Littleight :',
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.blue[400]),
                        ),
                        SizedBox(width: 8),
                        Text(
                          comment.content,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    // Comment Post
                    Row(
                      children: [
                        Text(
                          '| ${comment.post}',
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    // Comment Creation Time
                    Text(
                      comment.createdAt,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CommentsList extends StatelessWidget {
  final List<Comment> comments = [
    Comment(
      avatarUrl: 'http://gallery.pawspulse.top/pawspulse/orange.png',
      nickname: '文俊辉',
      content: '我的宠物天下第一可爱',
      post: '小灰灰真可爱',
      createdAt: '2024-05-01',
    ),
    Comment(
      avatarUrl: 'http://gallery.pawspulse.top/pawspulse/labuladuo.jpg',
      nickname: '金珉奎',
      content: '我也这么觉得。',
      post: '小灰灰真可爱',
      createdAt: '2024-05-02',
    ),
    Comment(
      avatarUrl: 'http://gallery.pawspulse.top/pawspulse/cat.jpg',
      nickname: '全圆佑',
      content: '那必须的',
      post: '小灰灰真可爱',
      createdAt: '2024-05-03',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      child: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CommentWidget(comment: comments[index]),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
