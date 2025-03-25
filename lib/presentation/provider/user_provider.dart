import 'dart:async';
import 'package:flutter/material.dart';
import '../../data/model/user_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/users_repository.dart';

class UserProvider extends ChangeNotifier {
  final UserRepository _userRepository = UserRepository();
  StreamSubscription? _authSubscription;

  UserModel? _user;
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  UserModel? get user => _user;
  String? get error => _error;

  UserProvider() {
    _listenAuthChanges();
  }

  /// **Auth holatini tinglash**
  void _listenAuthChanges() {
    _authSubscription = AuthRepository().authState.listen((authState) {
      if (authState.session != null) {
        getUserInfo(); // Foydalanuvchi almashsa, ma'lumotni yangilaymiz
      } else {
        _user = null; // Agar chiqib ketsa, user null bo'lishi kerak
        notifyListeners();
      }
    });
  }

  /// **User ma'lumotlarini olish**
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

  /// **User ma'lumotlarini yangilash**
  Future<void> upgrateUserInfo({required String name}) async {
    _setLoading(true);
    await _userRepository.upgrateUserInfo(updateValue: name);
    await getUserInfo();
  }

  /// **Loading holatini boshqarish**
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// **Provider yo'q qilinayotganda stream-ni tozalash**
  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }
}
