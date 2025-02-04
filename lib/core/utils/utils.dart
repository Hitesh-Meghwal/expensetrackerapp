import 'package:expensetrackerapp/core/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void showCustomSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.primaryColor,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
      boxShadows: [
        BoxShadow(
          color: AppColors.primaryColor.withOpacity(0.5),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
