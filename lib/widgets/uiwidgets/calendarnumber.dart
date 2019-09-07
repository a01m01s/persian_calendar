import 'package:flutter/material.dart';
import 'package:persian_calendar/model/calendar.dart' as calendar;

class CalendarNumber extends StatefulWidget {
  final int index;
  final int startingDay;
  final int month;
  final int year;
  final bool isToday;
  CalendarNumber(
      this.index, this.startingDay, this.month, this.year, this.isToday);

  _CalendarNumberState createState() =>
      _CalendarNumberState(index, startingDay, month, year, isToday);
}

class _CalendarNumberState extends State<CalendarNumber> {
  final int index;
  final int startingDay;
  final int month;
  final int year;
  final bool isToday;
  Color myColor = Colors.white70;
  _CalendarNumberState(
      this.index, this.startingDay, this.month, this.year, this.isToday);

  @override
  void initState() {
    super.initState();
    if (isToday) {
      myColor = Color(0xFF00DFD4);
    }
    // print(year.toString() +
    //     "/" +
    //     month.toString() +
    //     "/" +
    //     (index - startingDay).toString());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          (index - startingDay).toString(),
          style: TextStyle(color: myColor, fontWeight: FontWeight.w700),
        ),
        height: 120,
      ),
      onTap: () {
        setState(() {
          if (calendar.Calendar.check == 0) {
            myColor = Colors.red;
            calendar.Calendar.check += 1;
            calendar.Calendar.day = [year, month, (index - startingDay)];
            // print('selected day is:' +
            //     calendar.Calendar.day[0].toString() +
            //     "/" +
            //     calendar.Calendar.day[1].toString() +
            //     "/" +
            //     calendar.Calendar.day[2].toString());
          }
        });
      },
      onDoubleTap: () {
        setState(() {
          if (calendar.Calendar.day[0] == year &&
              calendar.Calendar.day[1] == month &&
              calendar.Calendar.day[2] == (index - startingDay)) {
            calendar.Calendar.check -= 1;
            if (isToday) {
              myColor = Color(0xFF00DFD4);
            } else {
              myColor = Colors.white70;
            }
          }
        });
      },
    );
  }
}
