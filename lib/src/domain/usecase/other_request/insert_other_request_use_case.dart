import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/other_request/request/insert_other_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/requests/other_request/other_request_repository.dart';

class InsertOtherRequestUseCase {
  final OtherRequestRepository _repository;

  InsertOtherRequestUseCase(this._repository);

  Future<DataState<TalentLinkResponse>> call(
      {required InsertOtherRequest request, File? file}) async {
    return await _repository.insertOtherRequest(request: request, file: file);
  }
}
