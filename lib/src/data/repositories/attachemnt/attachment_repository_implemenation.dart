import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attachemnet/attachement_api_service.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attachemnet/model/remote_attachment_type.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attachemnet/request/insert_attachment_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_request.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/talent_link_hr_response.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/attachment/attachment_repository.dart';

class AttachmentRepositoryImplementation extends AttachmentRepository {
  final AttachmentApiService _attachmentApiService;

  AttachmentRepositoryImplementation(this._attachmentApiService);

  @override
  Future<DataState<List<RequestType>>> attachmentType() async {
    try {
      TalentLinkHrRequest request =
          await TalentLinkHrRequest().createRequest({});

      final httpResponse = await _attachmentApiService.attachmentType(request);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: (httpResponse.data.result ?? []).mapAttachmentToDomain(),
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }

  @override
  Future<DataState<TalentLinkResponse>> insertAttachment({
    required InsertAttachmentRequest request,
    File? file,
  }) async {
    try {
      TalentLinkHrRequest<InsertAttachmentRequest>
          insertLeaveEncashmentRequest =
          await TalentLinkHrRequest<InsertAttachmentRequest>()
              .createRequest(request);
      late MultipartFile multipartFile;
      if (file!.path.isNotEmpty) {
        multipartFile = await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last.toString());
      }

      final httpResponse = await _attachmentApiService.insertAttachment(
          jsonEncode(insertLeaveEncashmentRequest.toMap()),
          file.path.isNotEmpty ? [multipartFile] : []);

      if ((httpResponse.data.success ?? false) &&
          (httpResponse.data.statusCode ?? 400) == 200) {
        return DataSuccess(
          data: httpResponse.data,
          message: httpResponse.data.responseMessage ?? "",
        );
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: e.message ?? "",
      );
    }
  }
}
