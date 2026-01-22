import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier {
  ///todo : data
  String appLanguage = 'en';

  Future<void> changeLanguage(BuildContext context, String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    await context.setLocale(Locale(newLanguage));

    notifyListeners();
  }

  bool isEnglish() {
    return appLanguage == 'en';
  }
}