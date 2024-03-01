import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/air_ticket/get_ait_ticket_by_employee.dart';
import 'package:talent_link/src/domain/repositories/requests/air_ticket/air_ticket_repository.dart';

class GetAirTicketByEmployeeUseCase {
  final AirTicketRepository _repository;

  GetAirTicketByEmployeeUseCase(this._repository);

  Future<DataState<GetAirTicketByEmployee>> call({
    required int employeeId,
  }) async {
    return await _repository.getAirTicketByEmployee(employeeId: employeeId);
  }
}
