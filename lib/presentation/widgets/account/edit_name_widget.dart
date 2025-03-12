import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditAccountNameDialog extends StatelessWidget {
  const EditAccountNameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller =
        TextEditingController(text: 'Martha Hays');
    return AlertDialog(
      title: Text(
        'Change account name',
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(color: Theme.of(context).colorScheme.outline),
          SizedBox(height: 16.h),
          TextField(
            controller: controller,
            decoration: InputDecoration(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancal',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Edit",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
