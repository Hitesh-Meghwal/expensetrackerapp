import 'package:expensetrackerapp/core/appColors/app_colors.dart';
import 'package:expensetrackerapp/core/appStrings/app_string.dart';
import 'package:expensetrackerapp/core/utils/utils.dart';
import 'package:expensetrackerapp/features/auth/data/models/user_model.dart';
import 'package:expensetrackerapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:expensetrackerapp/features/auth/domain/usecases/register_usecase.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final RegisterUsecase _registerUsecase;
  final LoginUsecase _loginUsecase;

  AuthController(this._loginUsecase, this._registerUsecase);

  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var currentUser = Rx<UserModel?>(null);

  Future<void> registerUser(
      String id, String name, String email, String password) async {
    isLoading.value = true;
    try {
      final result = await _registerUsecase.call(id, name, email, password);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUser(String email, String password) async {
    isLoading.value = true;
    try {
      UserModel? result = await _loginUsecase.call(email, password);
      if (result != null) {
        currentUser.value = result;
        isLoggedIn.value = true;
        Get.snackbar(AppString.success, AppString.loggedInSuccess);
      }
    } catch (e) {
      Get.snackbar(AppString.oopsError, e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
