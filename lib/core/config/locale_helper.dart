import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class LocaleHelper {
  static Future<void> switchLocale(BuildContext context) async {
    final newLocale = context.locale == Locale("ar")
        ? Locale("en")
        : Locale("ar");

    await context.setLocale(newLocale);
  }

  static Future<bool> isArabic(BuildContext context) async {
    return context.locale == Locale("ar");
  }
}
