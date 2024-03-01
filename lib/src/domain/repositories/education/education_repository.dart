import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/education/request/insert_education_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';

abstract class EducationRepository {
  Future<DataState<TalentLinkResponse>> insertEducation({
    required InsertEducationRequest request,
    File? file,
  });
}
