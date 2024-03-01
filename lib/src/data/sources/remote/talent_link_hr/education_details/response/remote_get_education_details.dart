import 'package:json_annotation/json_annotation.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/education_details/response/remote_attachment.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/education_details/response/remote_education_updated_wf.dart';
import 'package:talent_link/src/data/sources/remote/talent_link_hr/education_details/response/remote_qualifaction_type.dart';
import 'package:talent_link/src/domain/entities/education_details/education_details.dart';

part 'remote_get_education_details.g.dart';

@JsonSerializable()
class RemoteGetEducationDetails {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'companyId')
  final int? companyId;
  @JsonKey(name: 'employeeId')
  final int? employeeId;
  @JsonKey(name: 'documentFilePath')
  final String? documentFilePath;
  @JsonKey(name: 'documentFileName')
  final String? documentFileName;
  @JsonKey(name: 'qualificationTypeId')
  final int? qualificationTypeId;
  @JsonKey(name: 'qualificationType')
  final QualificationType? qualificationType;
  @JsonKey(name: 'qualificationTypeName')
  final String? qualificationTypeName;
  @JsonKey(name: 'countryName')
  final String? countryName;
  @JsonKey(name: 'qualificationPlaceName')
  final String? qualificationPlaceName;
  @JsonKey(name: 'issueDate')
  final String? issueDate;
  @JsonKey(name: 'expiryDate')
  final String? expiryDate;
  @JsonKey(name: 'qualificationFilePath')
  final String? qualificationFilePath;
  @JsonKey(name: 'educationUpdatedRequestAttachments')
  final List<RemoteAttachment>? educationUpdatedRequestAttachments;
  @JsonKey(name: 'educationUpdatedRequestWF')
  final List<EducationUpdatedRequestWF>? educationUpdatedRequestWF;
  @JsonKey(name: 'transactionStatusId')
  final int? transactionStatusId;
  @JsonKey(name: 'transactionStatusName')
  final String? transactionStatusName;
  @JsonKey(name: 'transactionStatusCode')
  final String? transactionStatusCode;
  @JsonKey(name: 'remarks')
  final String? remarks;
  @JsonKey(name: 'workFlowId')
  final int? workFlowId;
  @JsonKey(name: 'workFlowName')
  final String? workFlowName;
  @JsonKey(name: 'isEnabled')
  final bool? isEnabled;
  @JsonKey(name: 'isDeleted')
  final bool? isDeleted;
  @JsonKey(name: 'attachmentUpdateRequestAttachments')
  final dynamic attachmentUpdateRequestAttachments;
  @JsonKey(name: 'attachmentUpdateRequestWF')
  final dynamic attachmentUpdateRequestWF;

  RemoteGetEducationDetails({
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

  factory RemoteGetEducationDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetEducationDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetEducationDetailsToJson(this);
}

extension RemoteGetEducationDetailsExtension on RemoteGetEducationDetails {
  EducationDetails mapToDomain() {
    return EducationDetails(
      id: id,
      companyId: companyId,
      employeeId: employeeId,
      documentFilePath: documentFilePath,
      documentFileName: documentFileName,
      qualificationTypeId: qualificationTypeId,
      qualificationType: qualificationType,
      qualificationTypeName: qualificationTypeName,
      countryName: countryName,
      qualificationPlaceName: qualificationPlaceName,
      issueDate: issueDate,
      expiryDate: expiryDate!,
      qualificationFilePath: qualificationFilePath,
      educationUpdatedRequestAttachments: educationUpdatedRequestAttachments!
          .map((e) => e.mapToDomain())
          .toList(),
      educationUpdatedRequestWF:
          educationUpdatedRequestWF!.map((e) => e.mapToDomain()).toList(),
      transactionStatusId: transactionStatusId,
      transactionStatusName: transactionStatusName,
      transactionStatusCode: transactionStatusCode,
      remarks: remarks,
    );
  }
}
