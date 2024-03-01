import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/air_ticket_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/model/remote_calculate_in_case_air_ticket.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/model/remote_dependent_air_ticket.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/model/remote_get_air_ticket_by_employee.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/request/calculate_in_case_air_ticket_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/request/get_air_ticket_by_employee_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/request/get_dependent_air_ticket_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/air_ticket/request/insert_air_ticket_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/air_ticket/air_ticket.dart';
import 'package:talent_link/src/domain/entities/air_ticket/calculate_in_case_air_ticket.dart';
import 'package:talent_link/src/domain/entities/air_ticket/get_ait_ticket_by_employee.dart';
import 'package:talent_link/src/domain/repositories/requests/air_ticket/air_ticket_repository.dart';

class AirTicketRepositoryImplementation extends AirTicketRepository {
  final AirTicketApiService _airTicketApiService;

  AirTicketRepositoryImplementation(this._airTicketApiService);

  @override
  Future<DataState<TalentLinkResponse>> insertAirTicket({
    required InsertAirTicketRequest request,
    File? file,
  }) async {
    try {
      TalentLinkHrRequest<InsertAirTicketRequest> insertAirTicketRequest =
          await TalentLinkHrRequest<InsertAirTicketRequest>()
              .createRequest(request);
      // MultipartFile multipartFile = await MultipartFile.fromFile(
      //     file?.path ?? "",
      //     filename: file?.path.split('/').last.toString());

      final httpResponse = await _airTicketApiService
          .insertAirTicket(jsonEncode(insertAirTicketRequest.toMap()), []);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data,
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<List<AirTicket>>> getDependent({
    required int employeeId,
  }) async {
    try {
      TalentLinkHrRequest<GetDependentAirTicketRequest> request =
          await TalentLinkHrRequest<GetDependentAirTicketRequest>()
              .createRequest(
                  GetDependentAirTicketRequest(employeeId: employeeId));

      final httpResponse =
          await _airTicketApiService.getDependentAirTicket(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data:
              (httpResponse.data.result ?? []).mapDependentAirTicketToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<GetAirTicketByEmployee>> getAirTicketByEmployee({
    required int employeeId,
  }) async {
    try {
      TalentLinkHrRequest<GetAirTicketByEmployeeRequest> request =
          await TalentLinkHrRequest<GetAirTicketByEmployeeRequest>()
              .createRequest(
                  GetAirTicketByEmployeeRequest(employeeId: employeeId));

      final httpResponse =
          await _airTicketApiService.getAirTicketByEmployee(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result?.mapToDomain()),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<CalculateInCaseAirTicket>> getCalculateInCaseAirTicket(
      {required int employeeId, required String requestedDate}) async {
    try {
      TalentLinkHrRequest<CalculateInCaseAirTicketRequest> request =
          await TalentLinkHrRequest<CalculateInCaseAirTicketRequest>()
              .createRequest(CalculateInCaseAirTicketRequest(
        employeeId: employeeId,
        requestedDate: requestedDate,
      ));

      final httpResponse =
          await _airTicketApiService.calculateInCaseAirTicket(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result?.mapToDomain()),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }
}
