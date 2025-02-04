import 'package:expensetrackerapp/features/auth/data/models/user_model.dart';
import 'package:expensetrackerapp/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository _authRepository;
  LoginUsecase(this._authRepository);

  Future<UserModel?> call(String email, String password) async {
    return _authRepository.loginUser(email, password);
  }
}
