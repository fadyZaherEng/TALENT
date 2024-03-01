import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_business_trip_details.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';

class GetBusinessTripDetailsUseCase {
  final MyRequestsRepository _myRequestsRepository;

  GetBusinessTripDetailsUseCase(this._myRequestsRepository);

  Future<DataState<GetBusinessTripDetails>> call({
    int transactionId = 29,
  }) async {
    return _myRequestsRepository.getBusinessTripDetails(
      transactionId: transactionId,
    );
  }
}
