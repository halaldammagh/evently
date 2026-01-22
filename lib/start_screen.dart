import 'package:easy_localization/easy_localization.dart';
import 'package:evently/home/tabs/profile/widget/custom_elevated_button.dart';
import 'package:evently/providers/app_language_provider.dart';
import 'package:evently/providers/app_theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transParent,
        centerTitle: true,
        title: themeProvider.isDarkMode()
            ? Image.asset(AppAssets.eventlyDark)
            : Image.asset(AppAssets.eventlyLight),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            themeProvider.isDarkMode()
                ? Image.asset(AppAssets.intro1Dark)
                : Image.asset(AppAssets.intro1Light),

            Text(
              'intro1_title',
              style: Theme.of(context).textTheme.bodyLarge,
            ).tr(),
            Text(
              'intro1_text',
              style: Theme.of(context).textTheme.bodyMedium,
            ).tr(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'language',
                  style: Theme.of(context).textTheme.bodySmall,
                ).tr(),

                SizedBox(
                  width: languageProvider.isEnglish()
                      ? width * 0.25
                      : width * 0.4,
                ),
                InkWell(
                  onTap: () {
                    languageProvider.changeLanguage(context, 'en');
                  },

                  child: Container(
                    height: 32,
                    width: 83,
                    decoration: BoxDecoration(
                      color: themeProvider.isDarkMode()
                          ? languageProvider.isEnglish()
                                ? AppColors.mainDarkMode
                                : AppColors.inputs
                          : languageProvider.isEnglish()
                          ? AppColors.mainColor
                          : AppColors.white,
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'english',
                        style: themeProvider.isDarkMode()
                            ? languageProvider.isEnglish()
                                  ? AppStyles.white14Medium
                                  : AppStyles.white14Medium
                            : languageProvider.isEnglish()
                            ? AppStyles.white14Medium
                            : AppStyles.blue14Medium,
                      ).tr(),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    languageProvider.changeLanguage(context, 'ar');
                  },

                  child: Container(
                    height: 32,
                    width: 83,
                    decoration: BoxDecoration(
                      color: themeProvider.isDarkMode()
                          ? languageProvider.isEnglish()
                                ? AppColors.inputs
                                : AppColors.mainDarkMode
                          : languageProvider.isEnglish()
                          ? AppColors.white
                          : AppColors.mainColor,
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'arabic',
                        style: themeProvider.isDarkMode()
                            ? languageProvider.isEnglish()
                                  ? AppStyles.white14Medium
                                  : AppStyles.white14Medium
                            : languageProvider.isEnglish()
                            ? AppStyles.blue14Medium
                            : AppStyles.white14Medium,
                      ).tr(),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'theme',
                  style: Theme.of(context).textTheme.bodySmall,
                ).tr(),

                SizedBox(
                  width: languageProvider.isEnglish()
                      ? width * 0.4
                      : width * 0.48,
                ),

                InkWell(
                  onTap: () {
                    themeProvider.changeTheme(ThemeMode.light);
                  },
                  child: Container(
                    height: height * 0.039,
                    width: width * 0.14,
                    decoration: BoxDecoration(
                      color: themeProvider.isDarkMode()
                          ? AppColors.inputs
                          : AppColors.mainColor,
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                    child: Center(
                      child: Image.asset(
                        themeProvider.isDarkMode()
                            ? AppAssets.sunDark
                            : AppAssets.sunLight,
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    themeProvider.changeTheme(ThemeMode.dark);
                  },

                  child: Container(
                    height: height * 0.039,
                    width: width * 0.14,
                    decoration: BoxDecoration(
                      color: themeProvider.isDarkMode()
                          ? AppColors.mainDarkMode
                          : AppColors.white,
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                    child: Center(
                      child: Image.asset(
                        themeProvider.isDarkMode()
                            ? AppAssets.moonDark
                            : AppAssets.moonLight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CustomElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, AppRoutes.introScreenRoute);
              },
              text: 'Lets_start',
            ),
            SizedBox(height: height * 0.01),
          ],
        ),
      ),
    );
  }
}
