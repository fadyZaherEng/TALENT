import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/my_requests/my_request.dart';
import 'package:talent_link/src/domain/repositories/my_requests/my_requests_repository.dart';

class GetEmployeeRequestsUseCase {
  final MyRequestsRepository _myRequestsRepository;

  GetEmployeeRequestsUseCase(this._myRequestsRepository);

  Future<DataState<List<MyRequest>>> call({
    required int requestTypeId,
    required int employeeId,
    required int transactionStatusId,
    required  String requestFromDate,
    required String requestToDate,
    required String createdDateAt,
    required String createdDateFrom ,
    required int requestDataId,
  }) async {
    return await _myRequestsRepository.getEmployeeRequests(
      requestTypeId: requestTypeId,
      employeeId: employeeId,
      transactionStatusId: transactionStatusId,
      requestFromDate: requestFromDate,
      requestToDate: requestToDate,
      createdDateAt: createdDateAt,
      createdDateFrom: createdDateFrom,
      requestDataId: requestDataId,
    );
  }
}
