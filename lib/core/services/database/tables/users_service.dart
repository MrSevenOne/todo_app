import 'package:todo_app/core/utils/supabase_helper.dart';
import 'package:todo_app/data/model/user_model.dart';

class UserService {
  ///Add user
  Future addUser({required UserModel usermodel}) async {
    return await SupabaseHelper.insertData<UserModel>(
      tableName: 'users',
      model: usermodel,
      toJson: (user) => user.toJson(),
    );
  }

  Future getUserInfo({required String columnValue}) async {
    return await SupabaseHelper.getSingleData(
      tableName: 'users',
      columnName: 'id',
      value: columnValue,
      fromJson: UserModel.fromJson,
    );
  }
}
