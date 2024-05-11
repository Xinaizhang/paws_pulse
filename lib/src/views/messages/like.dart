import 'package:flutter/material.dart';

// Like Data Model
class Like {
  final String avatarUrl;
  final String nickname;
  final String post;
  final String createdAt;

  Like({
    required this.avatarUrl,
    required this.nickname,
    required this.post,
    required this.createdAt,
  });
}

// Like Widget
class LikeWidget extends StatelessWidget {
  final Like like;

  const LikeWidget({Key? key, required this.like}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Like Avatar
          CircleAvatar(
            backgroundImage: NetworkImage(like.avatarUrl),
            radius: 24.0,
          ),
          SizedBox(width: 16),
          // Like Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Like Nickname
                Row(
                  children: [
                    Text(
                      like.nickname,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "赞了我的帖子",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                // Like Post
                Row(
                  children: [
                    Text(
                      '| ${like.post}',
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                // Like Creation Time
                Text(
                  like.createdAt,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Likes List
class LikesList extends StatelessWidget {
  final List<Like> likes = [
    Like(
      avatarUrl: 'http://gallery.pawspulse.top/pawspulse/orange.png',
      nickname: '文俊辉',
      post: '小灰灰真可爱',
      createdAt: '2024-05-01',
    ),
    Like(
      avatarUrl: 'http://gallery.pawspulse.top/pawspulse/labuladuo.jpg',
      nickname: '金珉奎',
      post: '小灰灰真可爱',
      createdAt: '2024-05-02',
    ),
    Like(
      avatarUrl: 'http://gallery.pawspulse.top/pawspulse/cat.jpg',
      nickname: '全圆佑',
      post: '小灰灰真可爱',
      createdAt: '2024-05-03',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      child: ListView.builder(
        itemCount: likes.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              LikeWidget(like: likes[index]),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
