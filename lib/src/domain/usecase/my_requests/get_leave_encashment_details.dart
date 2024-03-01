import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_leave_encashment_details/get_leave_encashment_details.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';

class GetLeaveEncashmentDetailsUseCase {
  final MyRequestsRepository _myRequestsRepository;

  GetLeaveEncashmentDetailsUseCase(this._myRequestsRepository);

  Future<DataState<GetLeaveEncashmentDetails>> call({
    int transactionId = 2012,
  }) async {
    return await _myRequestsRepository.getLeaveEncashmentDetails(
      transactionId: transactionId,
    );
  }
}
