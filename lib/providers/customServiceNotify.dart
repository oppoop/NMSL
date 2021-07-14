import 'package:flutter/cupertino.dart';

class customServiceNotify extends ChangeNotifier{
  String? _questionserrorMsg = '';
  String? get questionserrorMsg => _questionserrorMsg;

  bool? _questionsValid;
  bool? get questionsValid => _questionsValid;

  void questionsValiding({required String fiedValue}){
    if(fiedValue.length > 10){
      _questionsValid = true;
      _questionserrorMsg = '';
    }else{
      _questionsValid = false;
      _questionserrorMsg = '請最少輸入10個字';
    }
    notifyListeners();
}
}