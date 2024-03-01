import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/requests/indemnity_encashment/request/insert_indemnity_encashment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/requests/indemnity_encashment/indemnity_encashment_repository.dart';

class InsertIndemnityEncashmentUseCase {
  final IndemnityEncashmentRepository _repository;

  InsertIndemnityEncashmentUseCase(this._repository);

  Future<DataState<TalentLinkResponse>> call(
      {required InsertIndemnityEncashmentRequest request, File? file}) async {
    return await _repository.insertIndemnityEncashment(
        request: request, file: file);
  }
}
