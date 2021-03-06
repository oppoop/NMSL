// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `TEST`
  String get test {
    return Intl.message(
      'TEST',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Regist`
  String get regist {
    return Intl.message(
      'Regist',
      name: 'regist',
      desc: '',
      args: [],
    );
  }

  /// `Member Center`
  String get membercenter {
    return Intl.message(
      'Member Center',
      name: 'membercenter',
      desc: '',
      args: [],
    );
  }

  /// `Custom Service`
  String get customservice {
    return Intl.message(
      'Custom Service',
      name: 'customservice',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get languagechange {
    return Intl.message(
      'Change Language',
      name: 'languagechange',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the email`
  String get enteremail {
    return Intl.message(
      'Please enter the email',
      name: 'enteremail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the password`
  String get enterpassword {
    return Intl.message(
      'Please enter the password',
      name: 'enterpassword',
      desc: '',
      args: [],
    );
  }

  /// `Please re-enter the password`
  String get reenterpasswoed {
    return Intl.message(
      'Please re-enter the password',
      name: 'reenterpasswoed',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the phone numbre`
  String get enterphone {
    return Intl.message(
      'Please enter the phone numbre',
      name: 'enterphone',
      desc: '',
      args: [],
    );
  }

  /// `submit`
  String get submit {
    return Intl.message(
      'submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
