import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/get_subscribe_info/get_subscribe_info.dart';

abstract class GetSubscribeInfoRepository {
  Future<DataState<GetSubscribeInfo>> getSubscribeInfo({
    required int subscriberId,
    required String subscriberName,
    required String termsAndConditions,
    required String aboutUs,
  });
}
