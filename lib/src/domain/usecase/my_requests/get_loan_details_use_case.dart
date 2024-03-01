import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_loan_details/get_loan_details.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';

class GetLoanDetailsUseCase {
  final MyRequestsRepository _myRequestsRepository;

  GetLoanDetailsUseCase(this._myRequestsRepository);

  Future<DataState<GetLoanDetails>> call({
    int transactionId = 3089,
  }) async {
    return await _myRequestsRepository.getLoanDetails(
      transactionId: transactionId,
    );
  }
}
