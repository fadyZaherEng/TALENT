import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/education/education_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/education/request/insert_education_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/education/education_repository.dart';

class EducationRepositoryImplementation extends EducationRepository {
  final EducationApiService _apiService;

  EducationRepositoryImplementation(this._apiService);

  @override
  Future<DataState<TalentLinkResponse>> insertEducation({
    required InsertEducationRequest request,
    File? file,
  }) async {
    try {
      TalentLinkHrRequest<InsertEducationRequest> insertEducationRequest =
          await TalentLinkHrRequest<InsertEducationRequest>()
              .createRequest(request);
      late MultipartFile multipartFile;
      if (file!.path.isNotEmpty) {
        multipartFile = await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last.toString());
      }

      final httpResponse = await _apiService.insertEducation(
          jsonEncode(insertEducationRequest.toMap()),
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
