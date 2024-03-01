import 'package:intl/intl.dart';

class MyRequestsFilterValidator {
  static MyRequestsFilterValidationState validateFromRequestDate(
      String fromRequestDate, String toRequestDate) {
    if (fromRequestDate.isEmpty) {
      return MyRequestsFilterValidationState.fromRequestDateEmpty;
    } else {
      if (toRequestDate.isNotEmpty) {
        final format = DateFormat('yyyy-MM-dd', "en");
        final startDateDateTime = format.parse(fromRequestDate);
        final endDateDateTime = format.parse(toRequestDate);
        if (startDateDateTime.isAfter(endDateDateTime)) {
          return MyRequestsFilterValidationState.fromRequestDateNotValid;
        }
      }

      return MyRequestsFilterValidationState.valid;
    }
  }

  static MyRequestsFilterValidationState validateToRequestDate(
      String toRequestDat, String fromRequestDate) {
    if (toRequestDat.isEmpty) {
      return MyRequestsFilterValidationState.toRequestDateEmpty;
    } else {
      if (fromRequestDate.isNotEmpty) {
        final format = DateFormat('yyyy-MM-dd', "en");
        final endDateDateTime = format.parse(toRequestDat);
        final startDateDateTime = format.parse(fromRequestDate);
        if (endDateDateTime.isBefore(startDateDateTime)) {
          return MyRequestsFilterValidationState.toRequestDateNotValid;
        }
      }
      return MyRequestsFilterValidationState.valid;
    }
  }

  static MyRequestsFilterValidationState validateFromCreatedDate(
      String fromCreatedDate, String toCreatedDate) {
    if (fromCreatedDate.isEmpty) {
      return MyRequestsFilterValidationState.fromCreatedDateEmpty;
    } else {
      if (toCreatedDate.isNotEmpty) {
        final format = DateFormat('yyyy-MM-dd' , "en");
        final startDateDateTime = format.parse(fromCreatedDate);
        final endDateDateTime = format.parse(toCreatedDate);
        if (startDateDateTime.isAfter(endDateDateTime)) {
          return MyRequestsFilterValidationState.fromCreatedDateNotValid;
        }
      }

      return MyRequestsFilterValidationState.valid;
    }
  }

  static MyRequestsFilterValidationState validateToCreatedDate(
      String toCreatedDate, String fromCreatedDate) {
    if (toCreatedDate.isEmpty) {
      return MyRequestsFilterValidationState.toCreatedDateEmpty;
    } else {
      if (fromCreatedDate.isNotEmpty) {
        final format = DateFormat('yyyy-MM-dd', "en");
        final endDateDateTime = format.parse(toCreatedDate);
        final startDateDateTime = format.parse(fromCreatedDate);
        if (endDateDateTime.isBefore(startDateDateTime)) {
          return MyRequestsFilterValidationState.toCreatedDateNotValid;
        }
      }
      return MyRequestsFilterValidationState.valid;
    }
  }
}

enum MyRequestsFilterValidationState {
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
