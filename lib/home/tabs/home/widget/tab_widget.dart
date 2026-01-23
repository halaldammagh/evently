import 'package:evently/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_language_provider.dart';
import '../../../../providers/app_theme_provider.dart';

class TabWidget extends StatelessWidget {
  bool isImage;
  String? image;
  bool isSelected;
  Color selectedColor;
  Color unSelectedColor;
  String eventName;
  TextStyle selectedTextStyle;
  TextStyle unSelectedTextStyle;

  TabWidget({
    super.key,
    this.isImage = false,
    required this.eventName,
    required this.isSelected,
    required this.selectedColor,
    required this.unSelectedColor,
    required this.selectedTextStyle,
    required this.unSelectedTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? selectedColor : unSelectedColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: themeProvider.isDarkMode()
              ? AppColors.mainDarkMode
              : AppColors.lightBorderColor,
          width: 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.06,
          vertical: height * 0.005,
        ),
        child: Row(
          children: [
            isImage == true ? Image.asset('image') : SizedBox(),
            Text(
              eventName,
              style: isSelected ? selectedTextStyle : unSelectedTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
