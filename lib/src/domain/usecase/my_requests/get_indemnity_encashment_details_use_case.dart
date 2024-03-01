import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_indemnity_encashment_details/get_indemnity_encashment_details.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';

class GetIndemnityEncashmentDetailsUseCase {
  final MyRequestsRepository _myRequestsRepository;

  GetIndemnityEncashmentDetailsUseCase(this._myRequestsRepository);

  Future<DataState<GetIndemnityEncashmentDetails>> call({
    int transactionId = 20,
  }) async {
    return _myRequestsRepository.getIndemnityEncashmentDetails(
      transactionId: transactionId,
    );
  }
}
