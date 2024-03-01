import 'package:talent_link/src/core/utils/validation/my_team_requests_filter_validator.dart';

class MyTeamRequestsValidationUseCase {
  List<MyTeamRequestsFilterValidationState> validateFormUseCase({
    required String fromRequestDate,
    required String toRequestDate,
    required String fromCreatedDate,
    required String toCreatedDate,
  }) {
    List<MyTeamRequestsFilterValidationState> validations =
        List.empty(growable: true);
    MyTeamRequestsFilterValidationState validation;

    validation =
        validateFromRequestDate(fromRequestDate.trim(), toRequestDate.trim());
    if (validation != MyTeamRequestsFilterValidationState.valid) {
      validations.add(validation);
    }

    validation =
        validateToRequestDate(toRequestDate.trim(), fromRequestDate.trim());
    if (validation != MyTeamRequestsFilterValidationState.valid) {
      validations.add(validation);
    }

    validation =
        validateFromCreatedDate(fromCreatedDate.trim(), toCreatedDate.trim());
    if (validation != MyTeamRequestsFilterValidationState.valid) {
      validations.add(validation);
    }

    validation =
        validateToCreatedDate(toCreatedDate.trim(), fromCreatedDate.trim());
    if (validation != MyTeamRequestsFilterValidationState.valid) {
      validations.add(validation);
    }

    return validations;
  }

  MyTeamRequestsFilterValidationState validateFromRequestDate(
      String fromRequestDate, String toRequestDate) {
    return MyTeamRequestsFilterValidator.validateFromRequestDate(
      fromRequestDate,
      toRequestDate,
    );
  }

  MyTeamRequestsFilterValidationState validateToRequestDate(
      String toRequestDate, String fromRequestDate) {
    return MyTeamRequestsFilterValidator.validateToRequestDate(
      toRequestDate,
      fromRequestDate,
    );
  }

  MyTeamRequestsFilterValidationState validateFromCreatedDate(
      String fromCreatedDate, String toCreatedDate) {
    return MyTeamRequestsFilterValidator.validateFromCreatedDate(
      fromCreatedDate,
      toCreatedDate,
    );
  }

  MyTeamRequestsFilterValidationState validateToCreatedDate(
      String toCreatedDate, String fromCreatedDate) {
    return MyTeamRequestsFilterValidator.validateToCreatedDate(
      toCreatedDate,
      fromCreatedDate,
    );
  }
}
