import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attachemnet/request/insert_attachment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/repositories/attachment/attachment_repository.dart';

class InsertAttachmentUseCase {
  final AttachmentRepository _repository;

  InsertAttachmentUseCase(this._repository);

  Future<DataState<TalentLinkResponse>> call(
      {required InsertAttachmentRequest request, File? file}) async {
    return await _repository.insertAttachment(request: request, file: file);
  }
}
