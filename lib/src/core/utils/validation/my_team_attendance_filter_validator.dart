import 'package:intl/intl.dart';

class MyTeamAttendanceFilterValidator {
  static MyTeamAttendanceFilterValidationState validateFromDate(
      String fromDate, String toDate) {
    if (fromDate.isEmpty) {
      return MyTeamAttendanceFilterValidationState.fromDateEmpty;
    } else {
      if (toDate.isNotEmpty) {
        final format = DateFormat('yyyy-MM-dd',"en");
        final startDateDateTime = format.parse(fromDate);
        final endDateDateTime = format.parse(toDate);
        if (startDateDateTime.isAfter(endDateDateTime)) {
          return MyTeamAttendanceFilterValidationState.fromDateNotValid;
        }
      }

      return MyTeamAttendanceFilterValidationState.valid;
    }
  }

  static MyTeamAttendanceFilterValidationState validateToDate(
      String toDate, String fromDate) {
    if (toDate.isEmpty) {
      return MyTeamAttendanceFilterValidationState.toDateEmpty;
    } else {
      if (fromDate.isNotEmpty) {
        final format = DateFormat('yyyy-MM-dd' , "en");
        final endDateDateTime = format.parse(toDate);
        final startDateDateTime = format.parse(fromDate);
        if (endDateDateTime.isBefore(startDateDateTime)) {
          return MyTeamAttendanceFilterValidationState.toDateNotValid;
        }
      }
      return MyTeamAttendanceFilterValidationState.valid;
    }
  }
}

enum MyTeamAttendanceFilterValidationState {
  fromDateEmpty,
  fromDateNotValid,
  toDateEmpty,
  toDateNotValid,
  valid,
}
