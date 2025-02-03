import 'package:expensetrackerapp/features/auth/presentation/pages/add_expense_tracker.dart';
import 'package:expensetrackerapp/features/auth/presentation/pages/dashboard_screen.dart';
import 'package:expensetrackerapp/features/auth/presentation/pages/login_screen.dart';
import 'package:expensetrackerapp/features/auth/presentation/pages/signup_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String loginScreen = "/loginScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String darhboardScreen = "/dashoardScreen";
  static const String addExpenseScreen = "/AddExpenseScreen";

  final List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: signUpScreen, page: () => const SignupScreen()),
    GetPage(name: darhboardScreen, page: () => const DashboardScreen()),
    GetPage(name: addExpenseScreen, page: () => const AddExpenseScreen()),
  ];
}
