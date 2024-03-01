import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/git_air_ticket_details.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';

class GetAirTicketDetailsUseCase {
  final MyRequestsRepository _myRequestsRepository;

  GetAirTicketDetailsUseCase(this._myRequestsRepository);

  Future<DataState<GetAirTicketDetails>> call({
    int transactionId = 1017,
  }) async {
    return _myRequestsRepository.getAirTicketDetails(
      transactionId: transactionId,
    );
  }
}
