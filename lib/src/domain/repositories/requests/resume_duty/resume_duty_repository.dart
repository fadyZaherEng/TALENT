import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/model/remote_calculate_in_case_resume_duty.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/calculate_in_case_resume_duty_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/insert_resume_duty_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/resume_duty_reference_data_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

abstract class ResumeDutyRepository {
  Future<DataState<List<RequestType>>> resumeDutyReferenceTypes();

  Future<DataState<RequestType>> resumeDutyReferenceData({
    required ResumeDutyReferenceDataRequest referenceDataRequest,
  });

  Future<DataState<TalentLinkResponse>> insertResumeDuty({
    required InsertResumeDutyRequest request,
    File? file,
  });

  Future<DataState<TalentLinkResponse<RemoteCalculateInCaseResumeDuty>>>
  calculateInCaseResumeDuty({
    required CalculateInCaseResumeDutyRequest caseResumeDutyRequest,
  });
}
