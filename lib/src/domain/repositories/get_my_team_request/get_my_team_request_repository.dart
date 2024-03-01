import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/get_companies_and_employees_list.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_my_team_request.dart';

abstract class GetMyTeamRequestRepository {
  Future<DataState<List<MyTeamRequest>>> getMyTeamRequest({
    required int managerEmployeeId,
    required int filterCompanyId,
    required int filerEmployeeId,
    required int requestTypeId,
    required String requestFromDate,
    required String requestToDate,
    required String createdDateAt,
    required String createdDateFrom,
    required int requestDataId,
    required int transactionStatusId,
  });

  Future<DataState<CompaniesAndEmployeesList>> getCompaniesAndEmployeesList({
    required int employeeId,
  });

  Future<DataState<bool>> approveRequest(
      {required int transactionId,
      required employeeId,
      required requestTypeId});

  Future<DataState<bool>> rejectRequest(
      {required int transactionId,
      required employeeId,
      required requestTypeId});
}
