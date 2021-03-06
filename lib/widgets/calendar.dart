import 'package:flutter/material.dart';
import 'package:persian_calendar/widgets/convertor.dart';
import 'package:persian_calendar/widgets/calendartable.dart';

class Calendar extends StatefulWidget {
  final int startingYear;
  final int startingMonth;
  final int endingYear;
  final int endingMonth;
  Calendar({
    @required this.startingYear,
    @required this.startingMonth,
    @required this.endingYear,
    @required this.endingMonth,
  });

  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  final List<String> months = [
    "فروردین",
    "اردیبهشت",
    "خرداد",
    "تیر",
    "مرداد",
    "شهریور",
    "مهر",
    "آبان",
    "آذر",
    "دی",
    "بهمن",
    "اسفند"
  ];
  final List<String> days = [
    "شنبه",
    "یکشنبه",
    "دوشنبه",
    "سه شنبه",
    "چهارشنبه",
    "پنج شنبه",
    "جمعه"
  ];
  final List<Map<int, int>> thePath = List();
  final DateTime now = DateTime.now();
  List<int> today;
  int index;
  int currentYear;

  @override
  void initState() {
    super.initState();
    // sOfMonths=(12-startingMonth+1)+endingMonth+(endingYear-startingYear-1)*12;
    today = gregorianToJalali(now.year, now.month, now.day);
    currentYear = widget.startingYear;
    for (int i = widget.startingMonth;
        i <= (12 - widget.startingMonth + 1);
        i++) {
      thePath.add({currentYear: i});
    }
    if (widget.endingYear - widget.startingYear > 1) {
      currentYear += 1;
      for (int i = currentYear; i < widget.endingYear; i++) {
        for (int j = 1; j <= 12; j++) {
          thePath.add({i: j});
        }
      }
    }
    for (int i = 1; i <= widget.endingMonth; i++) {
      thePath.add({widget.endingYear: i});
    }
    index = 0;
    // initialize the index based on today
    for (int i = 0; i < thePath.length; i++) {
      if (thePath[i].keys.elementAt(0) == today[0] &&
          thePath[i].values.elementAt(0) == today[1]) {
        index = i;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListBody(
      // padding: EdgeInsets.all(8.0),
      children: <Widget>[
        _createYearAndMonthRow(),
        CalendarTable(
          month: thePath[index].values.elementAt(0),
          year: thePath[index].keys.elementAt(0),
          today: today,
        ),
        // SizedBox(height: 100.0),
      ],
    );
  }

  Widget _createYearAndMonthRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          thePath[index].keys.elementAt(0).toString(),
          style: TextStyle(fontSize: 25, color: Colors.black54),
        ),
        IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF36454F)),
          onPressed: () {
            setState(() {
              if (index > 0) {
                index--;
              }
            });
          },
        ),
        Text(
          months[thePath[index].values.elementAt(0) - 1],
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
        IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF36454F),
          ),
          onPressed: () {
            setState(() {
              if (index < thePath.length - 1) {
                index++;
              }
            });
          },
        ),
      ],
    );
  }
}
