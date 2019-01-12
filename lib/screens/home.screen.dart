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
    var format = DateFormat.MMMM(Translate.of(context).getLocation());
    return Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: 150,
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: new Container(
                      padding: new EdgeInsets.only(left: 8.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          new Text(
                            Translate.of(context).getMessage('home',
                                (isChristmas) ? 'isChristmas' : 'isNotChristmas'),
                            style: Theme
                                .of(context)
                                .textTheme
                                .title
                                .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text(
                                todayDate.year.toString(),
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .subtitle
                                    .copyWith(
                                    color: Theme
                                        .of(context)
                                        .accentColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              Text(
                                '${format.format(todayDate)[0]
                                    .toUpperCase()}${format.format(todayDate)
                                    .substring(1)}',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .title
                                    .copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(todayDate.day.toString(),
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline
                                      .copyWith(fontSize: 45))
                            ],
                          ),
                          foregroundDecoration: BoxDecoration(
                              color: Color.fromRGBO(228, 182, 100, 0.54),
                              borderRadius:
                              new BorderRadius.all(Radius.circular(20.0))),
                          transform: Matrix4.rotationZ(0.1),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Countdown(nextChristmas),
              )
            )
          ],
        )
    );
  }

}
