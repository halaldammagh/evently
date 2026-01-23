import 'package:evently/home/tabs/profile/widget/custom_text_form_field.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_language_provider.dart';
import '../../../providers/app_theme_provider.dart';
import '../home/widget/event_item.dart';

class FavoriteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.02
            ),
            height: height * 0.14,
            decoration: BoxDecoration(
                color: themeProvider.isDarkMode()
                    ? AppColors.transParent
                    : AppColors.mainColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(35),
                    bottomLeft: Radius.circular(34)
                )
            ),
            child: CustomTextFormField(hintText: 'search_for_event',
              suffixIcon: Image.asset(themeProvider.isDarkMode()
                  ? AppAssets.searchIconDark
                  : AppAssets.searchIcon),),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: height * 0.05),
              itemBuilder: (context, index) {
                return EventItem();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02,);
              },
              itemCount: 20,
            ),
          ),

        ],
      ),
    );
  }
}
