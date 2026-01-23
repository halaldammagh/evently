import 'package:easy_localization/easy_localization.dart';
import 'package:evently/home/tabs/profile/widget/custom_elevated_button.dart';
import 'package:evently/providers/app_language_provider.dart';
import 'package:evently/providers/app_theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final GlobalKey<IntroductionScreenState> _introKey = GlobalKey();

  List<String> intro_text = ['intro2_text', 'intro3_text', 'intro4_text'];
  List<String> intro_title = ['intro2_title', 'intro3_title', 'intro4_title'];
  int index = 0;

  PageDecoration _pageDecoration() {
    return PageDecoration(
      imageFlex: 4,
      bodyFlex: 2,
      contentMargin: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      bodyPadding: const EdgeInsets.only(top: 12),
      imagePadding: const EdgeInsets.only(top: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final bool isLast = index == 2;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        // 👈 هذا السطر المهم هو الي بشيل السهم الي بنحط تلقائيا
        backgroundColor: AppColors.transParent,
        leadingWidth: languageProvider.isEnglish()
            ? width * 0.11
            : width * 0.17,

        leading: index == 0
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.only(
                  top: height * 0.012,
                  left: width * 0.04,
                  right: languageProvider.isEnglish()
                      ? width * 0
                      : width * 0.04,
                  bottom: height * 0.012,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.startScreenRoute);
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
        title: Image.asset(
          themeProvider.isDarkMode()
              ? AppAssets.eventlyDark
              : AppAssets.eventlyLight,
        ),
        actions: [
          index == 2
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.only(
                    right: 0.04 * width,
                    left: languageProvider.isEnglish()
                        ? width * 0
                        : width * 0.03,
                  ),
                  child: InkWell(
                    onTap: () {
                      _introKey.currentState?.animateScroll(
                        2,
                      ); // يروح للصفحة الثالثة
                    },
                    child: Container(
                      width: width * 0.13,
                      height: height * 0.03,
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
                      child: Text(
                        'skip',
                        style: themeProvider.isDarkMode()
                            ? AppStyles.white14Medium
                            : AppStyles.blue14Medium,
                        textAlign: TextAlign.center,
                      ).tr(),
                    ),
                  ),
                ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 500,
              child: IntroductionScreen(
                dotsDecorator: DotsDecorator(
                  size: const Size(8, 8),
                  activeSize: const Size(22, 8),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  spacing: const EdgeInsets.symmetric(horizontal: 4),
                  color: themeProvider.isDarkMode()
                      ? AppColors.white.withOpacity(0.35)
                      : Colors.black26,
                  activeColor: AppColors.mainColor,
                ),

                key: _introKey,
                globalBackgroundColor: AppColors.transParent,

                // مهم: كل ما تتغير الصفحة نحدّث index عشان السهم/الزر يتغيروا
                onChange: (p) {
                  setState(() {
                    index = p;
                  });
                },

                pages: [
                  PageViewModel(
                    bodyWidget: Image.asset(
                      themeProvider.isDarkMode()
                          ? AppAssets.intro2Dark
                          : AppAssets.intro2Light,
                    ),
                    title: "",
                    decoration: _pageDecoration(),
                    // image: Image.asset(
                    //   themeProvider.isDarkMode()
                    //       ? AppAssets.intro2Dark
                    //       : AppAssets.intro2Light,
                    //
                    //   width: double.infinity,
                    // ),
                  ),
                  PageViewModel(
                    decoration: _pageDecoration(),
                    title: "",
                    bodyWidget: Image.asset(
                      themeProvider.isDarkMode()
                          ? AppAssets.intro3Dark
                          : AppAssets.intro3Light,
                      width: double.infinity,
                    ),
                  ),
                  PageViewModel(
                    decoration: _pageDecoration(),
                    title: "",
                    bodyWidget: Image.asset(
                      themeProvider.isDarkMode()
                          ? AppAssets.intro4Dark
                          : AppAssets.intro4Light,
                      width: double.infinity,
                    ),
                  ),
                ],

                showNextButton: false,
                showDoneButton: false,
              ),
            ),
            Text(
              intro_title[index],
              style: Theme.of(context).textTheme.bodyLarge,
            ).tr(),
            Text(
              intro_text[index],
              style: Theme.of(context).textTheme.bodyMedium,
            ).tr(),
            SizedBox(height: 20,),

            CustomElevatedButton(
              text: isLast ? 'get_started'.tr() : 'next'.tr(),
              onPressed: () {
                if (!isLast) {
                  _introKey.currentState?.next();
                } else {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(AppRoutes.loginRoute);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
