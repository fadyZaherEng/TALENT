import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attachment_details/response/remote_attachment.dart';

import '../../../../../../domain/entities/attachment_details/update_request_wf.dart';

part 'remote_attachment_details_update_request_wf.g.dart';

@JsonSerializable()
class RemoteAttachmentDetailsUpdateRequestWf {
  final int? id;
  final int? educationUpdatedRequestId;
  final int? levelNo;
  final int? actionUserId;
  final dynamic actionUserName;
  final int? wfStatusId;
  final dynamic wfStatusName;
  final dynamic remarks;
  final String? actionDate;
  final dynamic actionSource;
  final bool? isDeleted;
  final List<RemoteAttachment>? educationUpdatedRequestWFAttachment;

  RemoteAttachmentDetailsUpdateRequestWf({
    this.id,
    this.educationUpdatedRequestId,
    this.levelNo,
    this.actionUserId,
    this.actionUserName,
    this.wfStatusId,
    this.wfStatusName,
    this.remarks,
    this.actionDate,
    this.actionSource,
    this.isDeleted,
    this.educationUpdatedRequestWFAttachment,
  });

  factory RemoteAttachmentDetailsUpdateRequestWf.fromJson(Map<String, dynamic> json) =>
      _$RemoteAttachmentDetailsUpdateRequestWfFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAttachmentDetailsUpdateRequestWfToJson(this);
}

extension AttachmentUpdatedRequestWFExtension on RemoteAttachmentDetailsUpdateRequestWf {
  UpdatedRequestWF mapToDomain() {
    return UpdatedRequestWF(
      id: id,
      actionDate: actionDate,
      educationUpdatedRequestId: educationUpdatedRequestId,
      levelNo: levelNo,
      actionUserId: actionUserId,
      actionUserName: actionUserName,
      wfStatusId: wfStatusId,
      wfStatusName: wfStatusName,
      actionSource: actionSource,
      isDeleted: isDeleted,
      remarks: remarks,
    );
  }
}
