import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/countries/model/remote_countries.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'countries_api_service.g.dart';
@RestApi()
abstract class CountriesApiService {
  factory CountriesApiService(Dio dio) = _CountriesApiService;

  @POST(APIKeys.getCountryAndCityList)
  Future<HttpResponse<TalentLinkResponse<RemoteCountries>>> countries(
      @Body() TalentLinkHrRequest request);
}
