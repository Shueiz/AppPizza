import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 7, 7, 7),
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const TextStyle input = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const TextStyle button = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}
