import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/model/remote_calculate_in_case_indemnity_encashment.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/request/calculate_in_case_indemnity_encashment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/requests/indemnity_encashment/indemnity_encashment_repository.dart';

class CalculateInCaseIndemnityEncashmentUseCase {
  final IndemnityEncashmentRepository _repository;

  CalculateInCaseIndemnityEncashmentUseCase(this._repository);

  Future<
      DataState<
          TalentLinkResponse<RemoteCalculateInCaseIndemnityEncashment>>> call({
    required CalculateInCaseIndemnityEncashmentRequest request,
  }) async {
    return await _repository.calculateInCaseIndemnity(request: request);
  }
}
