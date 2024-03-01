import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/education_details/response/remote_attachment.dart';
import 'package:talent_link/src/domain/entities/education_details/update_request_wf.dart';

part 'remote_education_updated_wf.g.dart';

@JsonSerializable()
class EducationUpdatedRequestWF {
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

  EducationUpdatedRequestWF({
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

  factory EducationUpdatedRequestWF.fromJson(Map<String, dynamic> json) =>
      _$EducationUpdatedRequestWFFromJson(json);

  Map<String, dynamic> toJson() => _$EducationUpdatedRequestWFToJson(this);
}

extension EducationUpdatedRequestWFExtension on EducationUpdatedRequestWF {
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
