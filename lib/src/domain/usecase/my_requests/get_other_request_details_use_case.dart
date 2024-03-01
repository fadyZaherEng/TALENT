import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/other_request_details/other_request_details.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';

class GetOtherRequestDetailsUseCase {
  final MyRequestsRepository _myRequestsRepository;

  GetOtherRequestDetailsUseCase(this._myRequestsRepository);

  Future<DataState<GetOtherRequestDetails>> call({
    int transactionId = 22,
  }) async {
    return _myRequestsRepository.getOtherRequestDetails(
      transactionId: transactionId,
    );
  }
}
