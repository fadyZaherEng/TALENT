import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/air_ticket/air_ticket.dart';
import 'package:talent_link/src/domain/repositories/requests/air_ticket/air_ticket_repository.dart';

class GetDependentUseCase {
  final AirTicketRepository _repository;

  GetDependentUseCase(this._repository);

  Future<DataState<List<AirTicket>>> call({required int employeeId}) async {
    return await _repository.getDependent(employeeId: employeeId);
  }
}
