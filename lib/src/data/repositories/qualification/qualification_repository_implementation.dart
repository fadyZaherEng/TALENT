import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/qualification/model/remote_qualification.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/qualification/qualification_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/qualification/qualification_repository.dart';

class QualificationRepositoryImplementation extends QualificationRepository {
  final QualificationApiService _qualificationApiService;

  QualificationRepositoryImplementation(this._qualificationApiService);

  @override
  Future<DataState<List<RequestType>>> qualification() async {
    try {
      TalentLinkHrRequest request =
          await TalentLinkHrRequest().createRequest({});

      final httpResponse =
          await _qualificationApiService.getQualificationList(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapQualificationToDomain(),
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
