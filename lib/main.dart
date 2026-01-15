import 'package:easy_localization/easy_localization.dart';
import 'package:evently/intro_screen.dart';
import 'package:flutter/material.dart';

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
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        return context.locale; // 👈 هذا السطر هو الحل
      },
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Evently',
      home: IntroScreen(),
    );
  }
}
