import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_language_provider.dart'
    show AppLanguageProvider;
import '../../../../providers/app_theme_provider.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;

  CustomElevatedButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: themeProvider.isDarkMode()
            ? AppColors.mainDarkMode
            : AppColors.mainColor,
      ),
      onPressed: () {
        onPressed();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.015),
        child: Text(text, style: AppStyles.white20Regular).tr(),
      ),
    );
  }
}
