List<int> gregorianToJalali(int gyear, int gmonth, int gday) {
  List gdm = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
  int jyear, jmonth, jday, newgregorianyear, days;
  if (gyear > 1600) {
    jyear = 979;
    gyear -= 1600;
  } else {
    jyear = 0;
    gyear -= 621;
  }

  if (gmonth > 2) {
    newgregorianyear = gyear + 1;
  } else {
    newgregorianyear = gyear;
  }

  days = (365 * gyear) +
      ((newgregorianyear + 3) ~/ 4) -
      ((newgregorianyear + 99) ~/ 100) +
      ((newgregorianyear + 399) ~/ 400) -
      80 +
      gday +
      gdm[gmonth - 1];

  jyear += 33 * (days ~/ 12053);

  days %= 12053;

  jyear += 4 * (days ~/ 1461);

  days %= 1461;

  if (days > 365) {
    jyear += ((days - 1) ~/ 365);
    days = (days - 1) % 365;
  }
  if (days < 186) {
    jmonth = 1 + (days ~/ 31);
    jday = 1 + (days % 31);
  } else {
    jmonth = 7 + ((days - 186) ~/ 30);
    jday = 1 + ((days - 186) % 30);
  }
  return [jyear, jmonth, jday];
}

List<int> jalaliToGregorian(int jyear, int jmonth, int jday) {
  int gyear, days, gday, kab, gmonth;
  List<int> salA;
  if (jyear > 979) {
    gyear = 1600;
    jyear -= 979;
  } else {
    gyear = 621;
  }

  if (jmonth < 7) {
    days = (jmonth - 1) * 31;
  } else {
    days = ((jmonth - 7) * 30) + 186;
  }

  days += (365 * jyear) +
      ((jyear ~/ 33) * 8) +
      (((jyear % 33) + 3) ~/ 4) +
      78 +
      jday;
  gyear += 400 * (days ~/ 146097);
  days %= 146097;
  if (days > 36524) {
    gyear += 100 * (--days ~/ 36524);
    days %= 36524;
    if (days >= 365) {
      days += 1;
    }
  }

  gyear += 4 * (days ~/ 1461);
  days %= 1461;

  if (days > 365) {
    gyear += (days - 1) ~/ 365;
    days = (days - 1) % 365;
  }
  gday = days + 1;
  if ((gyear % 4 == 0 && gyear % 100 != 0) || (gyear % 400 == 0)) {
    kab = 29;
  } else {
    kab = 28;
  }
  salA = [0, 31, kab, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  gmonth = 0;
  while (gmonth < 13) {
    int v = salA[gmonth];
    if (gday <= v) {
      break;
    }
    gday -= v;
    gmonth += 1;
  }
  return [gyear, gmonth, gday];
}

int getDay(int jyear, int jmonth, int jday) {
  List<int> G = jalaliToGregorian(jyear, jmonth, jday);
  DateTime time = DateTime(G[0], G[1], G[2]);
  // print(time.year.toString() +
  //     "-" +
  //     time.month.toString() +
  //     "-" +
  //     time.day.toString());
  var day = time.weekday;
  return day;
}
