import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/half_day_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/model/remote_calculate_in_case_half_day_leave.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/model/remote_half_day_types.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/request/calculate_in_case_half_day_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/request/half_day_types_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/half_day/request/insert_half_day_leave_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import '../../../../domain/repositories/requests/half_day/half_day_repository.dart';

class HalfDayRepositoryImplementation extends HalfDayRepository {
  final HalfDayApiService _halfDayApiService;

  HalfDayRepositoryImplementation(this._halfDayApiService);

  @override
  Future<DataState<List<RequestType>>> halfDayTypes(int employeeId) async {
    try {
      TalentLinkHrRequest<HalfDayTypesRequest> request =
          await TalentLinkHrRequest<HalfDayTypesRequest>()
              .createRequest(HalfDayTypesRequest(employeeId: employeeId));

      final httpResponse = await _halfDayApiService.halfDayTypes(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapHalfDayTypesToDomain(),
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
  Future<DataState<TalentLinkResponse>> insertHalfDayLeave(
      {required InsertHalfDayLeaveRequest request, File? file}) async {
    try {
      TalentLinkHrRequest<InsertHalfDayLeaveRequest> insertHalfDayLeave =
          await TalentLinkHrRequest<InsertHalfDayLeaveRequest>()
              .createRequest(request);
      late MultipartFile multipartFile;
      if (file!.path.isNotEmpty && file.path.isNotEmpty) {
        multipartFile = await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last.toString());
      }
      final httpResponse = await _halfDayApiService.insertHalfDayLeave(
          jsonEncode(insertHalfDayLeave.toMap()),
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
  Future<DataState<RemoteCalculateInCaseHalfDayLeave>> calculateInCaseHalfDay(
      CalculateInCaseHalfDayLeaveRequest
          calculateInCaseHalfDayLeaveRequest) async {
    try {
      TalentLinkHrRequest<CalculateInCaseHalfDayLeaveRequest> request =
          await TalentLinkHrRequest<CalculateInCaseHalfDayLeaveRequest>()
              .createRequest(calculateInCaseHalfDayLeaveRequest);
      final httpResponse =
          await _halfDayApiService.calculateInCaseHalfDay(request);
      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result,
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
