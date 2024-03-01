import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/asset/request/insert_asset_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/asset/asset_repository.dart';

class InsertAssetUseCase {
  final AssetRepository _repository;

  InsertAssetUseCase(this._repository);

  Future<DataState<TalentLinkResponse>> call(
      {required InsertAssetRequest request}) async {
    return await _repository.insertAsset(request: request);
  }
}
