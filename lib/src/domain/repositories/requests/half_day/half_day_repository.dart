import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/model/remote_calculate_in_case_half_day_leave.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/request/calculate_in_case_half_day_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/request/insert_half_day_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

abstract class HalfDayRepository {
  Future<DataState<List<RequestType>>> halfDayTypes(int employeeId);

  Future<DataState<TalentLinkResponse>> insertHalfDayLeave({
    required InsertHalfDayLeaveRequest request,
    File? file,
  });

  Future<DataState<RemoteCalculateInCaseHalfDayLeave>> calculateInCaseHalfDay(
    CalculateInCaseHalfDayLeaveRequest calculateInCaseHalfDayLeaveRequest,
  );
}
