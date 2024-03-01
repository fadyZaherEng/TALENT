import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/model/remote_calculate_in_case_indemnity_encashment.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/model/remote_get_employee_indemnity_encashment_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/request/calculate_in_case_indemnity_encashment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/request/get_employee_indemnity_encashment_details_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/request/insert_indemnity_encashment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

abstract class IndemnityEncashmentRepository {
  Future<DataState<TalentLinkResponse>> insertIndemnityEncashment({
    required InsertIndemnityEncashmentRequest request,
    File? file,
  });

  Future<DataState<List<RemoteGetEmployeeIndemnityEncashmentDetails>>>
      getIndemnityEmployee(
          GetEmployeeIndemnityEncashmentDetailsRequest request);

  Future<
          DataState<
              TalentLinkResponse<RemoteCalculateInCaseIndemnityEncashment>>>
      calculateInCaseIndemnity({
    required CalculateInCaseIndemnityEncashmentRequest request,
  });
}
