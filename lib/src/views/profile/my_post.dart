// profile - my_post.dart
import 'package:flutter/material.dart';
import '../../common/index.dart';

class MyPost extends StatefulWidget {
  @override
  _MyPostState createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  // Function to handle filter changes
  void _handleOptionChange(String selectedOption) {
    // Handle the filter change here, e.g., update the state, make an API call, etc.
    print('Selected option: $selectedOption');
  }

  @override
  Widget build(BuildContext context) {
    // Define the options for the CardFilter
    final List<String> options = ['帖子', '互助', '信用及评价'];

    return Column(
      children: [
        SizedBox(height: 6),
        CardFilter(
          onFilterChange: _handleOptionChange,
          tags: options,
        ),
        // Add additional widgets below if needed
      ],
    );
  }
}
