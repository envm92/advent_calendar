import 'package:advent_calendar/providers/translate.provider.dart';
import 'package:advent_calendar/widgets/countdown.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var todayDate = new DateTime.now();
  var nextChristmas;
  var isChristmas = false;

  @override
  void initState() {
    nextChristmas = new DateTime(todayDate.year, 12, 24);
    if (nextChristmas.difference(todayDate).inDays < 0) {
      nextChristmas = new DateTime(todayDate.year + 1, 12, 24);
    }
    isChristmas = nextChristmas.difference(todayDate).inDays == 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var format = DateFormat.yMMMd(Translate.of(context).getLocation());
    return Scaffold(
      appBar: AppBar(
        title: Text(Translate.of(context).getMessage('home', 'title')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                Translate.of(context).getMessage('home', 'today_date')
            ),
            Text(
              format.format(todayDate),
            ),
            Countdown(nextChristmas)
          ],
        ),
      ),
    );
  }
}