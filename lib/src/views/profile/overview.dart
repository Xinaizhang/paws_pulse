import 'package:flutter/material.dart';
import './api.dart';

class UserProfileOverview extends StatefulWidget {
  final double barHeight;
  final VoidCallback onSettingsPressed;

  const UserProfileOverview({
    Key? key,
    required this.barHeight,
    required this.onSettingsPressed,
  }) : super(key: key);

  @override
  _UserProfileOverviewState createState() => _UserProfileOverviewState();
}

class _UserProfileOverviewState extends State<UserProfileOverview>
    with WidgetsBindingObserver {
  int followers = 3;
  int following = 17;
  int posts = 4;
  bool hasPassedExam = true;

  Map<String, dynamic> userData = {
    'id': '',
    'nickname': '',
    'email': '',
    'phone_number': '',
    'created_at': '',
    'avatar': '',
    'address': '',
    'signature': '这个人很懒，什么都没留下',
    'background': 'http://gallery.pawspulse.top/pawspulse/orange.png', // 默认值
  };

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    var response = await getUserById();
    if (response['success']) {
      // var data = response['data'];
      setState(() {
        userData = response['data'];
      });
      print("获取用户信息成功");
      print(userData);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'] ?? '获取用户信息失败')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: EdgeInsets.only(
          left: 24, right: 24, top: widget.barHeight, bottom: 40),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(userData['background']?? 'http://gallery.pawspulse.top/pawspulse/orange.png'),
          fit: BoxFit.cover,
          opacity: 0.4,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.settings_rounded,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              onPressed: widget.onSettingsPressed,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    // 头像
                    CircleAvatar(
                      backgroundImage: NetworkImage(userData['avatar']),
                      radius: 36.0,
                    ),
                    SizedBox(width: 24),
                    // 用户信息
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // 昵称
                              Text(
                                userData['nickname'],
                                style: TextStyle(
                                  fontSize: 22,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'signikaNegative',
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              // 考试状态标记
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 2),
                                decoration: BoxDecoration(
                                  color: hasPassedExam
                                      ? Theme.of(context)
                                          .colorScheme
                                          .tertiaryContainer
                                      : Theme.of(context)
                                          .colorScheme
                                          .errorContainer,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  hasPassedExam ? '已通过考试' : '未完成考试',
                                  style: TextStyle(
                                    color: hasPassedExam
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onTertiaryContainer
                                        : Theme.of(context)
                                            .colorScheme
                                            .onErrorContainer,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          // 用户 ID
                          Text(
                            'ID: ${userData['id']}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          SizedBox(height: 4),
                          // 地区
                          Text(
                            '地区: ${userData['address']}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // 关注、粉丝、发布
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '$following',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Text(
                          '关注',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '$followers',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Text(
                          '粉丝',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '$posts',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Text(
                          '发布',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    // 编辑资料按钮
                    ElevatedButton(
                      onPressed: () async {
                        await Navigator.pushNamed(context, '/profile_modify');
                        _fetchUserData(); // 无论如何在返回时都刷新数据
                      },
                      child: Text('编辑资料'),
                    ),

                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
