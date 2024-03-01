import 'package:json_annotation/json_annotation.dart';

part 'insert_education_request.g.dart';

@JsonSerializable()
class InsertEducationRequest {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'companyId')
  final int companyId;
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @JsonKey(name: 'transactionStatusId')
  final int transactionStatusId;
  @JsonKey(name: 'transactionStatusName')
  final String transactionStatusName;
  @JsonKey(name: 'transactionStatusCode')
  final String transactionStatusCode;
  @JsonKey(name: 'remarks')
  final String remarks;
  @JsonKey(name: 'workFlowId')
  final int workFlowId;
  @JsonKey(name: 'workFlowName')
  final String workFlowName;
  @JsonKey(name: 'isEnabled')
  final bool isEnabled;
  @JsonKey(name: 'IssueDate')
  final String issueDate;
  @JsonKey(name: 'ExpiryDate')
  final String expiryDate;
  @JsonKey(name: 'QualificationPlaceName')
  final String qualificationPlaceName;
  @JsonKey(name: 'documentFilePath')
  final String documentFilePath;
  @JsonKey(name: 'documentFileName')
  final String documentFileName;
  @JsonKey(name: 'fileSource')
  final String fileSource;
  @JsonKey(name: 'QualificationTypeId')
  final int qualificationTypeId;
  @JsonKey(name: 'isDeleted')
  final bool isDeleted;
  @JsonKey(name: 'QualificationTypeName')
  final String qualificationTypeName;
  @JsonKey(name: 'QualificationFilePath')
  final String qualificationFilePath;
  @JsonKey(name: 'CountryId')
  final int countryId;
  @JsonKey(name: 'CountryName')
  final String countryName;

  InsertEducationRequest({
    required this.id,
    required this.companyId,
    required this.employeeId,
    required this.transactionStatusId,
    required this.transactionStatusName,
    required this.transactionStatusCode,
    required this.remarks,
    required this.workFlowId,
    required this.workFlowName,
    required this.isEnabled,
    required this.issueDate,
    required this.expiryDate,
    required this.qualificationPlaceName,
    required this.documentFilePath,
    required this.documentFileName,
    required this.fileSource,
    required this.qualificationTypeId,
    required this.isDeleted,
    required this.qualificationTypeName,
    required this.qualificationFilePath,
    required this.countryId,
    required this.countryName,
  });

  factory InsertEducationRequest.fromJson(Map<String, dynamic> json) =>
      _$InsertEducationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InsertEducationRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'companyId': companyId,
      'employeeId': employeeId,
      'transactionStatusId': transactionStatusId,
      'transactionStatusName': transactionStatusName,
      'transactionStatusCode': transactionStatusCode,
      'remarks': remarks,
      'workFlowId': workFlowId,
      'workFlowName': workFlowName,
      'isEnabled': isEnabled,
      'IssueDate': issueDate,
      'ExpiryDate': expiryDate,
      'QualificationPlaceName': qualificationPlaceName,
      'documentFilePath': documentFilePath,
      'documentFileName': documentFileName,
      'fileSource': fileSource,
      'QualificationTypeId': qualificationTypeId,
      'isDeleted': isDeleted,
      'QualificationTypeName': qualificationTypeName,
      'QualificationFilePath': qualificationFilePath,
      'CountryId': countryId,
      'CountryName': countryName,
    };
  }

  factory InsertEducationRequest.fromMap(Map<String, dynamic> map) {
    return InsertEducationRequest(
      id: map['id'] as int,
      companyId: map['companyId'] as int,
      employeeId: map['employeeId'] as int,
      transactionStatusId: map['transactionStatusId'] as int,
      transactionStatusName: map['transactionStatusName'] as String,
      transactionStatusCode: map['transactionStatusCode'] as String,
      remarks: map['remarks'] as String,
      workFlowId: map['workFlowId'] as int,
      workFlowName: map['workFlowName'] as String,
      isEnabled: map['isEnabled'] as bool,
      issueDate: map['IssueDate'] as String,
      expiryDate: map['ExpiryDate'] as String,
      qualificationPlaceName: map['QualificationPlaceName'] as String,
      documentFilePath: map['documentFilePath'] as String,
      documentFileName: map['documentFileName'] as String,
      fileSource: map['fileSource'] as String,
      qualificationTypeId: map['QualificationTypeId'] as int,
      isDeleted: map['isDeleted'] as bool,
      qualificationTypeName: map['QualificationTypeName'] as String,
      qualificationFilePath: map['QualificationFilePath'] as String,
      countryId: map['CountryId'] as int,
      countryName: map['CountryName'] as String,
    );
  }
}
