import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/asset/asset_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/asset/model/remote_asset_type.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/asset/request/insert_asset_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/asset/asset_repository.dart';

class AssetRepositoryImplementation extends AssetRepository {
  final AssetApiService _assetApiService;

  AssetRepositoryImplementation(this._assetApiService);

  @override
  Future<DataState<List<RequestType>>> getAssetTypeList() async {
    try {
      TalentLinkHrRequest request =
          await TalentLinkHrRequest().createRequest({});

      final httpResponse = await _assetApiService.assetType(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapAssetTypeToDomain(),
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
  Future<DataState<TalentLinkResponse>> insertAsset(
      {required InsertAssetRequest request}) async {
    try {
      TalentLinkHrRequest insertRequest =
          await TalentLinkHrRequest().createRequest(request);

      final httpResponse = await _assetApiService.insertAsset(insertRequest);

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
