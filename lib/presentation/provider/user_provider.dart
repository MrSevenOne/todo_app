import 'package:flutter/cupertino.dart';
import 'package:todo_app/data/model/user_model.dart';
import 'package:todo_app/data/repositories/users_repository.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    getUserInfo();
  }

  final UserRepository _userRepository = UserRepository();

  UserModel? _user;
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;

  UserModel? get user => _user;

  String? get error => _error;

  /// **User ma'lumotlarini olish (single)**
  Future<void> getUserInfo() async {
    _setLoading(true);
    try {
      _user = await _userRepository.getUserInfo();
    } catch (e) {
      _error = 'Xatolik: $e';
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
