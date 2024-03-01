import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/repositories/get_my_team_request/get_my_team_request_repository.dart';

class RejectRequestUseCase {
  final GetMyTeamRequestRepository _getMyTeamRequestRepository;

  RejectRequestUseCase(this._getMyTeamRequestRepository);

  Future<DataState<bool>> call({
    required int transactionId,
    required employeeId,
    required requestTypeId,
  }) async {
    return await _getMyTeamRequestRepository.rejectRequest(
      employeeId: employeeId,
      requestTypeId: requestTypeId,
      transactionId: transactionId,
    );
  }
}
