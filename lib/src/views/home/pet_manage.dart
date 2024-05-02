import 'package:flutter/material.dart';

class PetManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildGridItem(
                '今日体重',
                '5.1 kg',
                flex: 1,
                color: Theme.of(context).colorScheme.secondaryContainer,
                onTap: () {
                  print('今日体重 tapped');
                },
              ),
              _buildGridItem(
                '今日已喂食物',
                '0g',
                flex: 1,
                color: Theme.of(context).colorScheme.secondaryContainer,
                onTap: () {
                  print('今日已喂食物 tapped');
                },
              ),
              _buildGridItem(
                '宠物健康状态',
                '健康',
                flex: 1,
                color: Theme.of(context).colorScheme.tertiaryContainer,
                onTap: () {
                  print('宠物健康状态 tapped');
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildGridItem(
                '饲养日记',
                '',
                flex: 2,
                color: Theme.of(context).colorScheme.tertiaryContainer,
                onTap: () {
                  print('饲养日记 tapped');
                },
              ),
              _buildGridItem(
                '金渐层',
                '',
                flex: 1,
                color: Theme.of(context).colorScheme.secondaryContainer,
                onTap: () {
                  print('金渐层 tapped');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(
    String title,
    String subtitle, {
    required int flex,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(12),
          height: 135,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              if (subtitle.isNotEmpty) ...[
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
