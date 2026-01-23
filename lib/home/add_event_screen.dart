import 'package:easy_localization/easy_localization.dart';
import 'package:evently/home/tabs/home/widget/tab_widget.dart';
import 'package:evently/home/tabs/profile/widget/custom_elevated_button.dart';
import 'package:evently/home/tabs/profile/widget/custom_text_form_field.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_language_provider.dart';
import '../providers/app_theme_provider.dart';
import '../utils/app_routes.dart';
import '../utils/app_styles.dart';

class AddEventScreen extends StatefulWidget {
  AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  List<String> eventsNameList = [
    'sport'.tr(),
    'birthday'.tr(),
    'meeting'.tr(),
    'gaming'.tr(),
    'work_shop'.tr(),
    'book_club'.tr(),
    'exhibition'.tr(),
    'holiday'.tr(),
    'eating'.tr(),
  ];
  List<String> evetImageLight = [
    AppAssets.sportEvnLight,
    AppAssets.birthEvnLight,
    AppAssets.meetingEvnLight,
    AppAssets.gamingLight,
    AppAssets.workshopLight,
    AppAssets.bookClubEvnLight,
    AppAssets.exhibitionEvnLight,
    AppAssets.eatingLight,
    AppAssets.holidayLight,
  ];
  List<String> evetImageDark = [
    AppAssets.sportEvnDark,
    AppAssets.birthEvnDark,
    AppAssets.meetingEvnDark,
    AppAssets.gamingDark,
    AppAssets.workshopDark,
    AppAssets.bookClubEvnDark,
    AppAssets.exhibitionEvnDark,
    AppAssets.eatingLight,
    AppAssets.holidayDark,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transParent,
        leading: Padding(
          padding: EdgeInsets.only(
            top: height * 0.012,
            left: width * 0.04,
            right: languageProvider.isEnglish() ? width * 0 : width * 0.04,
            bottom: height * 0.012,
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.homeScreenRoute);
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
          'add_event',
          style: Theme.of(context).textTheme.labelLarge,
        ).tr(),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.02,
        ),
        child: Column(
          spacing: height * 0.01,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: themeProvider.isDarkMode()
                      ? AppColors.transParent
                      : AppColors.lightBorderColor,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),
                child: Image.asset(
                  fit: BoxFit.fill,
                  themeProvider.isDarkMode()
                      ? evetImageDark[selectedIndex]
                      : evetImageLight[selectedIndex],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.001),
              child: SizedBox(
                height: height * 0.045,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                        child: TabWidget(
                          eventName: eventsNameList[index],
                          isSelected: selectedIndex == index,
                          selectedColor: themeProvider.isDarkMode()
                              ? AppColors.mainDarkMode
                              : AppColors.mainColor,
                          unSelectedColor: themeProvider.isDarkMode()
                              ? AppColors.transParent
                              : AppColors.white,
                          selectedTextStyle: themeProvider.isDarkMode()
                              ? AppStyles.input16Medium
                              : AppStyles.whit16Medium,
                          unSelectedTextStyle: themeProvider.isDarkMode()
                              ? AppStyles.whit16Medium
                              : AppStyles.input16Medium,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: height * 0.02);
                  },
                  itemCount: eventsNameList.length,
                ),
              ),
            ),
            Text('title', style: Theme.of(context).textTheme.labelLarge).tr(),
            CustomTextFormField(hintText: 'event_title'),
            Text(
              'description',
              style: Theme.of(context).textTheme.labelLarge,
            ).tr(),
            CustomTextFormField(
              hintText: 'event_description....',
              maxLines: 7,
              minLines: 7,
            ),
            Row(
              spacing: width * 0.01,
              children: [
                Image.asset(
                  themeProvider.isDarkMode()
                      ? AppAssets.calendarIconDark
                      : AppAssets.calendarIconLight,
                ),
                Text(
                  'event_date',
                  style: Theme.of(context).textTheme.labelLarge,
                ).tr(),
                SizedBox(width: width * 0.3),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'choose_date',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
            Row(
              spacing: width * 0.01,
              children: [
                Image.asset(
                  themeProvider.isDarkMode()
                      ? AppAssets.calendarIconDark
                      : AppAssets.calendarIconLight,
                ),
                Text(
                  'event_time',
                  style: Theme.of(context).textTheme.labelLarge,
                ).tr(),
                SizedBox(width: width * 0.3),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'choose_time',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
            CustomElevatedButton(text: 'event_details', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
