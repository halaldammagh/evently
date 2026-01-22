import 'package:easy_localization/easy_localization.dart';
import 'package:evently/providers/app_language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.04,
      ),
      child: Column(
        spacing: height * 0.04,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              //todo: change language to english
              languageProvider.changeLanguage(context, 'en');
            },
            child: languageProvider.isEnglish()
                ? getSelectedItemLanguage(language: 'english')
                : getUnSelectedItemLanguage(language: 'english'),
          ),
          InkWell(
            onTap: () {
              //todo: change language to arabic
              languageProvider.changeLanguage(context, 'ar');
            },
            child: languageProvider.isEnglish()
                ? getUnSelectedItemLanguage(language: 'arabic')
                : getSelectedItemLanguage(language: 'arabic'),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemLanguage({required String language}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(language).tr(), Icon(Icons.check)],
    );
  }

  Widget getUnSelectedItemLanguage({required String language}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(language).tr()],
    );
  }
}
