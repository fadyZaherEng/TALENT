import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_leave_details.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';

class GetLeaveDetailsUseCase {
  final MyRequestsRepository _myRequestsRepository;

  GetLeaveDetailsUseCase(this._myRequestsRepository);

  Future<DataState<GetLeaveDetails>> call({
    required int transactionId,
  }) async {
    return await _myRequestsRepository.getLeaveDetails(
      transactionId: transactionId,
    );
  }
}
