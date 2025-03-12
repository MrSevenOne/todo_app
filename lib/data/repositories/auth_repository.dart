import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/services/database/auth_service.dart';

class AuthRepository {
  AuthService _authService = AuthService();
  static final authState = AuthService.authState;

  /// **Ro‘yxatdan o‘tish**
  Future<AuthResponse> signUp(
      {required String email,
      required String password,
      required String name}) async {
    return await _authService.signUp(
        email: email, password: password, name: name);
  }

  /// **Tizimga kirish**
  Future<void> signIn({required String email, required String password}) async {
    await _authService.signIn(email: email, password: password);
  }

  /// **Tizimdan chiqish**
  Future<void> signOut() async {
    await _authService.signOut();
  }

  User? getCurrentUser() {
    return Supabase.instance.client.auth.currentUser;
  }

  /// **Hozirgi foydalanuvchini olish**
}
