import 'package:advent_calendar/screens/home.screen.dart';
import 'package:flutter/material.dart';


class Routes {

  static get() {
    return <String, WidgetBuilder> {
      '/home' : (BuildContext context) => new Home()
    };
  }

  static getHome() {
    return new Home();
  }
}