import 'package:talent_link/src/data/sources/remote/talent_link_hr/education_details/response/remote_qualifaction_type.dart';
import 'package:talent_link/src/domain/entities/education_details/attachment.dart';
import 'package:talent_link/src/domain/entities/education_details/update_request_wf.dart';

class EducationDetails {
  int? id;
  int? companyId;
  int? employeeId;
  String? documentFilePath;
  String? documentFileName;
  int? qualificationTypeId;
  QualificationType? qualificationType;
  String? qualificationTypeName;
  String? countryName;
  String? qualificationPlaceName;
  String? issueDate;
  String? expiryDate;
  String? qualificationFilePath;
  List<Attachment>? educationUpdatedRequestAttachments;
  List<UpdatedRequestWF>? educationUpdatedRequestWF;
  int? transactionStatusId;
  String? transactionStatusName;
  String? transactionStatusCode;
  String? remarks;
  int? workFlowId;
  String? workFlowName;
  bool? isEnabled;
  bool? isDeleted;
  List<Attachment>? attachmentUpdateRequestAttachments;
  List<UpdatedRequestWF>? attachmentUpdateRequestWF;

  EducationDetails({
    this.id,
    this.companyId,
    this.employeeId,
    this.documentFilePath,
    this.documentFileName,
    this.qualificationTypeId,
    this.qualificationType,
    this.qualificationTypeName,
    this.countryName,
    this.qualificationPlaceName,
    this.issueDate,
    this.expiryDate,
    this.qualificationFilePath,
    this.educationUpdatedRequestAttachments,
    this.educationUpdatedRequestWF,
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
}
