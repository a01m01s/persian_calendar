library persian_calendar;

import 'package:flutter/material.dart';
import 'package:persian_calendar/widgets/calendar.dart';
import 'package:persian_calendar/model/calendar.dart' as calendar;

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
  String theDate = 'Choose a date :)';
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
      child: Text(theDate),
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
                // FlatButton(
                //   child: Text('انصراف'),
                //   onPressed: () {
                //     Navigator.of(context).pop();
                //   },
                // ),
                FlatButton(
                  child: Text('انتخاب'),
                  onPressed: () {
                    setState(() {
                      if (calendar.Calendar.day == null) {
                        theDate = 'Choose a date :)';
                      } else {
                        theDate = (calendar.Calendar.day[0].toString() +
                            "/" +
                            calendar.Calendar.day[1].toString() +
                            "/" +
                            calendar.Calendar.day[2].toString());
                      }
                    });
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
