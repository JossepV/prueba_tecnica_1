String getCurrentTimeString() {
  var now = DateTime.now();
  var hour = now.hour > 12 ? now.hour - 12 : (now.hour == 0 ? 12 : now.hour);
  var minute = now.minute < 10 ? '0${now.minute}' : now.minute.toString();
  var period = now.hour >= 12 ? 'pm' : 'am';
  return '$hour:$minute $period';
}
