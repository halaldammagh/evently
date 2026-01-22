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

class CreateYourAccountScreen extends StatelessWidget {
  const CreateYourAccountScreen({super.key});

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
            SizedBox(height: height * 0.03),
            Text(
              'create_your_account',
              style: Theme.of(context).textTheme.titleLarge,
            ).tr(),
            CustomTextFormField(
              hintText: 'enter_your_name',
              prefixIcon: Image.asset(AppAssets.profileUnSelectedIcon),
            ),
            CustomTextFormField(
              hintText: 'enter_your_email',
              prefixIcon: Image.asset(AppAssets.emailIcon),
            ),
            CustomTextFormField(
              hintText: 'enter_your_password',
              prefixIcon: Image.asset(AppAssets.lockIcon),
              suffixIcon: Image.asset(AppAssets.eysIcon),
            ),
            CustomTextFormField(
              hintText: 'confirm_your_password',
              prefixIcon: Image.asset(AppAssets.lockIcon),
              suffixIcon: Image.asset(AppAssets.eysIcon),
            ),
            SizedBox(height: height * 0.01),
            CustomElevatedButton(
              text: 'sign_up',
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.homeScreenRoute);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: Theme.of(context).textTheme.headlineMedium,
                ).tr(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.loginRoute);
                  },
                  child: Text(
                    'login',
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
                      'sign_up_with_google',
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
