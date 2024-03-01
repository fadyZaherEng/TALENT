import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_short_leave_details/get_short_level_details.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';

class GetShortLevelDetailsUseCase {
  final MyRequestsRepository _myRequestsRepository;

  GetShortLevelDetailsUseCase(this._myRequestsRepository);

  Future<DataState<GetShortLevelDetails>> call({
    int transactionId = 3104,
  }) async {
    return await _myRequestsRepository.getShortLeaveDetails(
      transactionId: transactionId,
    );
  }
}
