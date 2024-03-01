import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/half_day/half_day_details.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';

class GetHalfDayDetailsUseCase {
  final MyRequestsRepository _myRequestsRepository;

  GetHalfDayDetailsUseCase(this._myRequestsRepository);

  Future<DataState<GetHalfDayLeaveDetails>> call({
    int transactionId = 1017,
  }) async {
    return _myRequestsRepository.getHalfDayLeaveDetails(
      transactionId: transactionId,
    );
  }
}
