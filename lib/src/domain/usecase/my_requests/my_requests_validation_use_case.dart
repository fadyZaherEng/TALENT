import 'package:talent_link/src/core/utils/validation/my_requests_filter_validator.dart';

class MyRequestsValidationUseCase {
  List<MyRequestsFilterValidationState> validateFormUseCase({
    required String fromRequestDate,
    required String toRequestDate,
    required String fromCreatedDate,
    required String toCreatedDate,
  }) {
    List<MyRequestsFilterValidationState> validations =
        List.empty(growable: true);
    MyRequestsFilterValidationState validation;

    validation =
        validateFromRequestDate(fromRequestDate.trim(), toRequestDate.trim());
    if (validation != MyRequestsFilterValidationState.valid) {
      validations.add(validation);
    }

    validation =
        validateToRequestDate(toRequestDate.trim(), fromRequestDate.trim());
    if (validation != MyRequestsFilterValidationState.valid) {
      validations.add(validation);
    }

    validation =
        validateFromCreatedDate(fromCreatedDate.trim(), toCreatedDate.trim());
    if (validation != MyRequestsFilterValidationState.valid) {
      validations.add(validation);
    }

    validation =
        validateToCreatedDate(toCreatedDate.trim(), fromCreatedDate.trim());
    if (validation != MyRequestsFilterValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  MyRequestsFilterValidationState validateFromRequestDate(
      String fromRequestDate, String toRequestDate) {
    return MyRequestsFilterValidator.validateFromRequestDate(
      fromRequestDate,
      toRequestDate,
    );
  }

  MyRequestsFilterValidationState validateToRequestDate(
      String toRequestDate, String fromRequestDate) {
    return MyRequestsFilterValidator.validateToRequestDate(
      toRequestDate,
      fromRequestDate,
    );
  }

  MyRequestsFilterValidationState validateFromCreatedDate(
      String fromCreatedDate, String toCreatedDate) {
    return MyRequestsFilterValidator.validateFromCreatedDate(
      fromCreatedDate,
      toCreatedDate,
    );
  }

  MyRequestsFilterValidationState validateToCreatedDate(
      String toCreatedDate, String fromCreatedDate) {
    return MyRequestsFilterValidator.validateToCreatedDate(
      toCreatedDate,
      fromCreatedDate,
    );
  }
}
