import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LanguageNotifier with ChangeNotifier {
  String _language;
  String get language => _language;
  Locale _locale;
  Locale get locale => _locale;
  Future<void> changeLanguage({@required String locale}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _language=locale;
    prefs.setString('language', locale);
    notifyListeners();
  }

  Future<void> setLanguageToDefault() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("language");
    notifyListeners();
  }

  Future<void> getLocale({@required String lang}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.get('language');
      if (lang == "zh_TW") {
        _locale = Locale('zh_TW');
      } else if (lang == "en") {
        _locale = Locale('en');
      }  else {
        if (value.isEmpty) {
          _locale = Locale('zh_TW');
        } else {
          _locale = Locale('$value');
        }
      }
  }
}