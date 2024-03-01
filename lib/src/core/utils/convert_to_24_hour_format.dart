import 'package:intl/intl.dart';

String convertTo24HourFormat(String time12Hour) {
  final dateFormat = DateFormat("h:mm a", "en");
  final parsedTime = dateFormat.parse(time12Hour);
  final formattedTime = DateFormat("HH:mm ", "en").format(parsedTime);
  return formattedTime;
}
