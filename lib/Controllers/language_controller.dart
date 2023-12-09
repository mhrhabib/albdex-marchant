import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Models/language_model.dart';

class LanguageController extends GetxController {
  final box = GetStorage();

   List<Language> languageList = [
    Language(
      langName: 'English',
      locale: const Locale('en', 'US'),
    ),
     Language(
      langName: 'Spanish',
      locale: const Locale('es', 'SV'),
    ),
    Language(
      langName: 'Bangla',
      locale: const Locale('bn', 'BD'),
    ),
    Language(
      langName: 'हिन्दी',
      locale: const Locale('hi', 'IN'),
    ),
    Language(
      langName: 'عربي',
      locale: const Locale('ar', 'AR'),
    )
  ];

  changeLanguage(String value) {
    if (value == "en") {
      box.write('lang', value);
      box.write('langKey', 'US');
      box.write('selectedValue', 'English');
      Get.updateLocale(const Locale('en', 'US'));
      update();
    } else if (value == "bn") {
      box.write('lang', value);
      box.write('langKey', 'BD');
      box.write('selectedValue', 'Bangla');
      Get.updateLocale(const Locale('bn', 'BD'));
      update();
    } else if (value == "es") {
      box.write('lang', value);
      box.write('langKey', 'SV');
      box.write('selectedValue', 'Spanish');
      Get.updateLocale(const Locale('es', 'SV'));
      update();
    } else if (value == "hi") {
      box.write('lang', value);
      box.write('langKey', 'IN');
      box.write('selectedValue', 'हिन्दी');
      Get.updateLocale(const Locale('hi', 'IN'));
      update();
    }  else if (value == "ar") {
      box.write('lang', value);
      box.write('langKey', 'SA');
      box.write('selectedValue', 'عربي');
      Get.updateLocale(const Locale('ar', 'AR'));
      update();
    }
  }
}
