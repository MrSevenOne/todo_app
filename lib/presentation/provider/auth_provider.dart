import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/data/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  bool _isLoading = false;
  bool? _isLoggedIn;

  bool? get isLoggedIn => _isLoggedIn;

  bool get loading => _isLoading;

  /// **Auth State Stream**
  Stream<AuthState> get authState => _authRepository.authState;

  String? get currentUser => _authRepository.getUserId();

  /// **Ro'yxatdan o'tish**
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    _setLoading(true);
    try {
      await _authRepository.signUp(
          name: name, email: email, password: password);
      _showError(context, "sign up userId: ${_authRepository.getUserId()}");
      _isLoggedIn = true;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ro\'yxatdan muvaffaqiyatli o\'tdingiz!')),
      );
    } catch (e) {
      _showError(context, e.toString());
    }
    _setLoading(false);
  }

  /// **Tizimga kirish**
  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    _setLoading(true);
    try {
      await _authRepository.signIn(email: email, password: password);
      _showError(context, "sign in userId: ${_authRepository.getUserId()}");
      _isLoggedIn = true;
      notifyListeners();
    } catch (e) {
      _showError(context, e.toString());
    }
    _setLoading(false);
  }

  /// **Tizimdan chiqish**
  Future<void> signOut(BuildContext context) async {
    try {
      await _authRepository.signOut();
      _isLoggedIn = false;
      notifyListeners();
    } catch (e) {
      _showError(context, e.toString());
    }
  }

  /// **Xatolikni ko'rsatish**
  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  /// **Loading holatini boshqarish**
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
