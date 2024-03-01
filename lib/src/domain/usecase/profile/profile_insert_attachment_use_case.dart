import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/profile/request/insert_attachment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/profile/get_profile_employee_repository.dart';

class ProfileInsertAttachmentUseCase {
  final GetProfileEmployeeRepository _getProfileEmployeeRepository;

  ProfileInsertAttachmentUseCase(this._getProfileEmployeeRepository);

  Future<DataState<TalentLinkResponse>> call({
    required InsertAttachmentRequest request,
    File? file,
  }) async {
    return await _getProfileEmployeeRepository.insertAttachment(
      request: request,
      file: file,
    );
  }
}
