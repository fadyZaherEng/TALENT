import 'package:json_annotation/json_annotation.dart';

part 'insert_attachment_request.g.dart';

@JsonSerializable()
class InsertAttachmentRequest {
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
  @JsonKey(name: 'issueDate')
  final String issueDate;
  @JsonKey(name: 'expiryDate')
  final String expiryDate;
  @JsonKey(name: 'documentNo')
  final String documentNo;
  @JsonKey(name: 'documentFilePath')
  final String documentFilePath;
  @JsonKey(name: 'documentFileName')
  final String documentFileName;
  @JsonKey(name: 'fileSource')
  final String fileSource;
  @JsonKey(name: 'attachmentTypeId')
  final int attachmentTypeId;
  @JsonKey(name: 'isDeleted')
  final bool isDeleted;
  @JsonKey(name: 'attachmentTypeName')
  final String attachmentTypeName;

  InsertAttachmentRequest({
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
    required this.documentNo,
    required this.documentFilePath,
    required this.documentFileName,
    required this.fileSource,
    required this.attachmentTypeId,
    required this.isDeleted,
    required this.attachmentTypeName,
  });

  factory InsertAttachmentRequest.fromJson(Map<String, dynamic> json) =>
      _$InsertAttachmentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InsertAttachmentRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "companyId": companyId,
      "employeeId": employeeId,
      "transactionStatusId": transactionStatusId,
      "transactionStatusName": transactionStatusName,
      "transactionStatusCode": transactionStatusCode,
      "remarks": remarks,
      "workFlowId": workFlowId,
      "workFlowName": workFlowName,
      "isEnabled": isEnabled,
      "issueDate": issueDate,
      "expiryDate": expiryDate,
      "documentNo": documentNo,
      "documentFilePath": documentFilePath,
      "documentFileName": documentFileName,
      "fileSource": fileSource,
      "attachmentTypeId": attachmentTypeId,
      "isDeleted": isDeleted,
      "attachmentTypeName": attachmentTypeName,
    };
  }

  factory InsertAttachmentRequest.fromMap(Map<String, dynamic> map) {
    return InsertAttachmentRequest(
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
      issueDate: map['issueDate'] as String,
      expiryDate: map['expiryDate'] as String,
      documentNo: map['documentNo'] as String,
      documentFilePath: map['documentFilePath'] as String,
      documentFileName: map['documentFileName'] as String,
      fileSource: map['fileSource'] as String,
      attachmentTypeId: map['attachmentTypeId'] as int,
      isDeleted: map['isDeleted'] as bool,
      attachmentTypeName: map['attachmentTypeName'] as String,
    );
  }
}
