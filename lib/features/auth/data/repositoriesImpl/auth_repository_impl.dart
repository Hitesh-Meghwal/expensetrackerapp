import 'package:expensetrackerapp/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:expensetrackerapp/features/auth/data/models/user_model.dart';
import 'package:expensetrackerapp/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(this._authLocalDataSource);

  @override
  Future<UserModel?> loginUser(String email, String password) async {
    return await _authLocalDataSource.loginUser(email, password);
  }

  @override
  Future<void> registerUser(
      String id, String name, String email, String password) async {
    final user =
        UserModel(id: id, name: name, email: email, password: password);
    await _authLocalDataSource.registerUser(user);
  }
}
