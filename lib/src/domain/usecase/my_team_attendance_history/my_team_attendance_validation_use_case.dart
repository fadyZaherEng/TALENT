import 'package:talent_link/src/core/utils/validation/my_team_attendance_filter_validator.dart';

class MyTeamAttendanceValidationUseCase {
  List<MyTeamAttendanceFilterValidationState> validateFormUseCase({
    required String fromDate,
    required String toDate,
  }) {
    List<MyTeamAttendanceFilterValidationState> validations =
        List.empty(growable: true);
    MyTeamAttendanceFilterValidationState validation;

    validation = validateFromDate(fromDate.trim(), toDate.trim());
    if (validation != MyTeamAttendanceFilterValidationState.valid) {
      validations.add(validation);
    }

    validation = validateToDate(toDate.trim(), fromDate.trim());
    if (validation != MyTeamAttendanceFilterValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  MyTeamAttendanceFilterValidationState validateFromDate(
      String fromDate, String toDate) {
    return MyTeamAttendanceFilterValidator.validateFromDate(
      fromDate,
      toDate,
    );
  }

  MyTeamAttendanceFilterValidationState validateToDate(
      String toDate, String fromDate) {
    return MyTeamAttendanceFilterValidator.validateToDate(
      toDate,
      fromDate,
    );
  }
}
