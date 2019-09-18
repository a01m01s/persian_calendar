import 'package:flutter/material.dart';
import 'package:persian_calendar/model/calendar.dart' as calendar;

class CalendarNumber extends StatefulWidget {
  final int index;
  final int startingDay;
  final int month;
  final int year;
  final List<int> today;
  CalendarNumber(
      this.index, this.startingDay, this.month, this.year, this.today);

  _CalendarNumberState createState() => _CalendarNumberState();
}

class _CalendarNumberState extends State<CalendarNumber> {
  Color myColor = Colors.white70;

  @override
  void initState() {
    super.initState();
    if ((widget.index - widget.startingDay) == widget.today[2] &&
        widget.month == widget.today[1] &&
        widget.year == widget.today[0]) {
      myColor = Color(0xFF00DFD4);
    }
    if (calendar.Calendar.day != null) {
      if ((widget.index - widget.startingDay) == calendar.Calendar.day[2] &&
          widget.month == calendar.Calendar.day[1] &&
          widget.year == calendar.Calendar.day[0]) {
        myColor = Colors.red;
        print(widget.year.toString() +
            "/" +
            widget.month.toString() +
            "/" +
            (widget.index - widget.startingDay).toString());
      }
    }
    // TESTING::
    // print(widget.year.toString() +
    //     "/" +
    //     widget.month.toString() +
    //     "/" +
    //     (widget.index - widget.startingDay).toString());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          (widget.index - widget.startingDay).toString(),
          style: TextStyle(
              color: myColor, fontWeight: FontWeight.w700, fontSize: 17.0),
        ),
        height: 120,
      ),
      onTap: () {
        setState(() {
          if (calendar.Calendar.check == 0) {
            myColor = Colors.red;
            calendar.Calendar.check += 1;
            calendar.Calendar.day = [
              widget.year,
              widget.month,
              (widget.index - widget.startingDay)
            ];
            print('selected day is:' +
                calendar.Calendar.day[0].toString() +
                "/" +
                calendar.Calendar.day[1].toString() +
                "/" +
                calendar.Calendar.day[2].toString());
          }
        });
      },
      onDoubleTap: () {
        setState(() {
          if (calendar.Calendar.day[0] == widget.year &&
              calendar.Calendar.day[1] == widget.month &&
              calendar.Calendar.day[2] == (widget.index - widget.startingDay)) {
            calendar.Calendar.check -= 1;
            if ((widget.index - widget.startingDay) == widget.today[2] &&
                widget.month == widget.today[1] &&
                widget.year == widget.today[0]) {
              myColor = Color(0xFF00DFD4);
            } else {
              myColor = Colors.white70;
            }
            calendar.Calendar.day = null;
          }
        });
      },
    );
  }
}
