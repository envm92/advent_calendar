import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class Translate {
  Translate(this.locale);

  final Locale locale;

  static Translate of(BuildContext context) {
    return Localizations.of<Translate>(context, Translate);
  }

  static Map<String, Map<String,  Map<String, String>>> _localizedValues = {
    'en': {
      'home' : {
        'title'           : 'Advent Calendar',
        'today_date'      : 'Today\'s date'
      },
      'countdown' : {
        'days'            : 'days',
        'day'             : 'day',
      }
    },
    'es': {
      'home' : {
        'title'           : 'Calendario de adviento',
        'today_date'      : 'Hoy es'
      },
      'countdown' : {
        'days'            : 'días',
        'day'             : 'día'
      }
    },
  };

  String getMessage(String group, String key) {
    return _localizedValues[locale.languageCode][group][key];
  }

  String getLocation() {

    return locale.languageCode;
  }
}

class TranslateDelegate extends LocalizationsDelegate<Translate> {
  const TranslateDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<Translate> load(Locale locale) {
    return SynchronousFuture<Translate>(Translate(locale));
  }

  @override
  bool shouldReload(TranslateDelegate old) => false;
}