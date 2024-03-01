import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/education/request/insert_education_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/education/education_repository.dart';

class InsertEducationUseCase {
  final EducationRepository _repository;

  InsertEducationUseCase(this._repository);

  Future<DataState<TalentLinkResponse>> call({
    required InsertEducationRequest request,
    File? file,
  }) async {
    return await _repository.insertEducation(
      request: request,
      file: file,
    );
  }
}
