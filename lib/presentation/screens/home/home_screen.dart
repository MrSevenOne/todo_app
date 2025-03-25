import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo_app/core/config/routes.dart';
import 'package:todo_app/core/utils/time_formatted.dart';
import 'package:todo_app/presentation/provider/todo_provider.dart';
import 'package:todo_app/presentation/widgets/task/add_task_widget.dart';
import 'package:todo_app/presentation/widgets/task_items/tasklist_design.dart';

import '../../widgets/task_items/tasklist_shimmer.dart';

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
          'Todo List',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, provider, child) {
          print("uzunlik: ${provider.todo.length}");

          if (provider.isLoading) {
            return ListView.builder(
              itemCount: 5, // Fake 5 ta shimmer effekt
              itemBuilder: (context, index) => const TaskListShimmer(),
            );
          }

          if (provider.todo.isEmpty) {
            return const Center(
              child: Text(
                "Vazifalar mavjud emas",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: provider.todo.length,
            itemBuilder: (context, index) {
              final todo = provider.todo[index];
              final deadline =
                  DateTimeFormatted.dateFormat(dateTime: todo.deadline);
              return TaskListItem(
                title: todo.title,
                time: '$deadline',
                category: todo.categories,
                flagCount: todo.priority,
                index: index,
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.taskedit,
                      arguments: todo);
                  print(todo);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddTaskWidget.show(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
