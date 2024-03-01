import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/model/remote_calculate_in_case_half_day_leave.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/request/calculate_in_case_half_day_leave_request.dart';
import 'package:talent_link/src/domain/repositories/requests/half_day/half_day_repository.dart';

class CalculateInCaseHalfDayUseCase {
  final HalfDayRepository _repository;

  CalculateInCaseHalfDayUseCase(this._repository);

  Future<DataState<RemoteCalculateInCaseHalfDayLeave>> call(
      CalculateInCaseHalfDayLeaveRequest
          calculateInCaseHalfDayLeaveRequest) async {
    return await _repository
        .calculateInCaseHalfDay(calculateInCaseHalfDayLeaveRequest);
  }
}
