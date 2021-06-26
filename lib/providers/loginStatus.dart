import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginStatusNotifier with ChangeNotifier{
  String _account;
  String get account => _account;
  String _password;
  String get password => _password;
  bool _loginStatus = false;
  bool get loginStatus => _loginStatus;

  Future<void> getAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var account = prefs.getString('account');
    print(account);
    if(account != null){_loginStatus = true;}
    notifyListeners();
  }

  Future<void> saveAccount({@required String account,@required String password,}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _loginStatus = await prefs.setString('account', account);
    prefs.setString('password', password);
    _account=account;
    _password=password;
    print(_account);
    print(_password);
    print(_loginStatus);
    notifyListeners();
  }

  Future<void> removeAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('account');
    prefs.remove('password');
    _account=prefs.getString('account');
    _password=prefs.getString('password');
    _loginStatus = false;
    print('log out');
    print(_account);
    print(_password);
    notifyListeners();
  }
}