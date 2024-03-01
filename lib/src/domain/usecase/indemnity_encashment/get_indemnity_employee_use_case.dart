import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/model/remote_get_employee_indemnity_encashment_details.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/request/get_employee_indemnity_encashment_details_request.dart';
import 'package:talent_link/src/domain/repositories/requests/indemnity_encashment/indemnity_encashment_repository.dart';

class GetIndemnityEmployeeUseCase {
  final IndemnityEncashmentRepository _repository;

  GetIndemnityEmployeeUseCase(this._repository);

  Future<DataState<List<RemoteGetEmployeeIndemnityEncashmentDetails>>> call(
      {required GetEmployeeIndemnityEncashmentDetailsRequest request}) async {
    return await _repository.getIndemnityEmployee(request);
  }
}
