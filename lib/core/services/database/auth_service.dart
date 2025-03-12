import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/core/services/database/tables/users_service.dart';
import 'package:todo_app/data/model/user_model.dart';

class AuthService {
  static final SupabaseClient _supabase = Supabase.instance.client;
  UserService userService = UserService();

  /// **Auth State Stream**
  static Stream<AuthState> get authState => _supabase.auth.onAuthStateChange;

  /// **Ro‘yxatdan o‘tish (E-mail & Parol)**
  Future<AuthResponse> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        UserModel userModel = UserModel(
          id: response.user!.id,
          name: name,
          email: email,
          password: password,
          created_at: response.user!.createdAt,
          image_url: 'hozircha null',
        );
        await userService.addUser(usermodel: userModel);
      }

      return response;
    } on AuthException catch (e) {
      // Supabase xatoliklarini aniqlab xabar berish
      if (e.message.contains('already registered')) {
        throw Exception('Bu email allaqachon ro\'yxatdan o\'tgan!');
      } else {
        throw Exception('Xatolik: ${e.message}');
      }
    } catch (e) {
      throw Exception('Ro‘yxatdan o‘tishda xatolik: $e');
    }
  }

  /// **Tizimga kirish (E-mail & Parol)**
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } on AuthException catch (e) {
      throw Exception('Tizimga kirishda xatolik: ${e.message}');
    } catch (e) {
      throw Exception('Xatolik yuz berdi: $e');
    }
  }

  /// **Tizimdan chiqish**
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      throw Exception('Tizimdan chiqishda xatolik: $e');
    }
  }

  /// **Hozirgi foydalanuvchini olish**
  User? getCurrentUser() {
    return Supabase.instance.client.auth.currentUser;
  }
}
