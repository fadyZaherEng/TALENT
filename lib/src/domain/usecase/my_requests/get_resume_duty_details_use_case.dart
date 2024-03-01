import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_resume_duty_details.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';

class GetResumeDutyDetailsUseCase {
  final MyRequestsRepository _myRequestsRepository;

  GetResumeDutyDetailsUseCase(this._myRequestsRepository);

  Future<DataState<GetResumeDutyDetails>> call({
    int transactionId = 2028,
  }) async {
    return _myRequestsRepository.getResumeDutyDetails(
      transactionId: transactionId,
    );
  }
}
