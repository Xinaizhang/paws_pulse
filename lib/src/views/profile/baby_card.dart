// profile - baby_card.dart
import 'package:flutter/material.dart';

class BabyCard extends StatelessWidget {
  final String petAvatarUrl;
  final String name;
  final int petType;
  final int gender;
  final String age;
  final String breed;

  const BabyCard({
    super.key,
    required this.petAvatarUrl,
    required this.name,
    required this.petType,
    required this.gender,
    required this.age,
    required this.breed,
  });

  @override
  Widget build(BuildContext context) {
    Color iconColor = gender == 1 ? Colors.blue : Colors.pink;

    return Container(
      height: 160,
      width: 120,
      margin: EdgeInsets.only(right: 18),
      decoration: BoxDecoration(
        color: petType == 0
            ? Theme.of(context).colorScheme.tertiaryContainer
            : Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(90),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
            spreadRadius: 1, // 阴影的大小
            blurRadius: 1, // 阴影模糊度的大小，值越大阴影范围也越大，但也更透明
            offset: Offset(2, 2), // 阴影分别在水平和垂直方向上的偏移量
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 头像
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(petAvatarUrl),
                  radius: 32.0,
                ),
              ],
            ),

            // 宠物信息
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 3),
                    Icon(
                      gender == 1 ? Icons.male_rounded : Icons.female_rounded,
                      color: iconColor,
                      size: 20,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(age),
                SizedBox(height: 8),
                Text(breed),
              ],
            )
          ],
        ),
      ),
    );
  }
}
