import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/presentation/widgets/task/add_task_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Index',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              AddTaskWidget.show(
                context,
                title: "Add Task",
                content: "Bu maxsus widget orqali chiqarilgan dialog.",
              );
            },
            icon: Icon(
              Icons.add_circle,
            ),
          ),
          SizedBox(width: 12.w),
        ],
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
