import 'package:flutter/material.dart';
import 'app_colors.dart';

class TextStyles {
  static TextStyle headerText(double size) => TextStyle(
      color: AppColors.textPrimaryColor,
      fontSize: size,
      fontWeight: FontWeight.bold);

  static TextStyle headerAccentText(double size) => TextStyle(
      color: AppColors.splashBackgroundColor,
      fontSize: size,
      fontWeight: FontWeight.bold);

  static TextStyle primaryText(double size) =>
      TextStyle(color: AppColors.textPrimaryColor, fontSize: size);
  static TextStyle primaryAccentText(double size) =>
      TextStyle(color: AppColors.splashBackgroundColor, fontSize: size);

  static TextStyle secondaryText(double size) => TextStyle(
        color: AppColors.textSecondaryColor,
        fontSize: size,
      );

  static TextStyle primaryButtonText =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);

  static TextStyle secondaryButtonText = TextStyle(
      color: AppColors.textSecondaryColor,
      fontSize: 16,
      fontWeight: FontWeight.bold);
}
