// overview.dart
import 'package:flutter/material.dart';

class UserProfileOverview extends StatelessWidget {
  final String avatarUrl;
  final String nickname;
  final bool hasPassedExam;
  final String userId;
  final String region;
  final double BarHeight;
  final VoidCallback onSettingsPressed;

  const UserProfileOverview({
    Key? key,
    required this.avatarUrl,
    required this.nickname,
    required this.hasPassedExam,
    required this.userId,
    required this.region,
    required this.BarHeight,
    required this.onSettingsPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: EdgeInsets.only(left: 24, right: 24, top: BarHeight, bottom: 40),
      alignment: Alignment.bottomLeft,
      // 设置壁纸样式
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              NetworkImage('http://gallery.pawspulse.top/pawspulse/orange.png'),
          fit: BoxFit.cover,
          opacity: 0.5,
          // 添加颜色滤镜
          // colorFilter: ColorFilter.mode(
          //   Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.1),
          //   BlendMode.softLight,
          // ),
        ),
      ),
      child: Stack(children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(
              Icons.settings_rounded,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            onPressed: onSettingsPressed, // 使用传入的回调
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Row(
              children: [
                // 头像
                CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl),
                  radius: 36.0,
                ),
                SizedBox(width: 24),

                // 简介
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // 昵称
                          Text(
                            nickname,
                            style: TextStyle(
                              fontSize: 22,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'signikaNegative',
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),

                          // 是否完成考试的tag
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            padding: EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2,
                            ),
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

                      // ID
                      Text(
                        'ID: $userId',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      SizedBox(height: 4),

                      // 地区
                      Text(
                        '地区: $region',
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
                      '123',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      '关注',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '22',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      '粉丝',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '13',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      '发布',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                // 编辑资料 按钮
                ElevatedButton(
                  onPressed: () {},
                  // style: ButtonStyle(
                  //   backgroundColor: MaterialStateProperty.all<Color>(
                  //     Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  //   ),
                  //   foregroundColor: MaterialStateProperty.all<Color>(
                  //     Theme.of(context).colorScheme.onPrimary,
                  //   ),
                  //   overlayColor: MaterialStateProperty.all<Color>(
                  //     Theme.of(context).colorScheme.primary,
                  //   ),
                  //   padding: MaterialStateProperty.all<EdgeInsets>(
                  //     EdgeInsets.all(18),
                  //   ),
                  //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //     RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //   ),
                  // ),
                  child: Text('编辑资料'),
                ),
              ],
            ),
          ]),
        )
      ]),
    );
  }
}
