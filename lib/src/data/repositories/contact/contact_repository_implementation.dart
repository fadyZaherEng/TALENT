import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/contact/contact_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/contact/model/remote_contect_type.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/contact/request/insert_contact_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/contact/contact_repository.dart';

class ContactRepositoryImplementation extends ContactRepository {
  final ContactApiService _contactApiService;

  ContactRepositoryImplementation(this._contactApiService);

  @override
  Future<DataState<List<RequestType>>> contactTypes() async {
    try {
      TalentLinkHrRequest request =
          await TalentLinkHrRequest().createRequest({});

      final httpResponse = await _contactApiService.contactType(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapContactTypeToDomain(),
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
  Future<DataState<TalentLinkResponse>> insertContact(
      {required InsertContactRequest request}) async {
    try {
      TalentLinkHrRequest insertRequest =
          await TalentLinkHrRequest().createRequest(request);

      final httpResponse =
          await _contactApiService.insertContact(insertRequest);

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
      return DataFailed(error: e, message: e.message ?? "");
    }
  }
}
