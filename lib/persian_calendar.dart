library persian_calendar;

import 'package:flutter/material.dart';
import 'package:persian_calendar/widgets/calendar.dart';

class PersianCalendar extends StatefulWidget {
  final int startingYear;
  final int startingMonth;
  final int endingYear;
  final int endingMonth;
  PersianCalendar({
    @required this.startingYear,
    @required this.startingMonth,
    @required this.endingYear,
    @required this.endingMonth,
  });

  _PersianCalendarState createState() => _PersianCalendarState(
      startingYear, startingMonth, endingYear, endingMonth);
}

class _PersianCalendarState extends State<PersianCalendar> {
  final int startingYear;
  final int startingMonth;
  final int endingYear;
  final int endingMonth;
  _PersianCalendarState(
    this.startingYear,
    this.startingMonth,
    this.endingYear,
    this.endingMonth,
  );
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('click on me!'),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: SingleChildScrollView(
                padding: EdgeInsets.all(1.0),
                child: Calendar(
                  startingYear: startingYear,
                  startingMonth: startingMonth,
                  endingYear: endingYear,
                  endingMonth: endingMonth,
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('انصراف'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('انتخاب'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
