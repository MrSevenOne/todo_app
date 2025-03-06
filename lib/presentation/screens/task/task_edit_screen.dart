import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/config/constants.dart';
import 'package:todo_app/presentation/widgets/task/task_info_widget.dart';

import '../../widgets/task/edit_task_widget.dart';

class TaskEditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // Klaviatura ochilganda UI o'zgarishiga yordam beradi
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.ios_share_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(deffaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.circle_outlined,
                  color: Colors.white,
                  size: 20.sp,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Do Math Homework",
                    style: theme.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: () => showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => EditTaskDialog(),
                  ),
                  icon: Icon(
                    Icons.edit,
                    color: theme.colorScheme.onPrimary,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              "Do chapter 2 to 5 for next week",
              style: TextStyle(
                color: theme.colorScheme.outline,
              ),
            ),
            SizedBox(height: 20.h),
            TaskInfoRow(
                icon: Icons.access_time,
                label: "Task Time :",
                value: "Today At 16:45"),
            TaskInfoRow(
                icon: Icons.location_on,
                label: "Task Category :",
                value: "University",
                isCategory: true),
            TaskInfoRow(
                icon: Icons.flag, label: "Task Priority :", value: "Default"),
            TaskInfoRow(
                icon: Icons.device_hub,
                label: "Sub - Task",
                value: "Add Sub - Task"),
            SizedBox(height: 20),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.delete, color: theme.colorScheme.error),
              label: Text("Delete Task",
                  style: TextStyle(
                    color: theme.colorScheme.error,
                  )),
            ),
            SizedBox(height: 20.h), // Qo‘shimcha bo‘sh joy
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom +
              10.h, // Klaviatura ochilganda bosilmaslik uchun
          left: deffaultPadding,
          right: deffaultPadding,
        ),
        child: SizedBox(
          width: double.infinity,
          height: 50.h,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Edit Task",
              style: theme.textTheme.titleSmall,
            ),
          ),
        ),
      ),
    );
  }
}
