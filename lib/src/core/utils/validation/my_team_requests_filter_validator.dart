import 'package:intl/intl.dart';

class MyTeamRequestsFilterValidator {
  static MyTeamRequestsFilterValidationState validateFromRequestDate(
      String fromRequestDate, String toRequestDate) {
    if (fromRequestDate.isEmpty) {
      return MyTeamRequestsFilterValidationState.fromRequestDateEmpty;
    } else {
      if (toRequestDate.isNotEmpty) {
        final format = DateFormat('yyyy-MM-dd', "en");
        final startDateDateTime = format.parse(fromRequestDate);
        final endDateDateTime = format.parse(toRequestDate);
        if (startDateDateTime.isAfter(endDateDateTime)) {
          return MyTeamRequestsFilterValidationState.fromRequestDateNotValid;
        }
      }

      return MyTeamRequestsFilterValidationState.valid;
    }
  }

  static MyTeamRequestsFilterValidationState validateToRequestDate(
      String toRequestDat, String fromRequestDate) {
    if (toRequestDat.isEmpty) {
      return MyTeamRequestsFilterValidationState.toRequestDateEmpty;
    } else {
      if (fromRequestDate.isNotEmpty) {
        final format = DateFormat('yyyy-MM-dd', "en");
        final endDateDateTime = format.parse(toRequestDat);
        final startDateDateTime = format.parse(fromRequestDate);
        if (endDateDateTime.isBefore(startDateDateTime)) {
          return MyTeamRequestsFilterValidationState.toRequestDateNotValid;
        }
      }
      return MyTeamRequestsFilterValidationState.valid;
    }
  }

  static MyTeamRequestsFilterValidationState validateFromCreatedDate(
      String fromCreatedDate, String toCreatedDate) {
    if (fromCreatedDate.isEmpty) {
      return MyTeamRequestsFilterValidationState.fromCreatedDateEmpty;
    } else {
      if (toCreatedDate.isNotEmpty) {
        final format = DateFormat('yyyy-MM-dd', "en");
        final startDateDateTime = format.parse(fromCreatedDate);
        final endDateDateTime = format.parse(toCreatedDate);
        if (startDateDateTime.isAfter(endDateDateTime)) {
          return MyTeamRequestsFilterValidationState.fromCreatedDateNotValid;
        }
      }

      return MyTeamRequestsFilterValidationState.valid;
    }
  }

  static MyTeamRequestsFilterValidationState validateToCreatedDate(
      String toCreatedDate, String fromCreatedDate) {
    if (toCreatedDate.isEmpty) {
      return MyTeamRequestsFilterValidationState.toCreatedDateEmpty;
    } else {
      if (fromCreatedDate.isNotEmpty) {
        final format = DateFormat('yyyy-MM-dd', "en");
        final endDateDateTime = format.parse(toCreatedDate);
        final startDateDateTime = format.parse(fromCreatedDate);
        if (endDateDateTime.isBefore(startDateDateTime)) {
          return MyTeamRequestsFilterValidationState.toCreatedDateNotValid;
        }
      }
      return MyTeamRequestsFilterValidationState.valid;
    }
  }
}

enum MyTeamRequestsFilterValidationState {
  fromRequestDateEmpty,
  toRequestDateEmpty,
  fromCreatedDateEmpty,
  toCreatedDateEmpty,
  fromRequestDateNotValid,
  toRequestDateNotValid,
  fromCreatedDateNotValid,
  toCreatedDateNotValid,
  valid,
}
