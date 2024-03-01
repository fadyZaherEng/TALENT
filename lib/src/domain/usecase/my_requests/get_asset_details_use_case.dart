import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/asset_details/asset_details.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';

class GetAssetDetailsUseCase {
  final MyRequestsRepository _myRequestsRepository;

  GetAssetDetailsUseCase(this._myRequestsRepository);

  Future<DataState<AssetDetails>> call({required int transactionId}) async {
    return await _myRequestsRepository.getAssetDetails(
        transactionId: transactionId);
  }
}
