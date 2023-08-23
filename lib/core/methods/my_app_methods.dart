class MyAppMethods {
  static String getTime(String s) {
    DateTime dt = DateTime.parse(s);
    int hour = dt.hour;
    int minute = dt.minute;
    String time = "$hour:$minute";
    return time;
  }
}
