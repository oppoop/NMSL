import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flustars/flustars.dart';

class LanguageProvider with ChangeNotifier {
  String? _language;

  String? get language => _language;

  void changeMode(String language) async {
    _language = language;
    notifyListeners();
    SpUtil.putString("language", language);
  }
}