import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/model/insert_short_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/model/remote_calculate_in_case_short_leave.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/short_leave/request/calculate_in_case_short_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

abstract class ShortLeaveRepository {
  Future<DataState<List<RequestType>>> shortLeaveTypes(int employeeId);

  Future<DataState<TalentLinkResponse>> insertShortLeave({
    required InsertShortLeaveRequest request,
    File? file,
  });

  Future<DataState<TalentLinkResponse<RemoteCalculateInCaseShortLeave>>>
      calculateInCaseShortLeave({
    required CalculateInCaseShortLeaveRequest calculateInCaseShortLeaveRequest,
  });
}
