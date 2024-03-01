import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attachment_details/response/remote_attachment.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/attachment_details/response/remote_attachment_details_update_request_wf.dart';
import 'package:talent_link/src/domain/entities/attachment_details/attachment_details.dart';

part 'remote_get_attachment_details.g.dart';

@JsonSerializable()
class RemoteGetAttachmentDetails {
  final int? id;
  final int? companyId;
  final int? employeeId;
  final String? issueDate;
  final String? expiryDate;
  final String? documentNo;
  final String? documentFilePath;
  final String? documentFileName;
  final int? attachmentTypeId;
  final String? attachmentTypeName;
  final int? transactionStatusId;
  final String? transactionStatusName;
  final String? transactionStatusCode;
  final String? remarks;
  final int? workFlowId;
  final dynamic workFlowName;
  final bool? isEnabled;
  final bool? isDeleted;
  final List<RemoteAttachment>? attachmentUpdateRequestAttachments;
  final List<RemoteAttachmentDetailsUpdateRequestWf>? attachmentUpdateRequestWF;

  RemoteGetAttachmentDetails({
    this.id,
    this.companyId,
    this.employeeId,
    this.issueDate,
    this.expiryDate,
    this.documentNo,
    this.documentFilePath,
    this.documentFileName,
    this.attachmentTypeId,
    this.attachmentTypeName,
    this.transactionStatusId,
    this.transactionStatusName,
    this.transactionStatusCode,
    this.remarks,
    this.workFlowId,
    this.workFlowName,
    this.isEnabled,
    this.isDeleted,
    this.attachmentUpdateRequestAttachments,
    this.attachmentUpdateRequestWF,
  });

  factory RemoteGetAttachmentDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetAttachmentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetAttachmentDetailsToJson(this);
}

extension RemoteGetAttachmentDetailsExtension on RemoteGetAttachmentDetails {
  AttachmentDetails mapToDomain() {
    return AttachmentDetails(
        id: id,
        companyId: companyId,
        employeeId: employeeId,
        documentFilePath: documentFilePath,
        documentFileName: documentFileName,
        attachmentTypeId: attachmentTypeId,
        attachmentTypeName: attachmentTypeName,
        documentNo: documentNo,
        issueDate: issueDate,
        expiryDate: expiryDate!,
        isEnabled: isEnabled,
        workFlowId: workFlowId,
        workFlowName: workFlowName,
        transactionStatusId: transactionStatusId,
        transactionStatusName: transactionStatusName,
        transactionStatusCode: transactionStatusCode,
        remarks: remarks,
        isDeleted: isDeleted,
        attachmentUpdateRequestAttachments: attachmentUpdateRequestAttachments!
            .map((e) => e.mapToDomain())
            .toList(),
        attachmentUpdateRequestWF:
            attachmentUpdateRequestWF!.map((e) => e.mapToDomain()).toList());
  }
}
