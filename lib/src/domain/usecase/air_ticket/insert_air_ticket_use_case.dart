import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/request/insert_air_ticket_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/requests/air_ticket/air_ticket_repository.dart';

class InsertAirTicketUseCase {
  final AirTicketRepository _repository;

  InsertAirTicketUseCase(this._repository);

  Future<DataState<TalentLinkResponse>> call(
      {required InsertAirTicketRequest request, File? file}) async {
    return await _repository.insertAirTicket(request: request, file: file);
  }
}
