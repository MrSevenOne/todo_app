import 'package:todo_app/core/services/database/tables/users_service.dart';
import 'package:todo_app/data/model/user_model.dart';
import 'package:todo_app/data/repositories/auth_repository.dart';

class UserRepository {
  final UserService userService = UserService();
  final AuthRepository authRepository = AuthRepository();

  /// User ma'lumotini olish
  Future<UserModel?> getUserInfo() async {
    return await userService.getUserInfo(
      columnValue: authRepository.getCurrentUser()!.id,
    );
  }
}
