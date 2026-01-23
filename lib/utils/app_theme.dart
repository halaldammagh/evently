import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBg,
    textTheme: TextTheme(
      headlineLarge: AppStyles.black20Bold,
      headlineMedium: AppStyles.lightGrey14Regular,
      headlineSmall: AppStyles.black16Bold,
      bodyLarge: AppStyles.black20Bold,
      bodyMedium: AppStyles.lightGrey16Regular,
      bodySmall: AppStyles.darkBlue18Medium,
      titleLarge: AppStyles.mainColor24Bold,
      titleSmall: AppStyles.mainColor14Bold,
      titleMedium: AppStyles.mainColor16Bold,
      labelMedium: AppStyles.mainColor18Medium,
      labelLarge: AppStyles.black18Medium,
        labelSmall: AppStyles.black14Medium,
        displaySmall: AppStyles.mainColor14Regular
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.mainColor,
      unselectedItemColor: AppColors.disable,
      selectedLabelStyle: AppStyles.darkBlue12Regular,
      unselectedLabelStyle: AppStyles.lightGrey12Regular,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBg,
    textTheme: TextTheme(
      labelMedium: AppStyles.mainDark18Medium,
      titleLarge: AppStyles.white24Bold,
      headlineLarge: AppStyles.white20Bold,
      headlineMedium: AppStyles.darkGrey14Regular,
      headlineSmall: AppStyles.white16Bold,
      bodyLarge: AppStyles.white20Bold,
      bodyMedium: AppStyles.darkGrey16Regular,
      bodySmall: AppStyles.white18Medium,
      titleSmall: AppStyles.mainDark14Bold,
      titleMedium: AppStyles.mainDark16Bold,
      labelLarge: AppStyles.white18Medium,
        labelSmall: AppStyles.white14Medium,
        displaySmall: AppStyles.mainDark14Regular

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBg,
      selectedItemColor: AppColors.mainDarkMode,
      unselectedItemColor: AppColors.disable,
      selectedLabelStyle: AppStyles.lightGrey12Regular,
      unselectedLabelStyle: AppStyles.darkBlue12Regular,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainDarkMode,
      shape: StadiumBorder(),
    ),
  );
}
