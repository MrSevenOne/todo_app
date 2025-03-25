import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/core/services/database/tables/users_service.dart';
import 'package:todo_app/data/model/user_model.dart';
import 'package:todo_app/presentation/widgets/snackBar_widget.dart';

class AuthService {
  static final SupabaseClient _supabase = Supabase.instance.client;
  UserService userService = UserService();

  /// **Auth State Stream**
  static Stream<AuthState> get authState => _supabase.auth.onAuthStateChange;

  /// **Ro‘yxatdan o‘tish (E-mail & Parol)**
  Future<AuthResponse?> signUp({
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
      if (e.message.contains('already registered')) {
        SnackBarWidget.showInfo(
            title: 'Registered', message: "This email is already registered!");
      } else {
        SnackBarWidget.showInfo(title: 'Error', message: "${e.message}");
      }
    } catch (e) {
      SnackBarWidget.showInfo(title: 'Error registered', message: "$e");
      return null;
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
      SnackBarWidget.showInfo(title: 'Error Login', message: "${e.message}");
    } catch (e) {
      SnackBarWidget.showInfo(title: 'Error', message: "$e");
    }
  }

  /// **Tizimdan chiqish**
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      SnackBarWidget.showInfo(title: 'Error Logout', message: "${e}");
    }
  }

  /// **Hozirgi foydalanuvchini olish**
  String? getUserId() {
    final user = _supabase.auth.currentUser;
    return user?.id;
  }
}
