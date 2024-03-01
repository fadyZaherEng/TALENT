import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/air_ticket/calculate_in_case_air_ticket.dart';
import 'package:talent_link/src/domain/repositories/requests/air_ticket/air_ticket_repository.dart';

class CalculateInCaseAirTicketUseCase {
  final AirTicketRepository _repository;

  CalculateInCaseAirTicketUseCase(this._repository);

  Future<DataState<CalculateInCaseAirTicket>> call({
    required int employeeId,
    required String requestedDate,
  }) async {
    return await _repository.getCalculateInCaseAirTicket(
      employeeId: employeeId,
      requestedDate: requestedDate,
    );
  }
}
