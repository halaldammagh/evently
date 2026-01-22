import 'package:easy_localization/easy_localization.dart';
import 'package:evently/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_colors.dart';

class SettingsItem extends StatelessWidget {
  String text;
  Widget item;
  VoidCallback onPressed;
  double vertical;

  SettingsItem({
    super.key,
    required this.text,
    required this.item,
    required this.onPressed,
    this.vertical = 0,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * vertical,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: themeProvider.isDarkMode()
                ? AppColors.mainDarkMode
                : AppColors.lightBorderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
          color: themeProvider.isDarkMode()
              ? AppColors.inputs
              : AppColors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: Theme.of(context).textTheme.headlineSmall).tr(),
            IconButton(
              onPressed: () {
                onPressed();
              },
              icon: item,
            ),
          ],
        ),
      ),
    );
  }
}
