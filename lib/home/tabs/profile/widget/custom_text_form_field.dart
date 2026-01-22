import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_theme_provider.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;

  // خصائص التحكم بالطول
  final int minLines;
  final int maxLines;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.minLines = 1,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,

      textAlignVertical: TextAlignVertical.top,
      // 👈 الكتابة من فوق
      style: AppStyles.lightGrey14Regular,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText.tr(),
        hintStyle: AppStyles.lightGrey16Regular,
        filled: true,
        fillColor: themeProvider.isDarkMode()
            ? AppColors.inputs
            : AppColors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: themeProvider.isDarkMode()
                ? AppColors.strokeDark
                : AppColors.lightBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: themeProvider.isDarkMode()
                ? AppColors.strokeDark
                : AppColors.lightBorderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
      ),
    );
  }
}
