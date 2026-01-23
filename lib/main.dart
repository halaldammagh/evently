import 'package:easy_localization/easy_localization.dart';
import 'package:evently/auth/login/create_your_account_screen.dart';
import 'package:evently/auth/login/forget_pass_screen.dart';
import 'package:evently/auth/login/login_screen.dart';
import 'package:evently/home/add_event_screen.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/intro_screen.dart';
import 'package:evently/providers/app_language_provider.dart';
import 'package:evently/providers/app_theme_provider.dart';
import 'package:evently/start_screen.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
      EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        saveLocale: true,

        //  يحفظ اللغة المختارة حتى بعد إغلاق التطبيق
        child: MultiProvider(providers: [
          ChangeNotifierProvider(create: (context) => AppLanguageProvider(),),
          ChangeNotifierProvider(create: (context) => AppThemeProvider())
        ],
            child: const MyApp()),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      // localeResolutionCallback: (deviceLocale, supportedLocales) {
      //   return context.locale; //  هذا السطر هو الحل
      // },
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
      title: 'Evently',
      initialRoute: AppRoutes.startScreenRoute,
      routes: {
        AppRoutes.startScreenRoute: (context) => StartScreen(),
        AppRoutes.introScreenRoute: (context) => IntroScreen(),
        AppRoutes.loginRoute: (context) => LoginScreen(),
        AppRoutes.newAccountRoute: (context) => CreateYourAccountScreen(),
        AppRoutes.forgetPassRoute: (context) => ForgetPassScreen(),
        AppRoutes.homeScreenRoute: (context) => HomeScreen(),
        AppRoutes.addEventRoute: (context) => AddEventScreen(),
      },
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}
