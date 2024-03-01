import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/get_subscribe_info/get_subscribe_info.dart';
import 'package:talent_link/src/domain/repositories/get_subscribe_info/get_subscribe_info_repository.dart';

class GetSubscribeInfoUseCase {
  final GetSubscribeInfoRepository _getSubscribeInfoRepository;

  GetSubscribeInfoUseCase(this._getSubscribeInfoRepository);

  Future<DataState<GetSubscribeInfo>> call({
    int subscriberId = 0,
    String subscriberName = "",
    String termsAndConditions = "",
    String aboutUs = "",
  }) async {
    return await _getSubscribeInfoRepository.getSubscribeInfo(
      subscriberId: subscriberId,
      subscriberName: subscriberName,
      termsAndConditions: termsAndConditions,
      aboutUs: aboutUs,
    );
  }
}
