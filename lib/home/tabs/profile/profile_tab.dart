import 'package:evently/home/tabs/profile/language/language_bottom_sheet.dart';
import 'package:evently/home/tabs/profile/theme/theme_bottom_sheet.dart';
import 'package:evently/home/tabs/profile/widget/settings_item.dart';
import 'package:evently/providers/app_language_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final List<String> items = ['english', 'arabic'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final languageProvider = Provider.of<AppLanguageProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final double avatarSize = 130;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          spacing: height * 0.004,
          children: [
            SizedBox(height: height * 0.098),

            SizedBox(
              width: avatarSize,
              height: avatarSize,
              child: ClipOval(
                child: Image.asset(AppAssets.profilePhoto, fit: BoxFit.cover),
              ),
            ),

            SizedBox(height: height * 0.012),
            Text(
              'Rout Academy',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'routacademyr@gmail.com',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: height * 0.022),

            SettingsItem(
              text: 'dark_mode',
              item: Switch(
                activeThumbColor: AppColors.mainDarkMode,
                inactiveThumbColor: AppColors.secTextDarkMode,
                value: themeProvider.isDarkMode(),
                onChanged: (newValue) {
                  themeProvider.changeTheme(
                    newValue ? ThemeMode.dark : ThemeMode.light,
                  );
                },
              ),
              onPressed: () => showThemeBottomSheet(context),
            ),

            ///  سهم فقط + تغيير لغة فعلي
            SettingsItem(
              onPressed: () {},
              vertical: 0.007,
              text: 'language',
              item: SizedBox(
                width: width * 0.15,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedValue,
                    hint: const SizedBox.shrink(),
                    // لا يظهر نص
                    isDense: true,

                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 30,
                      color: themeProvider.isDarkMode()
                          ? AppColors.mainDarkMode
                          : AppColors.mainColor,
                    ),

                    ///  عناصر القائمة
                    items: items.map((e) {
                      final String label = (e == 'arabic')
                          ? 'العربية'
                          : 'English';
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(
                          label,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }).toList(),

                    ///  يخفي النص المختار بجانب السهم حتى بعد الاختيار
                    selectedItemBuilder: (context) {
                      return items.map((e) => const SizedBox.shrink()).toList();
                    },

                    ///  هنا تغيير اللغة فعليًا
                    onChanged: (value) async {
                      if (value == null) return;

                      setState(() => selectedValue = value);

                      await languageProvider.changeLanguage(
                        context,
                        value == 'arabic' ? 'ar' : 'en',
                      );
                    },
                  ),
                ),
              ),
            ),

            SettingsItem(
              vertical: 0.007,
              text: 'logout',
              item: Image.asset(AppAssets.logoutIcon),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.loginRoute);
              },
            ),
          ],
        ),
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
