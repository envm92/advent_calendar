import 'dart:async';

import 'package:advent_calendar/providers/translate.provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Countdown extends StatefulWidget {

  DateTime date;

  Countdown(this.date);

  @override
  State<StatefulWidget> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {

  Timer _timer;
  DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), _onTimeChange);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onTimeChange(Timer timer) {
    setState(() {
      _currentTime = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> texts = [];
    final remaining = widget.date.difference(_currentTime);
    DateFormat format = DateFormat("mm:ss");
    final days = remaining.inDays;
    var hours = remaining.inHours - remaining.inDays * 24;
    if (days > 0) {
      texts.add(Text(
        '$days '+ Translate.of(context).getMessage('countdown', (days == 1)? 'day': 'days') ,
        style: Theme.of(context).textTheme.title.copyWith(
            fontWeight: FontWeight.bold
        )
      ));
    }
    texts.add(Text('$hours:${format.format(
        DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}',
        style: Theme.of(context).textTheme.headline.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor
        )));

    return Column(
      children: texts
    );
  }
}