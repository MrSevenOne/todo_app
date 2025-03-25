import 'package:todo_app/core/services/database/auth_service.dart';
import 'package:todo_app/core/services/database/tables/todos_service.dart';
import '../model/todo_model.dart';

class TodoRepository {
  ///Add
  Future addTodo({required TodoModel todomodel}) async =>
      ToDoService.addTodo(todomodel: todomodel);

  /// Get
  Future<List<TodoModel>> getTodo() async => ToDoService.getTodo(
        sortValue: AuthService().getUserId(),
      );
}
