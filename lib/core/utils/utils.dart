import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void showCustomSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor:
          Colors.deepPurple.shade900, // Dark galaxy-inspired background
      colorText: Colors.white, // White text for contrast
      snackPosition: SnackPosition.BOTTOM, // Positioned at the bottom
      margin: EdgeInsets.all(16), // Adds margin around the snackbar
      borderRadius: 8, // Rounded corners
      duration: Duration(seconds: 3), // Snackbar duration
      animationDuration: Duration(milliseconds: 500), // Smooth animation
      boxShadows: [
        BoxShadow(
          color: Colors.blue.shade900.withOpacity(0.5),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    );
  }
}
