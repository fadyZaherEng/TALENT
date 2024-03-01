import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/asset/asset_repository.dart';

class GetAssetTypeListUseCase {
  final AssetRepository _repository;

  GetAssetTypeListUseCase(this._repository);

  Future<DataState<List<RequestType>>> call() async {
    return await _repository.getAssetTypeList();
  }
}
