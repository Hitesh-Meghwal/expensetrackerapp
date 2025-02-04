import 'package:expensetrackerapp/core/appStrings/app_string.dart';
import 'package:expensetrackerapp/core/services/hive_services.dart';
import 'package:expensetrackerapp/features/auth/data/models/user_model.dart';
import 'package:hive/hive.dart';

abstract class AuthLocalDataSource {
  Future<void> registerUser(UserModel user);
  Future<UserModel?> loginUser(String email, String password);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box _box = HiveServices.userBox;

  @override
  Future<void> registerUser(UserModel user) async {
    if (!_box.containsKey(user.email)) {
      await _box.put(user.email, user);
    } else {
      throw Exception(AppString.userAlreadyExist);
    }
  }

  @override
  Future<UserModel?> loginUser(String email, String password) async {
    if (_box.containsKey(email)) {
      final user = _box.get(email) as UserModel;
      if (user.password == password) {
        return user;
      } else {
        throw Exception(AppString.invalidPassword);
      }
    }
    throw Exception(AppString.userNotFound);
  }
}
