import 'package:expensetrackerapp/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:expensetrackerapp/features/auth/data/repositoriesImpl/auth_repository_impl.dart';
import 'package:expensetrackerapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:get/get.dart';
import 'package:expensetrackerapp/features/auth/presentation/controller/auth_controller.dart';
import 'package:expensetrackerapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:expensetrackerapp/features/auth/domain/usecases/register_usecase.dart';

class DependencyInjection {
  static void init() {
    // Registering the AuthLocalDataSource implementation first
    Get.lazyPut<AuthLocalDataSource>(() => AuthLocalDataSourceImpl());

    // Registering the AuthRepository implementation after AuthLocalDataSource
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find<AuthLocalDataSource>()));

    // Registering use cases
    Get.lazyPut<LoginUsecase>(() => LoginUsecase(Get.find<AuthRepository>()));
    Get.lazyPut<RegisterUsecase>(() => RegisterUsecase(Get.find<AuthRepository>()));

    // Register AuthController
    Get.lazyPut<AuthController>(() => AuthController(
      Get.find<LoginUsecase>(),
      Get.find<RegisterUsecase>(),
    ));
  }
}
