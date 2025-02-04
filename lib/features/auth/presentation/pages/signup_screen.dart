import 'package:expensetrackerapp/config/routes/app_routes.dart';
import 'package:expensetrackerapp/core/appColors/app_colors.dart';
import 'package:expensetrackerapp/core/appStrings/app_string.dart';
import 'package:expensetrackerapp/features/auth/presentation/controller/auth_controller.dart';
import 'package:expensetrackerapp/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscureText = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final authController = Get.find<AuthController>();

  bool get _isFormValid =>
      _nameController.text.isNotEmpty &&
      _emailController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppString.singUp,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: AppColors.primaryColor)),
            const SizedBox(height: 32),
            TextField(
              controller: _nameController,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                labelText: AppString.name,
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                labelText: AppString.email,
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                labelText: AppString.password,
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              obscureText: _obscureText,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(AppString.haveAnAccount,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.primaryColor)),
                TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.loginScreen);
                  },
                  child: Text(AppString.backToLogin,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.blue)),
                ),
              ],
            ),
            const SizedBox(height: 32),
            CustomButton(
                onPressed: () {
                  if (_isFormValid) {
                    authController.registerUser("1", _nameController.text,
                        _emailController.text, _passwordController.text);
                    Get.toNamed(AppRoutes.darhboardScreen);
                  } else {
                    Get.snackbar("", "");
                  }
                },
                buttonName: AppString.singUpBtn,
                isFormValid: _isFormValid)
          ],
        ),
      ),
    );
  }
}
