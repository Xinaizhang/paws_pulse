// overview.dart
import 'package:flutter/material.dart';

class UserProfileOverview extends StatelessWidget {
  final String avatarUrl;
  final String nickname;
  final bool hasPassedExam;
  final String userId;
  final String region;
  final VoidCallback onSettingsPressed;

  const UserProfileOverview({
    Key? key,
    required this.avatarUrl,
    required this.nickname,
    required this.hasPassedExam,
    required this.userId,
    required this.region,
    required this.onSettingsPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 40),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              NetworkImage('http://gallery.pawspulse.top/pawspulse/orange.png'),
          fit: BoxFit.cover,
          opacity: 0.4,
          // 添加颜色滤镜
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.4),
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
              CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
                radius: 36.0,
              ),
              SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                    Text(
                      'ID: $userId',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    SizedBox(height: 4),
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
