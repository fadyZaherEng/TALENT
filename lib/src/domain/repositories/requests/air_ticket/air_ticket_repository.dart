import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/request/insert_air_ticket_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/air_ticket/air_ticket.dart';
import 'package:talent_link/src/domain/entities/air_ticket/calculate_in_case_air_ticket.dart';
import 'package:talent_link/src/domain/entities/air_ticket/get_ait_ticket_by_employee.dart';

abstract class AirTicketRepository {
  Future<DataState<TalentLinkResponse>> insertAirTicket({
    required InsertAirTicketRequest request,
    File? file,
  });

  Future<DataState<List<AirTicket>>> getDependent({required int employeeId});

  Future<DataState<GetAirTicketByEmployee>> getAirTicketByEmployee(
      {required int employeeId});

  Future<DataState<CalculateInCaseAirTicket>> getCalculateInCaseAirTicket({
    required int employeeId,
    required String requestedDate,
  });
}
