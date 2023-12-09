import 'package:get/get_navigation/src/root/internacionalization.dart';
import '/Locale/spanish.dart';

import 'arabic.dart';
import 'bangla.dart';
import 'english.dart';
import 'hindi.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': english,
        'bn_BD': bangla,
        'ar_AR': arabic,
        'hi_IN': hindi,
        'es_SV': spanish,
      };
}
