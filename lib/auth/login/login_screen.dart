import 'package:easy_localization/easy_localization.dart';
import 'package:evently/home/tabs/profile/widget/custom_elevated_button.dart';
import 'package:evently/home/tabs/profile/widget/custom_text_form_field.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_language_provider.dart';
import '../../providers/app_theme_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.transParent,
        centerTitle: true,
        title: Image.asset(
          themeProvider.isDarkMode()
              ? AppAssets.eventlyDark
              : AppAssets.eventlyLight,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          spacing: height * 0.022,

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: height * 0.04),
            Text(
              'login_to_your_account',
              style: Theme.of(context).textTheme.titleLarge,
            ).tr(),
            Column(
              children: [
                CustomTextFormField(
                  hintText: 'enter_your_email',
                  prefixIcon: Image.asset(AppAssets.emailIcon),
                ),

                SizedBox(height: height * 0.02),
                CustomTextFormField(
                  hintText: 'enter_your_password',
                  prefixIcon: Image.asset(AppAssets.lockIcon),
                  suffixIcon: Image.asset(AppAssets.eysIcon),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: languageProvider.isEnglish()
                        ? width * 0.57
                        : width * 0,
                    right: languageProvider.isEnglish()
                        ? width * 0
                        : width * 0.57,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.forgetPassRoute);
                    },
                    child: Text(
                      'forget_password?',
                      style: Theme.of(context).textTheme.titleSmall,
                    ).tr(),
                  ),
                ),
              ],
            ),

            CustomElevatedButton(
              text: 'login',
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.homeScreenRoute);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'dont_have_an_account?',
                  style: Theme.of(context).textTheme.headlineMedium,
                ).tr(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.newAccountRoute);
                  },
                  child: Text(
                    'signup',
                    style: Theme.of(context).textTheme.titleSmall,
                  ).tr(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 170,
                  color: themeProvider.isDarkMode()
                      ? AppColors.strokeDark
                      : AppColors.lightBorderColor,
                  height: 1,
                ),
                Text('or', style: Theme.of(context).textTheme.titleMedium).tr(),
                Container(
                  width: 170,
                  color: themeProvider.isDarkMode()
                      ? AppColors.strokeDark
                      : AppColors.lightBorderColor,
                  height: 1,
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: themeProvider.isDarkMode()
                    ? AppColors.inputs
                    : AppColors.white,
              ),
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.googleIcon),
                    Text(
                      'login_with_google',
                      style: Theme.of(context).textTheme.labelMedium,
                    ).tr(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
