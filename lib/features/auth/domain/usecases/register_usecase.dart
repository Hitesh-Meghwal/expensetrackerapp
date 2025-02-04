import 'package:expensetrackerapp/features/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository _authRepository;

  RegisterUsecase(this._authRepository);

  Future<void> call(
      String id, String name, String email, String password) async {
    return _authRepository.registerUser(id, name, email, password);
  }
}
