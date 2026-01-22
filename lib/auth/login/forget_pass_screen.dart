import 'package:easy_localization/easy_localization.dart';
import 'package:evently/home/tabs/profile/widget/custom_elevated_button.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_language_provider.dart';
import '../../providers/app_theme_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transParent,
        automaticallyImplyActions: false,
        leadingWidth: languageProvider.isEnglish()
            ? width * 0.11
            : width * 0.17,
        leading: Padding(
          padding: EdgeInsets.only(
            top: height * 0.012,
            left: width * 0.04,
            right: languageProvider.isEnglish() ? width * 0 : width * 0.04,
            bottom: height * 0.012,
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.loginRoute);
            },
            child: Container(
              height: height * 0.035,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusGeometry.circular(8),
                border: Border.all(
                  color: themeProvider.isDarkMode()
                      ? AppColors.strokeDark
                      : AppColors.lightBorderColor,
                ),
                color: themeProvider.isDarkMode()
                    ? AppColors.inputs
                    : AppColors.white,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: themeProvider.isDarkMode()
                      ? AppColors.white
                      : AppColors.mainColor,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          'forget_password',
          style: Theme.of(context).textTheme.labelLarge,
        ).tr(),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            themeProvider.isDarkMode()
                ? AppAssets.watchDark
                : AppAssets.watchLight,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: CustomElevatedButton(
              text: 'reset_password',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
