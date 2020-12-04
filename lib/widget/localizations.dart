import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  title() => Intl.message(
        'To-Do List',
        name: "title",
        desc: "Name of the App",
      );

  loading() => Intl.message('Loading', name: 'loading'
      //desc: "Display Loading",
      );

  loadData() => Intl.message(
        'Loading Data',
        name: 'loadData',
        desc: "Display Loading Data",
      );
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
