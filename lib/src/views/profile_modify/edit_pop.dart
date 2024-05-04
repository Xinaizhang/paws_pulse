// profile_modify - edit_pop.dart
import 'package:flutter/material.dart';

class EditableField extends StatefulWidget {
  final String label;
  final String initialValue;
  final Function(String) onSave;

  const EditableField({
    Key? key,
    required this.label,
    required this.initialValue,
    required this.onSave,
  }) : super(key: key);

  @override
  _EditableFieldState createState() => _EditableFieldState();
}

class _EditableFieldState extends State<EditableField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showEditDialog();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.label,
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          Row(
            children: [
              Text(widget.initialValue),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('编辑${widget.label}'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: '输入新的${widget.label}',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('取消'),
            ),
            TextButton(
              onPressed: () {
                String newValue = _controller.text;
                widget.onSave(newValue);
                Navigator.pop(context);
              },
              child: Text('保存'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
