import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/indemnity_encashment_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/model/remote_calculate_in_case_indemnity_encashment.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/model/remote_get_employee_indemnity_encashment_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/request/calculate_in_case_indemnity_encashment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/request/get_employee_indemnity_encashment_details_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/request/insert_indemnity_encashment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/requests/indemnity_encashment/indemnity_encashment_repository.dart';

class IndemnityEncashmentRepositoryImplementation
    extends IndemnityEncashmentRepository {
  final IndemnityEncashmentApiService _indemnityEncashmentApiService;

  IndemnityEncashmentRepositoryImplementation(
      this._indemnityEncashmentApiService);

  @override
  Future<DataState<TalentLinkResponse>> insertIndemnityEncashment(
      {required InsertIndemnityEncashmentRequest request, File? file}) async {
    try {
      TalentLinkHrRequest<InsertIndemnityEncashmentRequest>
          insertIndemnityEncashmentRequest =
          await TalentLinkHrRequest<InsertIndemnityEncashmentRequest>()
              .createRequest(request);
      late MultipartFile multipartFile;
      if (file!.path.isNotEmpty) {
        multipartFile = await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last.toString());
      }

      final httpResponse =
          await _indemnityEncashmentApiService.insertIndemnityEncashment(
              jsonEncode(insertIndemnityEncashmentRequest.toMap()),
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
  Future<DataState<List<RemoteGetEmployeeIndemnityEncashmentDetails>>>
      getIndemnityEmployee(
          GetEmployeeIndemnityEncashmentDetailsRequest request) async {
    try {
      TalentLinkHrRequest<GetEmployeeIndemnityEncashmentDetailsRequest>
          getIndemnityEmployeeRequest = await TalentLinkHrRequest<
                  GetEmployeeIndemnityEncashmentDetailsRequest>()
              .createRequest(request);

      final httpResponse = await _indemnityEncashmentApiService
          .getEmployeeIndemnityEncashmentDetails(getIndemnityEmployeeRequest);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? [])
              .mapEmployeeIndemnityEncashmentDetailsToDomain(),
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
  Future<
          DataState<
              TalentLinkResponse<RemoteCalculateInCaseIndemnityEncashment>>>
      calculateInCaseIndemnity({
    required CalculateInCaseIndemnityEncashmentRequest request,
  }) async {
    try {
      TalentLinkHrRequest<CalculateInCaseIndemnityEncashmentRequest>
          calculateInCaseNewLeaveRequest =
          await TalentLinkHrRequest<CalculateInCaseIndemnityEncashmentRequest>()
              .createRequest(request);
      final httpResponse = await _indemnityEncashmentApiService
          .calculateInCaseIndemnity(calculateInCaseNewLeaveRequest);

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
