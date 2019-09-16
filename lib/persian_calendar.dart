library persian_calendar;

import 'package:flutter/material.dart';
import 'package:persian_calendar/widgets/uiwidgets/customdialog.dart';

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
  _PersianCalendarState createState() => _PersianCalendarState();
}

class _PersianCalendarState extends State<PersianCalendar> {
  String theDate = 'Choose a date :)';
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(theDate),
      onPressed: () {
        _navigateAndDisplayDialog(context);
      },
    );
  }

  _navigateAndDisplayDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
          theDate: theDate,
          startingYear: widget.startingYear,
          startingMonth: widget.startingMonth,
          endingYear: widget.endingYear,
          endingMonth: widget.endingMonth),
    );
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}
