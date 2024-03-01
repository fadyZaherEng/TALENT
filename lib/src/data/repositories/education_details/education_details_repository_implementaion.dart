import 'package:dio/dio.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/education_details/education_details_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/education_details/request/get_education_details_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/education_details/response/remote_get_education_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/education_details/education_details.dart';
import 'package:talent_link/src/domain/repositories/education_details/education_details_repository.dart';

class EducationDetailsRepositoryImplementation
    extends EducationDetailsRepository {
  final EducationDetailsApiService _apiService;

  EducationDetailsRepositoryImplementation(this._apiService);

  @override
  Future<DataState<EducationDetails>> getEducationDetails({
    required int transactionId,
  }) async {
    try {
      TalentLinkHrRequest request = await TalentLinkHrRequest().createRequest(
          GetEducationDetailsRequest(transactionId: transactionId));
      final httpResponse = await _apiService.getEducationDetails(request);
      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result?.mapToDomain()),
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
