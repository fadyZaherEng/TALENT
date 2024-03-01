import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/asset/request/insert_asset_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

abstract class AssetRepository {
  Future<DataState<List<RequestType>>> getAssetTypeList();

  Future<DataState<TalentLinkResponse>> insertAsset({
    required InsertAssetRequest request,
  });
}
