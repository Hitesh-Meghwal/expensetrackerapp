import 'package:expensetrackerapp/core/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;
  const CustomButton(
      {super.key, required this.onPressed, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          ),
      child: Text(buttonName,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.secondaryColor)),
    );
  }
}
