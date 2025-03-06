import 'package:flutter/material.dart';

class DeleteTaskWidget extends StatelessWidget {
  const DeleteTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Divider(),
          Text('data'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            'cancel',
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            'delete',
          ),
        ),
      ],
    );
  }
}
