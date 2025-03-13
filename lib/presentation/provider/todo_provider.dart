import 'package:flutter/widgets.dart';
import 'package:todo_app/data/repositories/todo_repository.dart';

import '../../data/model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final TodoRepository _repository;

  TodoProvider(this._repository);

  bool _isLoading = false;
  List<TodoModel> _todo = [];

  bool get isLoading => _isLoading;

  List<TodoModel> get todo => _todo;

  ///Add
  Future addTodo({required TodoModel todomodel}) async {
    _setLoading(true);
    try {
      await _repository.addTodo(todomodel: todomodel);
    } catch (e) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  /// Get
  Future getTodo() async {
    _setLoading(true);
    try {
      _todo = await _repository.getTodo();
    } catch (e) {
      print('Get todo error:  $e');
    } finally {
      _setLoading(false);
    }
  }

  /// **Loading holatini boshqarish**
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
