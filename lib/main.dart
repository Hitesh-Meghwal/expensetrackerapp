import 'package:expensetrackerapp/config/dependencyInjection/dependency_injection.dart';
import 'package:expensetrackerapp/config/routes/app_routes.dart';
import 'package:expensetrackerapp/config/theme/app_theme.dart';
import 'package:expensetrackerapp/core/appStrings/app_string.dart';
import 'package:expensetrackerapp/core/services/hive_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize service
  await HiveServices.init();
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.appName,
      theme: AppTheme.lightTheme,
      getPages: AppRoutes().routes,
      initialRoute: AppRoutes.loginScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}
