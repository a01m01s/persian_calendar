import 'package:flutter/material.dart';
import 'package:persian_calendar/widgets/calendaritem.dart';
import 'package:persian_calendar/widgets/convertor.dart' show getDay;

class CalendarTable extends StatelessWidget {
  final int month, year;
  final List<int> today;
  CalendarTable({this.month, this.year, this.today});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 30.0),
      height: 270,
      decoration: BoxDecoration(
        color: Color(0xFF36454F),
        borderRadius: BorderRadius.circular(10.0),
      ),
      // child: Text(date.toString()),
      child: GridView.builder(
        padding: EdgeInsets.all(1.0),
        itemCount:
            getItemCount(getDaysOfAMonth(month, year), getDay(year, month, 1)) +
                1 +
                7,
        itemBuilder: (ctx, i) =>
            CalendarItem(i, getDay(year, month, 1) + 7, month, year, today),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}

int getDaysOfAMonth(int month, int year) {
  List<int> g = [1, 5, 9, 13, 17, 22, 26, 30];
  if (month <= 6) {
    return 31;
  } else if (month == 12) {
    int re = year % 33;
    for (int i = 0; i < g.length; i++) {
      if (re == g[i]) {
        return 30;
      }
    }
    return 29;
  } else {
    return 30;
  }
}

int getItemCount(int days, int startingDay) {
  return days + startingDay;
}
