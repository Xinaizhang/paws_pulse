// my_post_help.dart
import 'package:flutter/material.dart';
import '../my_publish/my_post_list.dart';
import '../my_publish/my_help_list.dart';

class MyPostHelp extends StatefulWidget {
  @override
  _MyPostHelpState createState() => _MyPostHelpState();
}

class _MyPostHelpState extends State<MyPostHelp>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initializing the TabController with three tabs
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose the TabController when the state object is removed
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double availableHeight = MediaQuery.of(context).size.height - 330;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
            indicatorColor: Theme.of(context).colorScheme.primary,
            tabs: const [
              Tab(text: '帖子'),
              Tab(text: '互助'),
              Tab(text: '信用及评价'),
            ],
          ),
          // Tab bar view with separate content for each tab
          SizedBox(
            height: availableHeight, // Adjust height according to your layout
            child: TabBarView(
              controller: _tabController,
              children: [
                MyPostList(),
                MyHelpList(),
                _buildCreditAndReviewsTabContent(),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildCreditAndReviewsTabContent() {
    return Center(child: Text("Content for Credit & Reviews Tab"));
  }
}
