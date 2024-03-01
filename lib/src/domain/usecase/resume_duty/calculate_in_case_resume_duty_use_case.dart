import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/model/remote_calculate_in_case_resume_duty.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/calculate_in_case_resume_duty_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/requests/resume_duty/resume_duty_repository.dart';

class CalculateInCaseResumeDutyUseCase {
  final ResumeDutyRepository _resumeDutyRepository;

  CalculateInCaseResumeDutyUseCase(this._resumeDutyRepository);

  Future<DataState<TalentLinkResponse<RemoteCalculateInCaseResumeDuty>>> call({
    required CalculateInCaseResumeDutyRequest request,
  }) async {
    return await _resumeDutyRepository.calculateInCaseResumeDuty(
        caseResumeDutyRequest: request);
  }
}
