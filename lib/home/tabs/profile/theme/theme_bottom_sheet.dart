import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_theme_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.04,
      ),
      child: Column(
        spacing: height * 0.04,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              //todo: change language to english
              themeProvider.changeTheme(ThemeMode.light);
            },
            child: themeProvider.isDarkMode()
                ? getUnSelectedItemWidget(theme: 'light')
                : getSelectedItemWidget(theme: 'light'),
          ),
          InkWell(
            onTap: () {
              //todo: change language to arabic
              themeProvider.changeTheme(ThemeMode.dark);
            },
            child: themeProvider.isDarkMode()
                ? getSelectedItemWidget(theme: 'dark')
                : getUnSelectedItemWidget(theme: 'dark'),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget({required String theme}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(theme).tr(), Icon(Icons.check)],
    );
  }

  Widget getUnSelectedItemWidget({required String theme}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(theme).tr()],
    );
  }
}
