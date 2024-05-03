// profile - pet_function.dart
import 'package:flutter/material.dart';
import '../../common/assets.dart';

class PetFunction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '实用功能',
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround, // Space the icons evenly
            children: [
              _buildFunctionEntry(
                AssetIcons.logoQuiz, // Icon for pet knowledge quiz
                '宠物知识测试',
                () {
                  // 点击宠物知识测试的事件
                  Navigator.pushNamed(context, '/pet_knowledge_test');
                },
              ),
              _buildFunctionEntry(
                AssetIcons.logoEncyclopedia, // Icon for pet encyclopedia
                '宠物百科',
                () {
                  // 点击宠物百科的事件
                  Navigator.pushNamed(context, '/pet_encyclopedia');
                },
              ),
              _buildFunctionEntry(
                AssetIcons.logoPhoto, // Icon for pet knowledge quiz
                '宠物品种识别',
                () {
                  // 点击宠物品种识别的事件
                  Navigator.pushNamed(context, '/image_recognition');
                },
              ),
              _buildFunctionEntry(
                AssetIcons.logoFriends, // Icon for pet friend application
                '宠物好友申请',
                () {
                  // 点击宠物好友申请的事件
                  Navigator.pushNamed(context, '/pet_friend_application');
                },
              ),
            ],
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }

  Widget _buildFunctionEntry(
      String iconPath, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(12), // Adjust the corner radius as needed
            child: Image.asset(
              iconPath,
              width: 60,
              height: 60,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
