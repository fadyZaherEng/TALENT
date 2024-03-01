import 'package:dio/dio.dart';
import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attachment_details/attachment_details_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attachment_details/request/get_attachment_details_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attachment_details/response/remote_get_attachment_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/attachment_details/attachment_details.dart';
import 'package:talent_link/src/domain/repositories/attachment_details/attachment_details_repository.dart';

class AttachmentDetailsRepositoryImplementation
    extends AttachmentDetailsRepository {
  final AttachmentDetailsApiService _apiService;

  AttachmentDetailsRepositoryImplementation(this._apiService);

  @override
  Future<DataState<AttachmentDetails>> getAttachmentDetails({
    required int transactionId,
  }) async {
    try {
      TalentLinkHrRequest request = await TalentLinkHrRequest().createRequest(GetAttachmentDetailsRequest(transactionId: transactionId));
      final httpResponse = await _apiService.getAttachmentDetails(request);
      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result!.mapToDomain()),
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
