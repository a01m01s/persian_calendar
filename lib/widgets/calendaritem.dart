import 'package:flutter/material.dart';
import 'package:persian_calendar/widgets/uiwidgets/calendarnumber.dart';

class CalendarItem extends StatelessWidget {
  final int index, startingDay, month, year;
  final List<int> today;
  CalendarItem(this.index, this.startingDay, this.month, this.year, this.today);

  @override
  Widget build(BuildContext context) {
    return
        // borderRadius: BorderRadius.circular(10),
        GridTile(
      child: realIndex(index, startingDay, today, month, year),
      //   child: GestureDetector(
      //   child: Container(child: Icon(Icons.assistant),height: 120,),
      // ),
    );
  }
}

Widget realIndex(
    int index, int startingDay, List<int> today, int month, int year) {
  final List<String> days = [
    "شنبه",
    "یکشنبه",
    "دوشنبه",
    "سه شنبه",
    "چهارشنبه",
    "پنج شنبه",
    "جمعه"
  ];
  if (index <= startingDay) {
    if (index >= 0 && index < 7) {
      return Text(
        days[index],
        style: TextStyle(color: Colors.amber[400], fontSize: 13.0),
      );
    }
    // print("index- "+index.toString());
    return GestureDetector(
        child: Container(
      child: Icon(
        Icons.close,
        color: Colors.amber[400],
      ),
      height: 120,
    ));
  } else {
    if ((index - startingDay) == today[2] &&
        month == today[1] &&
        year == today[0]) {
      // print('selected day is:' +
      //     year.toString() +
      //     "/" +
      //     month.toString() +
      //     "/" +
      //     (index - startingDay).toString());
      return CalendarNumber(index, startingDay, month, year, true);
    } else {
      // print('selected day is:' +
      //     year.toString() +
      //     "/" +
      //     month.toString() +
      //     "/" +
      //     (index - startingDay).toString());
      return CalendarNumber(index, startingDay, month, year, false);
    }
  }
}
