import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/data/repositories/todo_repository.dart';
import '../../data/model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  TodoProvider() {
    _listenAuthChanges();
    getTodo(); // Dastlab ma'lumotlarni yuklash
  }

  void _listenAuthChanges() {
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      getTodo(); // User almashganda avtomatik yangilash
    });
  }

  final TodoRepository _todoRepository = TodoRepository();
  bool _isLoading = false;
  List<TodoModel> _todo = [];
  List<TodoModel> _sortBydate = [];

  bool get isLoading => _isLoading;

  List<TodoModel> get todo => _todo;

  List<TodoModel> get sortByDate => _sortBydate;

  /// **Ma'lumotlarni qo'shish**
  Future addCollectedTodo({required TodoModel todoModel}) async {
    _setLoading(true);
    try {
      await _todoRepository.addTodo(todomodel: todoModel);
      getTodo();
    } catch (e) {
      print('Add todo error: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  /// **Barcha ma'lumotlarni olish**
 Future getTodo() async {
  _setLoading(true);
  try {
    _todo = await _todoRepository.getTodo();
    _todo = _todo.reversed.toList(); // Ro‘yxatni teskari tartiblash
    notifyListeners();
  } catch (e) {
    print('Get todo error:  $e');
  } finally {
    _setLoading(false);
  }
}


  /// **Berilgan sanaga mos todolarni olish**
  Future getTodoByDate(DateTime date) async {
    _setLoading(true);
    try {
      List<TodoModel> allTodos = await _todoRepository.getTodo();
      _sortBydate = allTodos
          .where((todo) =>
      todo.deadline.year == date.year &&
          todo.deadline.month == date.month &&
          todo.deadline.day == date.day)
          .toList();
      notifyListeners();
    } catch (e) {
      print('Get todo by date error: $e');
    } finally {
      _setLoading(false);
    }
  }

  /// **Priority yig‘indisini olish (isActive bo‘yicha)**
  int getPrioritySum(bool isActive) {
    return _todo
        .where((todo) => todo.isActive == isActive) // Filterlash
        .fold(0, (sum, todo) => sum + todo.priority); // Yig‘ish
  }

  /// **Loading holatini boshqarish**
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
