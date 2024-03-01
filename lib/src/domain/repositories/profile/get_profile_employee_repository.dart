import 'dart:async';
import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/profile/request/insert_attachment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/profile/profile_employee.dart';

abstract class GetProfileEmployeeRepository {
  Future<DataState<ProfileEmployee>> getProfileEmployee({
    required int employeeId,
  });
  Future<DataState<TalentLinkResponse>> insertAttachment({
    required InsertAttachmentRequest request,
    File? file,
  });
}
