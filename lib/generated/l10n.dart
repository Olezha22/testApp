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

  /// `Share`
  String get shareApp {
    return Intl.message(
      'Share',
      name: 'shareApp',
      desc: '',
      args: [],
    );
  }

  /// `Stopwatch`
  String get stopWatch {
    return Intl.message(
      'Stopwatch',
      name: 'stopWatch',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Actions`
  String get actions {
    return Intl.message(
      'Actions',
      name: 'actions',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Smth went wrong`
  String get error {
    return Intl.message(
      'Smth went wrong',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get reload {
    return Intl.message(
      'Refresh',
      name: 'reload',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Country Code`
  String get countryCode {
    return Intl.message(
      'Country Code',
      name: 'countryCode',
      desc: '',
      args: [],
    );
  }

  /// `Region`
  String get region {
    return Intl.message(
      'Region',
      name: 'region',
      desc: '',
      args: [],
    );
  }

  /// `Region Name`
  String get regionName {
    return Intl.message(
      'Region Name',
      name: 'regionName',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `zip`
  String get zip {
    return Intl.message(
      'zip',
      name: 'zip',
      desc: '',
      args: [],
    );
  }

  /// `lat`
  String get lat {
    return Intl.message(
      'lat',
      name: 'lat',
      desc: '',
      args: [],
    );
  }

  /// `lon`
  String get lon {
    return Intl.message(
      'lon',
      name: 'lon',
      desc: '',
      args: [],
    );
  }

  /// `timezone`
  String get timezone {
    return Intl.message(
      'timezone',
      name: 'timezone',
      desc: '',
      args: [],
    );
  }

  /// `isp`
  String get isp {
    return Intl.message(
      'isp',
      name: 'isp',
      desc: '',
      args: [],
    );
  }

  /// `org`
  String get org {
    return Intl.message(
      'org',
      name: 'org',
      desc: '',
      args: [],
    );
  }

  /// `as`
  String get as {
    return Intl.message(
      'as',
      name: 'as',
      desc: '',
      args: [],
    );
  }

  /// `Ip address`
  String get ipAddress {
    return Intl.message(
      'Ip address',
      name: 'ipAddress',
      desc: '',
      args: [],
    );
  }

  /// `Rate App`
  String get rateApp {
    return Intl.message(
      'Rate App',
      name: 'rateApp',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `We are sharing text`
  String get sharedText {
    return Intl.message(
      'We are sharing text',
      name: 'sharedText',
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
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'uk'),
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
