extension DateTimeToString on num {
  String toTime() {
    var v = this;
    var duration = Duration(seconds: v.toInt());
    return duration.toString().split('.')[0];
  }
}
