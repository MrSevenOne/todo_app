import 'package:flutter/material.dart';
import 'package:todo_app/presentation/widgets/task/category_widget.dart';

class EditTaskDialog extends StatefulWidget {
  @override
  _EditTaskDialogState createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  TextEditingController taskController =
      TextEditingController(text: "Do math homework");
  TextEditingController descriptionController =
      TextEditingController(text: "Do chapter 2 to 5 for next week");

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text("Edit Task title", style: TextStyle(color: Colors.white)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Do math homework", style: TextStyle(color: Colors.white)),
          SizedBox(height: 10),
          TextField(
            controller: descriptionController,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              )),
        ),
        ElevatedButton(
          // Save edited task
          onPressed: (){
            Navigator.pop(context);
            showCategoryDialog(context);
          },

          child: Text(
            "Edit",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
