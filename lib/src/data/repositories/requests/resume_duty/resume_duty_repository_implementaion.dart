import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/model/remote_calculate_in_case_resume_duty.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/model/remote_resume_duty_reference_data.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/model/remote_resume_duty_reference_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/calculate_in_case_resume_duty_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/insert_resume_duty_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/resume_duty_reference_data_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/resume_duty_reference_types_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/resume_duty_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/requests/resume_duty/resume_duty_repository.dart';

class ResumeDutyRepositoryImplementation extends ResumeDutyRepository {
  final ResumeDutyApiService _resumeDutyApiService;

  ResumeDutyRepositoryImplementation(this._resumeDutyApiService);

  @override
  Future<DataState<List<RequestType>>> resumeDutyReferenceTypes() async {
    try {
      TalentLinkHrRequest<ResumeDutyReferenceTypesRequest> request =
          await TalentLinkHrRequest<ResumeDutyReferenceTypesRequest>()
              .createRequest(ResumeDutyReferenceTypesRequest());

      final httpResponse =
          await _resumeDutyApiService.resumeDutyReferenceTypes(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? [])
              .mapResumeDutyReferenceTypesToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<RequestType>> resumeDutyReferenceData(
      {required ResumeDutyReferenceDataRequest referenceDataRequest}) async {
    try {
      TalentLinkHrRequest<ResumeDutyReferenceDataRequest> request =
          await TalentLinkHrRequest<ResumeDutyReferenceDataRequest>()
              .createRequest(referenceDataRequest);

      final httpResponse =
          await _resumeDutyApiService.resumeDutyReferenceData(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result!.mapToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<TalentLinkResponse>> insertResumeDuty({
    required InsertResumeDutyRequest request,
    File? file,
  }) async {
    try {
      TalentLinkHrRequest<InsertResumeDutyRequest> insertLeaveRequest =
          await TalentLinkHrRequest<InsertResumeDutyRequest>()
              .createRequest(request);

      late MultipartFile multipartFile;
      if (file!.path.isNotEmpty && file.path.isNotEmpty) {
        multipartFile = await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last.toString());
      }

      final httpResponse = await _resumeDutyApiService.insertResumeDuty(
          jsonEncode(insertLeaveRequest.toMap()),
          file.path.isNotEmpty ? [multipartFile] : []);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data,
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<TalentLinkResponse<RemoteCalculateInCaseResumeDuty>>>
      calculateInCaseResumeDuty(
          {required CalculateInCaseResumeDutyRequest
              caseResumeDutyRequest}) async {
    try {
      TalentLinkHrRequest<CalculateInCaseResumeDutyRequest>
          calculateInCaseResume =
          await TalentLinkHrRequest<CalculateInCaseResumeDutyRequest>()
              .createRequest(caseResumeDutyRequest);
      final httpResponse = await _resumeDutyApiService
          .calculateInCaseResumeDuty(calculateInCaseResume);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data,
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }
}
