import 'package:todo_app/data/model/user_model.dart';

class TodoModel {
  final int id;
  final DateTime createdAt;
  final String title;
  final String description;
  final int categories;
  final DateTime deadline;
  UserModel userId;
  final int priority;
  final bool isActive;

  TodoModel(
      {required this.id,
      required this.createdAt,
      required this.title,
      required this.description,
      required this.categories,
      required this.deadline,
      required this.userId,
      required this.priority,
      required this.isActive});

  // Convert JSON to
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      title: json['title'] as String,
      description: json['description'] as String,
      categories: json['categories'] as int,
      deadline: DateTime.parse(json['deadline'] as String),
      userId: UserModel.fromJson(json['userId']),
      priority: json['priority'] as int,
      isActive: json['isActive'] as bool,
    );
  }

  // Convert  to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'title': title,
      'description': description,
      'categories': categories,
      'deadline': deadline.toIso8601String(),
      'userId': userId,
      'priority': priority,
    };
  }
}
