import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';

class CancelRequestUseCase {
  final MyRequestsRepository _myRequestsRepository;

  CancelRequestUseCase(this._myRequestsRepository);

  Future<DataState<TalentLinkResponse>> call({
    required int transactionId,
    required int tableId ,
  }) async {
    return await _myRequestsRepository.cancelRequest(
      tableId: tableId,
      transactionId: transactionId,
    );
  }
}