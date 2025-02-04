import 'package:expensetrackerapp/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<void> registerUser(String id, String name, String email, String password);
  Future<UserModel?> loginUser(String email, String password);
}
