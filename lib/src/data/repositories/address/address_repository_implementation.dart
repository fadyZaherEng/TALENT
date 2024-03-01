import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/address/address_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/address/request/insert_address_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/address/address_repository.dart';

class AddressRepositoryImplementation extends AddressRepository {
  final AddressApiService _apiService;

  AddressRepositoryImplementation(this._apiService);

  @override
  Future<DataState<TalentLinkResponse>> insertAddress({
    required InsertAddressRequest request,
  }) async {
    try {
      TalentLinkHrRequest insertRequest =
          await TalentLinkHrRequest().createRequest(request);

      final httpResponse = await _apiService.insertAddress(insertRequest);

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
