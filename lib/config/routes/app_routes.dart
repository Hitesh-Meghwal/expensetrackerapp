import 'package:expensetrackerapp/features/auth/presentation/pages/login_screen.dart';
import 'package:expensetrackerapp/features/auth/presentation/pages/signup_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String loginScreen = "/loginScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String forgetPasswordScreen = "/forgetPasswordScreen";

  final List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: signUpScreen, page: () => const SignupScreen()),
  ];
}
