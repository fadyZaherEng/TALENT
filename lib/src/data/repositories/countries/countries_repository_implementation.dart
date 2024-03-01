import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/countries/countries_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/countries/model/remote_countries.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/domain/entities/countries/countries.dart';
import 'package:talent_link/src/domain/repositories/countries/countries_repository.dart';

class CountriesRepositoryImplementation extends CountriesRepository {
  final CountriesApiService _countriesApiService;

  CountriesRepositoryImplementation(this._countriesApiService);

  @override
  Future<DataState<Countries>> countries() async {
    try {
      TalentLinkHrRequest request =
      await TalentLinkHrRequest().createRequest({});

      final httpResponse = await _countriesApiService.countries(request);

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
}
