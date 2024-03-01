import 'dart:io';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attachemnet/request/insert_attachment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

abstract class AttachmentRepository {
  Future<DataState<List<RequestType>>> attachmentType();

  Future<DataState<TalentLinkResponse>> insertAttachment({
    required InsertAttachmentRequest request,
    File? file,
  });
}
