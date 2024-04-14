// title.dart
import 'package:flutter/material.dart';

class HelpDetailTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '2岁半金毛帮遛',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
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
                    'address',
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
            '45元/次',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.tertiary),
          ),
        ],
      ),
    );
  }
}
