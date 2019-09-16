import 'package:flutter/material.dart';
import 'package:persian_calendar/widgets/calendar.dart';
import 'package:persian_calendar/model/calendar.dart' as calendar;

class CustomDialog extends StatefulWidget {
  String theDate;
  CustomDialog(String theDate);

  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Calendar(
            startingYear: 1390,
            startingMonth: 1,
            endingYear: 1400,
            endingMonth: 12,
          ),
          FlatButton(
            child: Text('انتخاب'),
            onPressed: () {
              setState(() {
                if (calendar.Calendar.day == null) {
                  widget.theDate = 'Choose a date :)';
                } else {
                  widget.theDate = (calendar.Calendar.day[0].toString() +
                      "/" +
                      calendar.Calendar.day[1].toString() +
                      "/" +
                      calendar.Calendar.day[2].toString());
                }
              });
              // Navigator.of(context).pop();
              Navigator.pop(context, widget.theDate);
            },
          ),
        ],
      ),
    );
  }
}
