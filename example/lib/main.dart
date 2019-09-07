import 'package:flutter/material.dart';
import 'package:persian_calendar/persian_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calendar",
      home: CalendarPage(),
    );
  }
}

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Icon(Icons.arrow_back),
      ),
      body: Container(
        child: PersianCalendar(
          startingYear: 1398,
          startingMonth: 1,
          endingYear: 1400,
          endingMonth: 5,
        ),
      ),
    );
  }
}
