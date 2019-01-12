import 'package:advent_calendar/providers/translate.provider.dart';
import 'package:advent_calendar/routes.dart';
import 'package:advent_calendar/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(AdventCalendarApp());
}

class AdventCalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advent Calendar',
      theme: christmasTheme,
      routes: Routes.get(),
      home: Routes.getHome(),
      localizationsDelegates: [
        TranslateDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', '')
      ]
    );
  }
}
