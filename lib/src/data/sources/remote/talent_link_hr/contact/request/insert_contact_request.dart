import 'package:json_annotation/json_annotation.dart';

part 'insert_contact_request.g.dart';

@JsonSerializable()
class InsertContactRequest {
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
  @JsonKey(name: 'contactName')
  final String contactName;
  @JsonKey(name: 'contactTypeId')
  final String contactTypeId;
  @JsonKey(name: 'contactNo')
  final String contactNo;
  @JsonKey(name: 'isDeleted')
  final bool isDeleted;

  InsertContactRequest({
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
    required this.contactName,
    required this.contactTypeId,
    required this.contactNo,
    required this.isDeleted,
  });

  factory InsertContactRequest.fromJson(Map<String, dynamic> json) =>
      _$InsertContactRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InsertContactRequestToJson(this);

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
      "contactName": contactName,
      "contactTypeId": contactTypeId,
      "contactNo": contactNo,
      "isDeleted": isDeleted,
    };
  }

  factory InsertContactRequest.fromMap(Map<String, dynamic> map) {
    return InsertContactRequest(
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
      contactName: map['contactName'] as String,
      contactTypeId: map['contactTypeId'] as String,
      contactNo: map['contactNo'] as String,
      isDeleted: map['isDeleted'] as bool,
    );
  }
}
