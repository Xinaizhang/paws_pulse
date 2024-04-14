// owner.dart
import 'package:flutter/material.dart';

class HelpDetailOwner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage:
                NetworkImage('http://gallery.pawspulse.top/pawspulse/cat.jpg'),
            radius: 25.0,
          ),
          SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'userName',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 4),
              Text(
                '发布于 publishTime',
                style: TextStyle(
                    color:
                        Theme.of(context).colorScheme.tertiary.withOpacity(0.6),
                    fontSize: 14),
              )
            ],
          ),
        ],
      ),
    );
  }
}
