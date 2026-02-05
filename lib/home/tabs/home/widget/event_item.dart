import 'package:easy_localization/easy_localization.dart';
import 'package:evently/model/event.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_language_provider.dart';
import '../../../../providers/app_theme_provider.dart';
import '../../../../providers/event_list_provider.dart';

class EventItem extends StatelessWidget {
  final Event event;

  EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var eventsProvider = Provider.of<EventListProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      // padding: EdgeInsets.symmetric(
      //   horizontal: width*0.02,
      //   vertical: height*0.1
      // ),
      height: height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(event.eventImage),
        ),
        border: Border.all(
          color: themeProvider.isDarkMode()
              ? AppColors.mainDarkMode
              : AppColors.lightBorderColor,
          width: 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: themeProvider.isDarkMode()
                    ? AppColors.darkBg
                    : AppColors.lightBg,
                border: Border.all(
                  color: themeProvider.isDarkMode()
                      ? AppColors.mainDarkMode
                      : AppColors.lightBorderColor,
                  width: 2,
                ),
              ),
              child: Text(
                DateFormat('d MMM').format(event.eventDate),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.002,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: themeProvider.isDarkMode()
                    ? AppColors.darkBg
                    : AppColors.lightBg,
                border: Border.all(
                  color: themeProvider.isDarkMode()
                      ? AppColors.mainDarkMode
                      : AppColors.lightBorderColor,
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    event.eventTitle,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  IconButton(
                    onPressed: () {
                      eventsProvider.updateIsFavorite(event);
                    },
                    icon: Icon(
                      event.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: themeProvider.isDarkMode()
                          ? AppColors.mainDarkMode
                          : AppColors.mainColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
