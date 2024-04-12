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
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.1),
            BlendMode.softLight,
          ),
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
          child: Row(
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
                                : Theme.of(context).colorScheme.errorContainer,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            hasPassedExam ? '通过考试' : '未完成考试',
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
        ),
      ]),
    );
  }
}
