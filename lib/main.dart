import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/auth/login/create_your_account_screen.dart';
import 'package:evently/auth/login/forget_pass_screen.dart';
import 'package:evently/auth/login/login_screen.dart';
import 'package:evently/home/add_event_screen.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/intro_screen.dart';
import 'package:evently/providers/app_language_provider.dart';
import 'package:evently/providers/app_theme_provider.dart';
import 'package:evently/providers/event_list_provider.dart';
import 'package:evently/start_screen.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,;
  await FirebaseFirestore.instance.disableNetwork();

  ////offline  هيكيش في ستورج التلفون بتاعنا
  final langProvider = AppLanguageProvider();
  final themeProvider = AppThemeProvider();
  final eventProvider = EventListProvider();
  await langProvider.loadLanguage();
  await themeProvider.loadTheme();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: Locale(langProvider.appLanguage),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => langProvider),
          ChangeNotifierProvider(create: (_) => themeProvider),
          ChangeNotifierProvider(create: (_) => eventProvider)
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

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
