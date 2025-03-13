import 'package:todo_app/core/utils/supabase_helper.dart';
import 'package:todo_app/data/model/todo_model.dart';

class ToDoService {
  static Future<void> addTodo({required TodoModel todomodel}) async =>
      await SupabaseHelper.insertData<TodoModel>(
        tableName: 'todos',
        model: todomodel,
        toJson: (todo) => todo.toJson(),
      );

  static Future<List<TodoModel>> getTodo({required sortValue}) async =>
      await SupabaseHelper.getSortData(
        tableName: 'todos',
        fromJson: (json) => TodoModel.fromJson(json),
        columnName: 'userId',
        columnValue: sortValue,
      );
}
