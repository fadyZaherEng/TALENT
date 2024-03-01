import 'package:talent_link/src/domain/entities/education_details/attachment.dart';

class UpdatedRequestWF {
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
  final List<Attachment>? educationUpdatedRequestWFAttachment;

  UpdatedRequestWF({
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
}