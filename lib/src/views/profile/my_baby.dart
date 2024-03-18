// my_baby.dart
import 'package:flutter/material.dart';

class MyBaby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 280,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '我的baby',
              style: TextStyle(
                fontSize: 22,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Row(
              children: [
                Container(
                  height: 190,
                  width: 130,
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(right: 18),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(90),
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'http://gallery.pawspulse.top/pawspulse/blue.png'),
                    radius: 30.0,
                  ),
                ),
                Container(
                  height: 190,
                  width: 130,
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(90),
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'http://gallery.pawspulse.top/pawspulse/blue.png'),
                    radius: 30.0,
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
