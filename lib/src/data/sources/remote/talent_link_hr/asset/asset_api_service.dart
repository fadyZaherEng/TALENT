import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:talent_link/src/data/sources/remote/api_keys.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/asset/model/remote_asset_type.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

part 'asset_api_service.g.dart';

@RestApi()
abstract class AssetApiService {
  factory AssetApiService(Dio dio) = _AssetApiService;

  @POST(APIKeys.getAssetTypeList)
  Future<HttpResponse<TalentLinkResponse<List<RemoteAssetType>>>> assetType(
      @Body() TalentLinkHrRequest request);

  @POST(APIKeys.insertAsset)
  Future<HttpResponse<TalentLinkResponse>> insertAsset(
      @Body() TalentLinkHrRequest request);
}
