// help_card.dart
import 'package:flutter/material.dart';

class HelpCard extends StatelessWidget {
  final String petAvatarUrl;
  final String title;
  final String address;
  final String cost;
  final String userAvatarUrl;
  final String userName;
  final String publishTime;
  final int orderStatus; // 订单状态（1-待接取 2-进行中 3-已完成）

  // 构造函数
  const HelpCard({
    super.key,
    required this.petAvatarUrl,
    required this.title,
    required this.address,
    required this.cost,
    required this.userAvatarUrl,
    required this.userName,
    required this.publishTime,
    required this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    // 订单状态映射到相应的文本
    final Map<int, String> statusText = {
      1: '待接取',
      2: '进行中',
      3: '已完成',
    };

    return Stack(
        clipBehavior: Clip.none, // 允许溢出的部分显示
        children: [
          Container(
            margin: EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.background,
              boxShadow: [
                BoxShadow(
                  color:
                      Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
                  spreadRadius: 1, // 阴影的大小
                  blurRadius: 1, // 阴影模糊度的大小，值越大阴影范围也越大，但也更透明
                  offset: Offset(2, 2), // 阴影分别在水平和垂直方向上的偏移量
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  //订单信息
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              //为头像预留出空间
                              SizedBox(width: 70),
                              Text(
                                title,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),

                          // 地址、工作时间
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on_rounded,
                                  size: 17,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiary
                                      .withOpacity(0.7)),
                              SizedBox(width: 8),
                              Text(
                                address,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary
                                        .withOpacity(0.7)),
                              ),
                              SizedBox(width: 28),
                              Icon(Icons.work_rounded,
                                  size: 17,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiary
                                      .withOpacity(0.7)),
                              SizedBox(width: 8),
                              Text(
                                '4天/周 2个月',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary
                                        .withOpacity(0.7)),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // 费用金额
                      Text(
                        cost,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // 发布人信息、发布时间、状态栏
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(userAvatarUrl),
                            radius: 20.0,
                          ),
                          SizedBox(width: 8),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userName,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w800),
                              ),
                              Text(
                                '发布于 $publishTime',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant
                                        .withOpacity(0.8),
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      ),

                      // 订单状态栏
                      ElevatedButton(
                        child: Text(
                          statusText[orderStatus] ?? '...',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10.0, // 使头像的上半部分在Container的边界之外
            left: 32.0, // 根据需要调整位置
            child: Material(
              elevation: 8.0, // 控制阴影的高度
              shape: CircleBorder(), // 指定形状为圆形
              child: CircleAvatar(
                backgroundImage: NetworkImage(petAvatarUrl),
                radius: 30.0, // 头像的大小
              ),
            ),
          ),
        ]);
  }
}
