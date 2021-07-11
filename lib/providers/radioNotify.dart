import 'package:flutter/material.dart';

class RadioNotify with ChangeNotifier{
  String? _reportValue;
  String? get reportValue => _reportValue;

  void getReportType(@required value){
    if(value != null){
      value = _reportValue;
    }
  }
}