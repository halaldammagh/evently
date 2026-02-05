import 'package:easy_localization/easy_localization.dart';
import 'package:evently/home/tabs/home/widget/event_item.dart';
import 'package:evently/home/tabs/home/widget/tab_widget.dart';
import 'package:evently/providers/event_list_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_language_provider.dart';
import '../../../providers/app_theme_provider.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late EventListProvider eventProvider;

  void initState() {
    //todo: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      eventProvider.getAllEventsFromFireStore();
    });
  }


  @override
  Widget build(BuildContext context) {
    eventProvider = Provider.of<EventListProvider>(context);
    eventProvider.getEventsNameList();
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
    if (eventProvider.eventsList.isEmpty) {
      eventProvider.getAllEventsFromFireStore();
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              Text('welcome_back', style: AppStyles.darkGrey14Regular).tr(),
              Text('john_safwat', style: AppStyles.darkGrey20Regular).tr(),
            ],
          ),
        ),
        backgroundColor: themeProvider.isDarkMode()
            ? AppColors.transParent
            : AppColors.mainColor,
        actions: [
          Row(
            spacing: width * 0.005,
            children: [
              Image.asset(
                themeProvider.isDarkMode()
                    ? AppAssets.moonLight
                    : AppAssets.sunDark,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: themeProvider.isDarkMode()
                          ? AppColors.mainDarkMode
                          : AppColors.white,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: themeProvider.isDarkMode()
                        ? AppColors.mainDarkMode
                        : AppColors.mainColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.005,
                      horizontal: width * 0.015,
                    ),
                    child: Text(
                      languageProvider.appLanguage.toUpperCase(),
                      style: AppStyles.white14Medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.10,
            decoration: BoxDecoration(
              color: themeProvider.isDarkMode()
                  ? AppColors.transParent
                  : AppColors.mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),

            child: DefaultTabController(
              length: eventProvider.eventsNameList.length,
              child: TabBar(
                onTap: (index) {
                  eventProvider.changeSelectedIndex(index);
                },
                labelPadding: EdgeInsets.symmetric(horizontal: width * 0.01),
                tabAlignment: TabAlignment.start,

                isScrollable: true,
                dividerColor: AppColors.transParent,
                indicatorColor: AppColors.transParent,
                tabs: eventProvider.eventsNameList.map((eventName) {
                  return TabWidget(
                    eventName: eventName,
                    isSelected:
                    eventProvider.selectedIndex ==
                        eventProvider.eventsNameList.indexOf(eventName),
                    selectedColor: themeProvider.isDarkMode()
                        ? AppColors.mainColor
                        : AppColors.white,
                    unSelectedColor: AppColors.transParent,
                    selectedTextStyle: themeProvider.isDarkMode()
                        ? AppStyles.whit16Medium
                        : AppStyles.input16Medium,
                    unSelectedTextStyle: AppStyles.whit16Medium,
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: eventProvider.filterList.isEmpty ?
            Center(child: Text('No events found'),)
                :
            ListView.separated(
              padding: EdgeInsets.only(top: height * 0.009),
              itemBuilder: (context, index) {
                return EventItem(event: eventProvider.filterList[index],);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemCount: eventProvider.filterList.length,
            ),
          ),
        ],
      ),
    );
  }


}
