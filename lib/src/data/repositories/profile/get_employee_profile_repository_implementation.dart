import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/profile/get_employee_profile_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/profile/model/remote_get_profile_employee.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/profile/request/get_employee_profile_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/profile/request/insert_attachment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/profile/profile_employee.dart';
import 'package:talent_link/src/domain/repositories/profile/get_profile_employee_repository.dart';

class GetEmployeeProfileRepositoryImplementation
    extends GetProfileEmployeeRepository {
  final GetEmployeeProfileApiService _getEmployeeProfileApiService;

  GetEmployeeProfileRepositoryImplementation(
      this._getEmployeeProfileApiService);

  @override
  Future<DataState<ProfileEmployee>> getProfileEmployee({
    required int employeeId,
  }) async {
    try {
      TalentLinkHrRequest<GetEmployeeProfileRequest> request =
          await TalentLinkHrRequest<GetEmployeeProfileRequest>()
              .createRequest(GetEmployeeProfileRequest(
        employeeId: employeeId,
      ));

      final httpResponse =
          await _getEmployeeProfileApiService.getProfileEmployee(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data.result?.mapToDomain(),
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
  Future<DataState<TalentLinkResponse>> insertAttachment({
    required InsertAttachmentRequest request,
    File? file,
  }) async {
    try {
      TalentLinkHrRequest<InsertAttachmentRequest> insertAttachment =
          await TalentLinkHrRequest<InsertAttachmentRequest>()
              .createRequest(request);
      late MultipartFile multipartFile;
      if (file!.path.isNotEmpty) {
        multipartFile = await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last.toString());
      }
      final httpResponse = await _getEmployeeProfileApiService.insertAttachment(
          jsonEncode(insertAttachment.toMap()),
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
}
