import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/resume_duty/request/insert_resume_duty_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/requests/resume_duty/resume_duty_repository.dart';

class InsertResumeDutyUseCase {
  final ResumeDutyRepository _resumeDutyRepository;

  InsertResumeDutyUseCase(this._resumeDutyRepository);

  Future<DataState<TalentLinkResponse>> call({
    required InsertResumeDutyRequest request,
    File? file,
  }) async {
    return await _resumeDutyRepository.insertResumeDuty(
        request: request, file: file);
  }
}
