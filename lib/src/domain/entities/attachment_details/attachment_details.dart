import 'package:talent_link/src/domain/entities/attachment_details/attachment.dart';
import 'package:talent_link/src/domain/entities/attachment_details/update_request_wf.dart';

class AttachmentDetails {
  int? id;
  int? companyId;
  int? employeeId;
  String? issueDate;
  String? expiryDate;
  String? documentNo;
  String? documentFilePath;
  String? documentFileName;
  int? attachmentTypeId;
  String? attachmentTypeName;
  int? transactionStatusId;
  String? transactionStatusName;
  String? transactionStatusCode;
  String? remarks;
  int? workFlowId;
  dynamic workFlowName;
  bool? isEnabled;
  bool? isDeleted;
  List<Attachment>? attachmentUpdateRequestAttachments;
  List<UpdatedRequestWF>? attachmentUpdateRequestWF;

  AttachmentDetails({
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
    this.attachmentUpdateRequestAttachments,
    this.attachmentUpdateRequestWF,
    this.isDeleted,
  });
}
